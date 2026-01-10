import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:dofix_technichian/model/service_category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/api/api.dart';
import '../data/repo/auth_repo.dart';
import '../helper/route_helper.dart';
import '../utils/app_constants.dart';
import '../widgets/common_loading.dart';
import '../widgets/custom_snack_bar.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  final SharedPreferences sharedPreferences;

  AuthController({
    required this.authRepo,
    required this.sharedPreferences,
  });

  DateTime? lastBackPressTime;

  TextEditingController addressController = TextEditingController();
  String? token;
  final RxString phoneNumber = ''.obs;

  Future<bool> handleOnWillPop() async {
    final now = DateTime.now();

    if (lastBackPressTime == null ||
        now.difference(lastBackPressTime!) > const Duration(seconds: 2)) {
      updateLastBackPressTime(now);
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Press back again to exit'),
          duration: Duration(seconds: 2),
        ),
      );
      SystemNavigator.pop();
      return Future.value(false);
    }
    return Future.value(true);
  }

  void updateLastBackPressTime(DateTime time) {
    lastBackPressTime = time;
    update();
  }

  DateTime? _lastBackPressTime;
  String companyName = "";
  String fullName = "";
  String contactNumber = "";
  String alternativeNumber = "";
  String email = "";
  String adharNumber = "";
  File? adharImage = File("");
  String panNumber = "";
  File? panImage = File("");
  String drivingLicencesNumber = "";
  File? drivingLicencesImage = File("");
  String accountHolderName = "";
  String accountName = "";
  String branchName = "";
  String ifscCode = "";
  String cancelchequeNumber = "";
  String profileNumber = "";
  File? cancelchequeImage = File("");
  File? profileImage = File("");

  Future<bool> willPopCallback() async {
    final now = DateTime.now();
    if (_lastBackPressTime == null ||
        now.difference(_lastBackPressTime!) > const Duration(seconds: 2)) {
      _lastBackPressTime = now;
      Get.showSnackbar(
        GetSnackBar(
          message: 'Press back again to exit',
          duration: Duration(seconds: 2),
        ),
      );
      return Future.value(false);
    }
    SystemNavigator.pop(); // Closes the app
    update();
    return Future.value(true);
  }

  Future<void> sendOtpApi(String phone) async {
    if (phone.trim().length != 10) {
      showCustomSnackBar("Please enter valid phone number.", isError: true);
      return;
    }
    showLoading();
    update();

    try {
      Response response = await authRepo.sendOtpRepo(phone.trim());

      log('Send Otp API response : $response.body.toString()');
      var responseData = jsonDecode(response.body);

      log('Send Otp API response Data : $responseData');
      if (responseData == null) {
        throw Exception("Response data is null");
      }

      if (response.statusCode == 200) {
        if (responseData["message"]
                ?.toString()
                .contains("OTP sent successfully") ??
            false) {
          debugPrint("OTP: ${responseData['OTP']}");
          phoneNumber.value = phone;
          log("Phone number set: ${phoneNumber.value}");
          hideLoading();
          await Future.delayed(Duration(seconds: 1), () {});
          // TODO : Hidden for deployment
          showCustomSnackBar(
              "${responseData['message']} OTP: ${responseData['OTP']}",
              isError: false,
              isSuccess: true);
          Get.toNamed(RouteHelper.getVerifyOtpRoute(phone));
        } else {
          hideLoading();
          debugPrint("Showing error snackbar...");
          showCustomSnackBar(responseData['message'], isError: false);
          closeSnackBarIfActive();
        }
      } else {
        debugPrint('Failed to send OTP: ${responseData['message']}');
        hideLoading();
        closeSnackBarIfActive();
        showCustomSnackBar(responseData['message'], isError: true);
      }
    } catch (e) {
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      debugPrint("Error sending OTP: $e");
      hideLoading();
      closeSnackBarIfActive();
    } finally {
      // showCustomSnackBar("Something went wrong. Please try again.", isError: true);
      hideLoading();
      update();
    }
  }

  Rxn<ServiceCategoryModel> serviceCategoryModel = Rxn<ServiceCategoryModel>();
  Rxn<String> selectedServiceCategoryId = Rxn<String>();

  Future<void> getServiceCategoryListing() async {
    showLoading();
    update();

    try {
      Response response = await authRepo.getServiceCategoryRepo();
      var responseData = jsonDecode(response.body);

      log('Service category API response Data : $responseData');
      if (responseData == null) {
        throw Exception("Response data is null");
      }

      if (response.statusCode == 200) {
        if (responseData["message"]
                ?.toString()
                .contains("Successfully data fetched") ??
            false) {
          serviceCategoryModel.value =
              ServiceCategoryModel.fromJson(responseData);
          hideLoading();
        } else {
          hideLoading();
          debugPrint("Showing error snackbar...");
          showCustomSnackBar(responseData['message'], isError: false);
          closeSnackBarIfActive();
        }
      } else {
        debugPrint('Failed to send OTP: ${responseData['message']}');
        hideLoading();
        closeSnackBarIfActive();
        showCustomSnackBar(responseData['message'], isError: true);
      }
    } catch (e) {
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      debugPrint("Error sending OTP: $e");
      hideLoading();
      closeSnackBarIfActive();
    } finally {
      hideLoading();
      update();
    }
  }

  Future<void> VerifyOtp(String phone, String otp) async {
    ApiClient apiClient = ApiClient(
        appBaseUrl: AppConstants.baseUrl, sharedPreferences: sharedPreferences);
    if (otp.length != 4) {
      showCustomSnackBar("Please enter a valid 4-digit OTP", isError: true);
      return;
    }

    update();
    try {
      Response response =
          await authRepo.verifyOtp(phone.trim(), otp.trim(), "");

      var responseData = jsonDecode(response.body);
      debugPrint("Response: $responseData");
      if (response.statusCode == 200) {
        debugPrint(" ${responseData.toString()}");
        if (responseData["message"]
            .toString()
            .contains("Successfully registered")) {
          hideLoading();
          await Future.delayed(Duration(seconds: 1), () {});
          // showCustomSnackBar("OTP verified successfully",
          //     isError: false, isSuccess: true);
          if (responseData['content']['RegisterComplete'] == 0) {
            token = responseData['content']['token'];
            // await authRepo.saveUserToken(responseData['content']['token']);
            // log("Token saved : ${sharedPreferences.getString(AppConstants.token)}");
            // log("Token saved response: ${responseData['content']['token']}");
            // await apiClient.updateHeader(responseData['content']['token']);
            hideLoading();
            Get.toNamed(RouteHelper.getAccountSetup(phone.trim()));
          } else {
            await authRepo.saveUserToken(responseData['content']['token']);
            log("Token saved : ${sharedPreferences.getString(AppConstants.token)}");
            log("Token saved response: ${responseData['content']['token']}");
            await apiClient.updateHeader(responseData['content']['token']);
            hideLoading();
            Get.offAllNamed(RouteHelper.getDashboardRoute());
          }
          // Get.toNamed(RouteHelper.getAccountSetup(phone.trim()));
          update();
        } else {
          closeSnackBarIfActive();
          hideLoading();
          showCustomSnackBar(responseData['error'], isError: true);
          update();
        }
      } else {
        closeSnackBarIfActive();
        hideLoading();
        showCustomSnackBar(responseData['error'], isError: true);
        update();
      }
    } catch (e) {
      print("Error sending OTP: $e");
      closeSnackBarIfActive();
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      hideLoading();
    } finally {
      hideLoading();
      update();
    }
  }

  Future<void> register() async {
    showLoading();
    update();
    ApiClient apiClient = ApiClient(
        appBaseUrl: AppConstants.baseUrl, sharedPreferences: sharedPreferences);
    update();
    try {
      var response = await authRepo.register(
        categoryId: selectedServiceCategoryId.value ?? "",
        companyName: companyName,
        fullName: fullName,
        email: email,
        contactNumber: contactNumber,
        alternativeNumber: alternativeNumber,
        adharNumber: adharNumber,
        panNumber: panNumber,
        drivingLicencesNumber: drivingLicencesNumber,
        accountHolderName: accountHolderName,
        accountName: accountName,
        branchName: branchName,
        ifscCode: ifscCode,
        cancelchequeNumber: cancelchequeNumber,
        adharImage: adharImage,
        panImage: panImage,
        drivingLicencesImage: drivingLicencesImage,
        cancelchequeImage: cancelchequeImage,
        profileImage: profileImage,
        lat: Get.find<DashBoardController>().lat,
        long: Get.find<DashBoardController>().long,
        //TODO : Need to update the ZONE ID later for area wise zoneId
        // zoneId: Get.find<DashBoardController>().zoneIdForRegisteration,
        zoneId: "e8554d44-dcf2-47c7-8cf9-400d05a1340f",
        companyAddress: Get.find<DashBoardController>().addressController.text,
      );
      var responseData = response.body;
      debugPrint("Response: ${response.body}");
      debugPrint("Response DATA: $responseData");
      if (response.statusCode == 200) {
        debugPrint("OTP: ${responseData['message']}");
        if (responseData["message"].toString().contains("Successfully added")) {
          showCustomSnackBar(responseData['message'],
              isError: false, isSuccess: true);

          log(token ?? "", name: "Token after registration");
          if ((token ?? "").isNotEmpty) {
            // await authRepo.saveUserToken(token ?? "");
            // await apiClient.updateHeader(token, "");

            hideLoading();
            closeSnackBarIfActive();
            logout();
            update();
            showCustomSnackBar(
                "Registration successful! Login to your account.",
                isError: false,
                isSuccess: true);
            Get.offAllNamed(RouteHelper.login);
            // Get.offAllNamed(RouteHelper.dashboard);
          }
          // update();
        } else {
          hideLoading();
          closeSnackBarIfActive();
          showCustomSnackBar(responseData['message'], isError: true);
        }
      } else {
        hideLoading();
        closeSnackBarIfActive();
        showCustomSnackBar(responseData['message'], isError: true);
        update();
      }
    } catch (e) {
      print("Error sending OTP: $e");
      hideLoading();
      // closeSnackBarIfActive();
      showCustomSnackBar("Something went wrong. Please try again.",
          isError: true);
    } finally {
      hideLoading();
      update();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isLoggedIn();
  }

  Future<bool> isLoggedIn() async {
    bool value = await authRepo.isLoggedIn();
    return value; // Return the value of isLoggedIn
  }

  void logout() {
    ApiClient apiClient = ApiClient(
        appBaseUrl: AppConstants.baseUrl, sharedPreferences: sharedPreferences);
    authRepo.saveUserToken("");
    apiClient.updateHeader("");
    Get.offAllNamed(RouteHelper.getLoginRoute());
  }
}
