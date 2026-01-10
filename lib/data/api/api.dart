import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import '../../utils/app_constants.dart';

import 'package:flutter/foundation.dart' as foundation;
import 'package:http/http.dart' as http;

class ApiClient extends GetxController implements GetxService {
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  static const String noInternetMessage =
      'Connection to API server failed due to internet connection';
  final int timeoutInSeconds = 1800;
  String? token;
  String? email;
  String? image;
  String? id;
  String? lastName;

  late Map<String, String> mainHeaders;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    token = sharedPreferences.getString(AppConstants.token);
    log('Token: $token');
    updateHeader(token, "e8554d44-dcf2-47c7-8cf9-400d05a1340f");
  }

  Future<void> updateHeader([String? token, String? zoneId]) async {
    mainHeaders = {
      // 'Content-Type': 'application/json; charset=UTF-8',
      // 'Accept' : 'application/json',
      'Authorization': 'Bearer $token',
      'zoneID': zoneId ?? "e8554d44-dcf2-47c7-8cf9-400d05a1340f",
    };
    log("Api main header ================>${mainHeaders} ");
    update();
  }

  // Future<Response> getData(String uri, {Map<String, dynamic>? query, Map<String, String>? headers}) async {
  //   try {
  //     log('====> API Call: $uri\nHeader: $mainHeaders');
  //     http.Response response = await http.get(
  //       Uri.parse(appBaseUrl+uri),
  //       headers: headers ?? mainHeaders,
  //     ).timeout(Duration(seconds: timeoutInSeconds));
  //     print('====> API Response: ${response.body}');
  //     return handleResponse(response, uri);
  //   } catch (e) {
  //     return const Response(statusCode: 1, statusText: noInternetMessage);
  //   }
  // }

  Future<Response> getData(
    String uri, {
    Map<String, dynamic>? query,
    Map<String, String>? headers,
    String method = 'POST', // Default method
    dynamic body,
  }) async {
    try {
      final uriWithQuery = query != null
          ? Uri.parse('$appBaseUrl$uri').replace(queryParameters: query)
          : Uri.parse('$appBaseUrl$uri');
      log('====> API Call: $uriWithQuery\nHeader: ${headers ?? mainHeaders}');
      log('====> API body: $body}');

      http.Response response;

      // switch (method.toUpperCase()) {
      //   case 'GET':
      //     response = await http.get(uriWithQuery, headers: headers ?? mainHeaders)
      //         .timeout(Duration(seconds: timeoutInSeconds));
      //     break;
      //   case 'POST':
      //     response = await http.post(uriWithQuery, headers: headers ?? mainHeaders, body: body)
      //         .timeout(Duration(seconds: timeoutInSeconds));
      //     break;
      //   case 'PUT':
      //     response = await http.put(uriWithQuery, headers: headers ?? mainHeaders, body: body)
      //         .timeout(Duration(seconds: timeoutInSeconds));
      //     break;
      //   case 'DELETE':
      //     response = await http.delete(uriWithQuery, headers: headers ?? mainHeaders)
      //         .timeout(Duration(seconds: timeoutInSeconds));
      //     break;
      //   case 'PATCH':
      //     response = await http.patch(uriWithQuery, headers: headers ?? mainHeaders, body: body)
      //         .timeout(Duration(seconds: timeoutInSeconds));
      //     break;
      //   default:
      //     throw UnsupportedError('HTTP method not supported');
      // }

      switch (method.toUpperCase()) {
        case 'GET':
          response = await http
              .get(uriWithQuery, headers: headers ?? mainHeaders)
              .timeout(Duration(seconds: timeoutInSeconds));
          break;
        case 'POST':
          response = await http
              .post(uriWithQuery,
                  headers: headers ?? mainHeaders, body: jsonEncode(body))
              .timeout(Duration(seconds: timeoutInSeconds));
          break;
        case 'PUT':
          response = await http
              .put(uriWithQuery, headers: headers ?? mainHeaders, body: body)
              .timeout(Duration(seconds: timeoutInSeconds));
          break;
        case 'DELETE':
          response = await http
              .delete(uriWithQuery, headers: headers ?? mainHeaders)
              .timeout(Duration(seconds: timeoutInSeconds));
          break;
        default:
          throw UnsupportedError('HTTP method not supported');
      }

      debugPrint('====> API Response: ${response.body}');
      return handleResponse(response, uri);
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postData(String uri, Map<String, String> fields,
      {Map<String, String>? headers}) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(appBaseUrl + uri));
      request.fields.addAll(fields);
      request.headers.addAll(headers ?? mainHeaders);
      log('Url : ${appBaseUrl + uri}');
      log('====> API Call: $uri\nHeader: ${request.headers}');
      log('====> API Body: $fields');

      http.StreamedResponse response =
          await request.send().timeout(Duration(seconds: timeoutInSeconds));

      String responseBody = await response.stream.bytesToString();
      debugPrint('====> API Response: $responseBody');

      return Response(
        body: responseBody,
        statusCode: response.statusCode,
        statusText: response.reasonPhrase,
      );
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> postMultipartData(
    String uri,
    Map<String, String> body,
    List<MultipartBody> multipartBody,
    List<MultipartDocument> otherFile, {
    Map<String, String>? headers,
  }) async {
    try {
      http.MultipartRequest request =
          http.MultipartRequest('POST', Uri.parse(appBaseUrl + uri));
      request.headers.addAll(headers ?? mainHeaders);

      // Upload images
      for (MultipartBody multipart in multipartBody) {
        if (multipart.file != null && multipart.file!.path.isNotEmpty) {
          String? mimeType = lookupMimeType(multipart.file!.path);
          MediaType mediaType =
              MediaType.parse(mimeType ?? 'application/octet-stream');

          http.MultipartFile part = await http.MultipartFile.fromPath(
            multipart.key,
            multipart.file!.path,
            contentType: mediaType,
          );
          request.files.add(part);
        }
      }

      // Upload other files
      for (MultipartDocument file in otherFile) {
        if (file.file != null && file.file!.path.isNotEmpty) {
          File other = File(file.file!.path);
          http.MultipartFile part = await http.MultipartFile.fromPath(
            file.key,
            other.path,
          );
          request.files.add(part);
        }
      }

      request.fields.addAll(body);

      // Debugging API Request
      log("====> API Request Fields: ${request.fields}");
      log("====> API Request Fields: ${request.files}");
      for (var file in request.files) {
        log("File: ${file.field} - ${file.filename} (${file.length} bytes)");
      }

      // Send request
      http.Response response =
          await http.Response.fromStream(await request.send());
      log('====> API Response Code: ${response.body}');
      return handleResponse(response, uri);
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> putData(String uri, dynamic body,
      {Map<String, String>? headers}) async {
    try {
      //log('====> API Call: $uri\nHeader: $mainHeaders');
      //log('====> API Body: $body');
      http.Response response = await http
          .put(
            Uri.parse(appBaseUrl + uri),
            body: jsonEncode(body),
            headers: headers ?? mainHeaders,
          )
          .timeout(Duration(seconds: timeoutInSeconds));
      return handleResponse(response, uri);
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Future<Response> deleteData(String uri,
      {Map<String, String>? headers}) async {
    try {
      //log('====> API Call: $uri\nHeader: $mainHeaders');
      http.Response response = await http
          .delete(
            Uri.parse(appBaseUrl + uri),
            headers: headers ?? mainHeaders,
          )
          .timeout(
            Duration(
              seconds: timeoutInSeconds,
            ),
          );
      return handleResponse(response, uri);
    } catch (e) {
      return const Response(statusCode: 1, statusText: noInternetMessage);
    }
  }

  Response handleResponse(http.Response response, String uri) {
    dynamic body;
    log("********* ${response.body} & ${response.statusCode} *********");
    try {
      body = jsonDecode(response.body);
    } catch (_) {}
    Response response0 = Response(
      body: body ?? response.body,
      bodyString: response.body.toString(),
      headers: response.headers,
      statusCode: response.statusCode,
      statusText: response.reasonPhrase,
    );
    if (response0.statusCode != 200 &&
        response0.body != null &&
        response0.body is! String) {
      response0 = Response(
          statusCode: response0.statusCode,
          body: response0.body,
          statusText: response0.body['errors']['message']);
    } else if (response0.statusCode != 200 && response0.body == null) {
      response0 = const Response(statusCode: 0, statusText: noInternetMessage);
    } else {
      response0 = Response(
          statusCode: response0.statusCode,
          body: response0.body,
          statusText: response0.body['message']);
    }
    log('====> API Response: [${response0.statusCode}] $uri\n${response.body}');
    return response0;
  }
}

class MultipartBody {
  String key;
  File? file;

  MultipartBody(this.key, this.file);
}

class MultipartDocument {
  String key;
  File? file;

  MultipartDocument(this.key, this.file);
}
