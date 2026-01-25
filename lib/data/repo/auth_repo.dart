import 'dart:developer';
import 'dart:io';
import 'package:dofix_technichian/app/BookingEditScreen/booking_edit_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/app_constants.dart';
import '../api/api.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<bool> saveUserToken(
    String token,
  ) async {
    log("Inside save token and token is : $token");
    apiClient.token = token;
    await apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.token, token);
  }

  Future<bool> isLoggedIn() async {
    final String? isTokenAvailable =
        await sharedPreferences.getString(AppConstants.token);
    //debugPrint("isTokenAvailable: $isTokenAvailable");
    return isTokenAvailable != null && isTokenAvailable.isNotEmpty;
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.token) ?? "";
  }

  Future<bool> clearSharedData() async {
    await sharedPreferences.remove(AppConstants.token);
    return true;
  }

  Future<Response> sendOtpRepo(
    String? phoneNo,
  ) async {
    return await apiClient.postData(AppConstants.sendOtp,
        {"phone": "+91$phoneNo", "user_type": "provider-admin"});
  }

  Future<Response> getServiceCategoryRepo() async {
    return await apiClient.postData(AppConstants.getServiceCategory, {});
  }

  Future<Response> verifyOtp(
      String? phoneNo, String? otp, String? fcmToken) async {
    return await apiClient.postData(AppConstants.verifyOtp, {
      "phone": "+91$phoneNo",
      "otp": otp ?? "",
      "fcmToken": fcmToken ?? "",
      "user_type": "provider-admin"
    });
  }

  Future<Response> register(
      {required String companyName,
      required String fullName,
      required String email,
      required String contactNumber,
      required String alternativeNumber,
      required String adharNumber,
      required String panNumber,
      required String drivingLicencesNumber,
      required String accountHolderName,
      required String accountName,
      required String branchName,
      required String ifscCode,
      required String cancelchequeNumber,
      required File? adharImage,
      required File? panImage,
      required File? drivingLicencesImage,
      required File? cancelchequeImage,
      required File? profileImage,
        required File? passbookImage,
      required String? lat,
      required String? long,
      required String? zoneId,
      required String? companyAddress,
      required String categoryId}) async {
    return await apiClient.postMultipartData(AppConstants.register, {
      "company_name": companyName,
      "full_name": fullName,
      "email": email,
      "contact_number": "+91${contactNumber}",
      "alt_contact_number": "+91${alternativeNumber}",
      // "location": "8979",
      "category_id": categoryId,
      "adhar_number": adharNumber,
      "pan_number": panNumber,
      "dl_number": drivingLicencesNumber,
      "acc_holder_name": accountHolderName,
      "acc_number": accountName,
      "branch_name": branchName,
      "ifsc_code": ifscCode,
      "latitude": lat ?? "",
      "longitude": long ?? "",
      "zone_id": zoneId ?? "",
      "user_type": "provider-admin",
      "company_address": companyAddress ?? "",
      "cancel_cheque_number": cancelchequeNumber,
    }, [], [
      MultipartDocument(
        "adhar_img",
        adharImage,
      ),
      MultipartDocument(
        "pan_img",
        panImage,
      ),
      MultipartDocument(
        "dl_img",
        drivingLicencesImage,
      ),
      MultipartDocument(
        "bank_doc",
        cancelchequeImage,
      ),
      MultipartDocument(
        "profile_img",
        profileImage,
      ),
      MultipartDocument(
        "passbook_img",
        passbookImage,
      ),
    ]);
  }

  Future<Response> categories(
    String? limit,
    String? offset,
  ) async {
    return await apiClient.getData(AppConstants.category,
        query: {
          "limit": limit,
          "offset": offset,
        },
        method: "GET");
  }

  Future<Response> service(
    String? limit,
    String? offset,
  ) async {
    return await apiClient.getData(AppConstants.service,
        query: {
          "limit": limit,
          "offset": offset,
        },
        method: "GET");
  }

  Future<Response> serviceDetails(String id) async {
    return await apiClient.getData(AppConstants.serviceDetails,
        query: {"id": id}, method: "GET");
  }

  Future<Response> bookingDetails(String id) async {
    return await apiClient.getData(AppConstants.bookingDetails + id,
        method: "GET");
  }

  Future<Response> booking(dynamic body) async {
    return await apiClient.postData(AppConstants.booking, body);
  }

  Future<Response> getBookingDueAmountRepo(dynamic body) async {
    return await apiClient.postData(AppConstants.getBookingDueAmount, body);
  }

  Future<Response> updateBookingDueAmountRepo(dynamic body) async {
    return await apiClient.postData(AppConstants.updateBookingDueAmount, body);
  }

  Future<Response> getProviderInfo() async {
    return await apiClient.getData(AppConstants.providerInfo, method: "GET");
  }

  Future<Response> addExtraServicesRepo(dynamic body) async {
    return await apiClient.postData(AppConstants.addonServices, body);
  }

  Future<Response> zones(
    String? latitude,
    String? longitude,
  ) async {
    return await apiClient.getData(AppConstants.zones,
        query: {
          "lat": latitude,
          "lng": longitude,
        },
        method: "GET");
  }

  Future<Response> pages() async {
    return await apiClient.getData(AppConstants.pages, method: "GET");
  }

  Future<Response> categoriesToServices(
      String? id, String? limit, String? offset) async {
    return await apiClient.getData(AppConstants.categoriesToServices,
        query: {
          "limit": limit,
          "offset": offset,
          "sub_category_id": id,
        },
        method: "GET");
  }

  Future<Response> getBookingDetails(
      String? id, String? limit, String? offset) async {
    return await apiClient.getData(AppConstants.categoriesToServices,
        query: {
          "limit": limit,
          "offset": offset,
          "sub_category_id": id,
        },
        method: "GET");
  }

  Future<Response> categoriesToSubCategories(
      String? id, String? limit, String? offset) async {
    return await apiClient.getData(AppConstants.categoriesToSubCategories,
        query: {
          "limit": limit,
          "offset": offset,
          "id": id,
        },
        method: "GET");
  }

  Future<Response> getAccountInfo() async {
    return await apiClient.getData(AppConstants.accountInfo, method: "GET");
  }

  Future<Response> addressData(
    String? latitude,
    String? longitude,
  ) async {
    return await apiClient.getData(AppConstants.geoCodeLocation,
        query: {
          "lat": latitude,
          "lng": longitude,
        },
        method: "GET");
  }

  Future<Response> banners() async {
    return await apiClient.getData(
      AppConstants.banners,
      query: {
        "limit": "100",
        "offset": "1",
      },
      method: "GET",
    );
  }

  Future<Response> getReviewsResponse() async {
    return await apiClient.getData(
      AppConstants.reviewLists,
      query: {
        "limit": "100",
        "offset": "1",
        "status": "all",
      },
      method: "GET",
    );
  }

  Future<Response> getBookingCounts() async {
    return await apiClient.getData(
      AppConstants.homeStats,
      method: "GET",
    );
  }

  Future<Response> listOfBookings(dynamic body) async {
    debugPrint("====> API body of listofBookings: $body");
    return await apiClient.postData(
      AppConstants.booking,
      body,
    );
  }

  Future<Response> updateBookingStatus(
      Map<String, String> body, List<MultipartBody> files) async {
    debugPrint("====> API body of listofBookings: $body");
    debugPrint("====> API body of listofBookings files : ${files.length}");
    return await apiClient.postMultipartData(
      AppConstants.updateBookingStatus,
      body,
      files,
      [],
    );
  }

  Future<Response> bookings(Map<String, String> query) async {
    return await apiClient
        .postMultipartData(AppConstants.bookingSecond, query, [], []);
  }

  getMonthlyDashBoardChartData(String year, String month) async {
    log("Chart month api called : ${AppConstants.dashboardUri}?sections=earning_stats&stats_type=full_month&month=$month&year=$year");
    return await apiClient.getData(
        "${AppConstants.dashboardUri}?sections=earning_stats&stats_type=full_month&month=$month&year=$year",
        method: "GET");
  }

  getYearlyDashBoardChartData(String year) {
    return apiClient.getData(
        "${AppConstants.dashboardUri}?sections=earning_stats&stats_type=full_year&year=$year",
        method: "GET");
  }

  /// Get config data
  Future<Response> getConfigData() async {
    Response response =
        await apiClient.getData(AppConstants.configUri, method: "GET");
    return response;
  }

  Future<Response> getBookingPriceList(String zoneId, String serviceInfo) {
    return apiClient.getData(
        "${AppConstants.getBookingPriceList}?zone_id=$zoneId&service_info=$serviceInfo",
        method: "GET");
  }

  Future<Response> updateBooking(
      {required BookingEditType bookingEditType,
      String? bookingId,
      String? subBookingId,
      String? zoneId,
      String? paymentStatus,
      String? servicemanId,
      String? bookingStatus,
      String? serviceSchedule,
      String? serviceInfo,
      bool? changeNextAllBooking}) {
    return apiClient.getData(AppConstants.updateRegularBooking,
        body: {
          "_method": "put",
          "booking_id": bookingId ?? "",
          "zone_id": zoneId ?? "",
          "payment_status": paymentStatus ?? "",
          "serviceman_id": servicemanId ?? "",
          "booking_status": bookingStatus ?? "",
          "service_schedule": serviceSchedule ?? "",
          "service_info": serviceInfo ?? "",
          "booking_repeat_id": subBookingId ?? "",
          "next_all_booking_change": changeNextAllBooking == true &&
                  bookingEditType == BookingEditType.repeat
              ? "1"
              : "0"
        },
        method: "PUT");
  }

  Future<Response> getServiceListBasedOnSubcategory(String subCategoryId,
      {String queryText = ""}) async {
    return await apiClient.getData(
        "${AppConstants.serviceListBasedOnSubCategory}?limit=100&offset=1&sub_category_id=$subCategoryId&search=$queryText",
        method: "Get");
  }
}
