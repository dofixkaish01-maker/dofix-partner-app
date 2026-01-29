import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dofix_technichian/data/api/api.dart';
import 'package:dofix_technichian/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/dashboard_controller.dart';
import '../../model/notification/notification_model.dart';

class AccountRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AccountRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> adjustBalance() async {
    return await apiClient.getData(
      AppConstants.adjustMybalance,
      method: "GET",
    );
  }

  static const String _baseUrl =
      'https://panel.dofix.in/api/v1/provider/get-notifications';

 static Future<NotificationModel> fetchNotifications({
    required String token,
    required String userId,
    required String userType,
  }) async {
    final uri = Uri.parse(_baseUrl).replace(
      queryParameters: {
        'user_id': userId,
        'user_type': userType,
      },
    );

    final response = await http.get(
      uri,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return NotificationModel('', '', []).convertToModel(data);
    } else {
      throw Exception(
        'Failed to load notifications (${response.statusCode})',
      );
    }
  }


  Future<Response> getWithdrawMethodApi() async {
    return await apiClient.getData(
      AppConstants.getWithdrawMethods,
      query: {
        'limit': '10',
        'offset': '1',
      },
      method: "GET",
    );
  }

  Future<Response> getWalletTransactionHistory(String userId) async {
    return await apiClient.getData(
      AppConstants.getWalletTransactionList,
      query: {
        "user_id": userId,
      },
      method: "GET",
    );
  }

  Future<Response> getUserProfile(String id) async {
    return await apiClient.getData(
      AppConstants.getUserProfileDetails,
      query: {
        "id": id,
        "limit": "10",
        "offset": "10",
      },
      method: "GET",
    );
  }

  Future<Response> getSubscriptionPackagesList() async {
    return await apiClient.getData(
      AppConstants.getSubscriptionPackagesList,
      method: "GET",
    );
  }

  Future<Response> getMySubscriptionDetails() async {
    return await apiClient.getData(
      AppConstants.getMySubscriptionDetails,
      method: "GET",
    );
  }

  Future<Response> getProviderReviews() async {
    return await apiClient.getData(
      AppConstants.getProviderReview,
      query: {
        "limit": "11",
        "offset": "11",
      },
      method: "GET",
    );
  }

  Future<Response> updateBankDetails({
    required String branchName,
    required String accNo,
    required String accHolderName,
    required String ifscCode,
    required File? cancelChequeImage,
  }) async {
    final Map<String, String> fields = {};
    if (branchName.isNotEmpty) fields["branch_name"] = branchName;
    if (accNo.isNotEmpty) fields["acc_no"] = accNo;
    if (accHolderName.isNotEmpty) fields["acc_holder_name"] = accHolderName;
    if (ifscCode.isNotEmpty) fields["ifsc_code"] = ifscCode;
    fields["provider_id"] = Get.find<DashBoardController>()
            .providerDashboardModel
            .content
            ?.providerInfo
            ?.id ??
        "";

    return await apiClient.postMultipartData(
      AppConstants.updateBankDetails,
      fields,
      [],
      [
        if (cancelChequeImage != null)
          MultipartDocument(
            "cancelchequeImage",
            cancelChequeImage,
          ),
      ],
    );
  }

  Future<Response> updateUserProfile(
      {required String companyName,
      required String contactPersonName,
      required String contactPersonEmail,
      required String contactPersonPhone,
      required String alternatePhone,
      required String adharNumber,
      required String panNumber,
      required String drivingLicencesNumber,
      required File? adharImage,
      required File? panImage,
      required File? drivingLicencesImage,
      required File? profileImage,
      required String? lat,
      required String? long,
      required String? companyAddress,
      required String? zoneId}) async {
    final Map<String, String> fields = {};

    if (companyName.isNotEmpty) fields["company_name"] = companyName;
    if (contactPersonName.isNotEmpty) {
      fields["contact_person_name"] = contactPersonName;
    }
    if (contactPersonEmail.isNotEmpty) {
      fields["contact_person_email"] = contactPersonEmail;
    }
    if (contactPersonPhone.isNotEmpty) {
      fields["contact_person_phone"] = "+91$contactPersonPhone";
    }
    log("Alternate Phone: $alternatePhone");
    if (alternatePhone.isNotEmpty) {
      fields["alt_contact_number"] = "+91$alternatePhone";
    }
    if (adharNumber.isNotEmpty) fields["adhar_number"] = adharNumber;
    if (panNumber.isNotEmpty) fields["pan_number"] = panNumber;
    if (drivingLicencesNumber.isNotEmpty) {
      fields["dl_number"] = drivingLicencesNumber;
    }
    if (lat != null && lat.isNotEmpty) fields["latitude"] = lat;
    if (long != null && long.isNotEmpty) fields["longitude"] = long;
    if (zoneId != null && zoneId.isNotEmpty) fields["zone_id"] = zoneId;
    if (companyAddress != null && companyAddress.isNotEmpty) {
      fields["company_address"] = companyAddress;
    }
    return await apiClient.postMultipartData(
      AppConstants.updateUserProfileDetails,
      fields,
      [],
      [
        if (adharImage != null)
          MultipartDocument(
            "adhar_img",
            adharImage,
          ),
        if (panImage != null)
          MultipartDocument(
            "pan_img",
            panImage,
          ),
        if (drivingLicencesImage != null)
          MultipartDocument(
            "dl_img",
            drivingLicencesImage,
          ),
        if (profileImage != null)
          MultipartDocument(
            "logo",
            profileImage,
          ),
      ],
    );
  }

  Future<Response> getBankingDetails() async {
    return await apiClient.getData(
      AppConstants.getBankDetails,
      method: "GET",
    );
  }

  Future<Response> walletRecharge({required Map<String, String> body}) async {
    return await apiClient.postData(AppConstants.walletRecharge, body);
  }

  Future<Response> withdrawMyBalance(
      {required Map<String, String> body}) async {
    return await apiClient.postData(AppConstants.withdrawBalance, body);
  }

  Future<Response> getWithdrawList() async {
    return await apiClient.getData(
      AppConstants.withdrawBalance,
      query: {
        "limit": "100",
        "offset": "1",
      },
      method: "GET",
    );
  }
}
