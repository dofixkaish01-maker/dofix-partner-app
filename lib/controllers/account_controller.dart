import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dofix_technichian/controllers/dashboard_controller.dart';
import 'package:dofix_technichian/data/repo/account_repo.dart';
import 'package:dofix_technichian/model/account/provider_review_model.dart';
import 'package:dofix_technichian/model/user_profile_model.dart';
import 'package:dofix_technichian/model/wallet_history_model.dart';
import 'package:dofix_technichian/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../app/views/PaymentScreen/payment_Screen.dart';
import '../data/api/api.dart';
import '../model/account/bank_detail_model.dart';
import '../model/account/subscription_detail_model.dart';
import '../model/account/subscription_list_model.dart';
import '../model/account/withdraw_listing_model.dart';
import '../model/account/withdraw_method_model.dart';
import '../widgets/common_loading.dart';
import '../widgets/custom_snack_bar.dart';

class AccountController extends GetxController implements GetxService {
  final AccountRepo accountRepo;
  final SharedPreferences sharedPreferences;
  TextEditingController companyNameController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController alternateNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController aadharCardNumberController = TextEditingController();
  TextEditingController aadharCardImageController = TextEditingController();
  TextEditingController panCardNumberController = TextEditingController();
  TextEditingController panCardImageController = TextEditingController();
  TextEditingController dlCardNumberController = TextEditingController();
  TextEditingController dlCardImageController = TextEditingController();
  String? profileImageUrl;
  File? profileImage;
  String lat = '';
  String lng = '';
  String adharNumber = "";
  File? adharImage = File("");
  String panNumber = "";
  File? panImage = File("");
  String drivingLicencesNumber = "";
  File? drivingLicencesImage = File("");

//Banking Details
  TextEditingController accountHolderNameController = TextEditingController();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  TextEditingController branchNameController = TextEditingController();
  File? cancelledChaqueImage;
  String? cancelledChequeImageUrl;

  AccountController({
    required this.accountRepo,
    required this.sharedPreferences,
  });

  //Wallet Recharge

  Future<void> userWalletRecharge({
    required String providerId,
    required String amount,
  }) async {
    if (amount == '0' || amount.isEmpty) {
      showCustomSnackBar("Please enter a valid amount to recharge.");
      return;
    }
    showLoading();
    Map<String, String> body = {
      'payment_method': 'razor_pay',
      'provider_id': providerId,
      'amount': amount,
    };
    try {
      log("Wallet Recharge Body : $body");
      Response response = await accountRepo.walletRecharge(body: body);
      if (response.statusCode == 200) {
        log("Wallet Recharge : ${response.body}");
        final Map<String, dynamic> data = jsonDecode(response.body);
        String paymentUrl = data['content'];
        log("Wallet Recharge URL : $paymentUrl");
        await Get.to(
          () => PaymentScreen(
            url: paymentUrl,
            redirectIndex: 1,
          ),
        );
      } else {
        log("Wallet Recharge : ${response.body} in else block");
      }
    } catch (e) {
      log("Wallet Recharge : catch : $e");
    } finally {
      hideLoading();
      update();
    }
  }

  //ADjust Balance
  Future<void> adjustMyBalance() async {
    showLoading();
    try {
      Response response = await accountRepo.adjustBalance();
      if (response.statusCode == 200) {
        log("Adjust balance : ${response.body}");
      } else {
        log("Adjust balance : ${response.body}");
      }
    } catch (e) {
      log("Adjust balance : catch");
    } finally {
      hideLoading();
      update();
    }
  }

  //fetch withdrawn methods
  WithdrawMethodModel? withdrawMethodModel;

  Future<void> fetchWithdrawnMethods() async {
    showLoading();
    try {
      Response response = await accountRepo.getWithdrawMethodApi();
      if (response.statusCode == 200) {
        log("Withdraw Methods : ${response.body}");
        withdrawMethodModel = WithdrawMethodModel.fromJson(response.body);
      } else {
        log("Withdraw Methods : ${response.body}");
        withdrawMethodModel = null;
      }
    } catch (e) {
      log("Withdraw Methods : catch $e");
      withdrawMethodModel = null;
    } finally {
      hideLoading();
      update();
    }
  }

  //Withdraw Balance
  WithdrawMethodData? selectedWithdrawMethod;
  final TextEditingController withdrawAmountController =
      TextEditingController();
  final TextEditingController withdrawIdController = TextEditingController();

  Future<void> withdrawMyBalance({required BuildContext context}) async {
    if (withdrawAmountController.text.isEmpty &&
        withdrawAmountController.text != '' &&
        int.parse(withdrawAmountController.text) <= 0) {
      showCustomSnackBar("Please enter a valid amount to withdraw.");
      return;
    } else if (withdrawIdController.text.isEmpty) {
      showCustomSnackBar("Please enter a valid ID for withdrawal.");
      return;
    }
    showLoading();
    try {
      Map<String, String> body = {
        'withdrawal_method_id': selectedWithdrawMethod?.id ?? '',
        'amount': withdrawAmountController.text,
        'withdrawal_method_fields': selectedWithdrawMethod?.methodFields != null
            ? jsonEncode(selectedWithdrawMethod!.methodFields!
                .map((e) => e.toJson())
                .toList())
            : '',
      };
      log("Withdraw Balance Body : $body");
      Response response = await accountRepo.withdrawMyBalance(
        body: body,
      );
      log("Withdraw response : ${response} and body is $body and status code is ${response.statusCode}");
      if (response.statusCode == 200) {
        log("Withdraw Balance : ${response.body}");
        await Get.find<DashBoardController>().getAccountInfo(true);
        await fetchWalletTransactionHistory(Get.find<DashBoardController>()
                .providerDashboardModel
                .content
                ?.providerInfo
                ?.userId ??
            "");
        hideLoading();
        update();
        showCustomSnackBar('Withdrawal request sent to DoFix!',
            isError: false, isSuccess: true);
        Navigator.pop(context);
      } else {
        log("Withdraw Balance : else ${response.body}");
        try {
          final Map<String, dynamic> data = jsonDecode(response.body);
          final String errorMessage = data['errors'] ?? 'Withdrawal failed';
          hideLoading();
          update();
          showCustomSnackBar(errorMessage, isError: true);
        } catch (e) {
          hideLoading();
          update();
          showCustomSnackBar('Withdrawal failed', isError: true);
        }
      }
    } catch (e) {
      log("Withdraw Balance : catch $e");
    }
  }

  //Withdraw listing
  WithdrawListingModel? withdrawListingModel;

  Future<void> fetchWithdrawListing() async {
    showLoading();
    try {
      Response response = await accountRepo.getWithdrawList();
      if (response.statusCode == 200) {
        log("Withdraw Listing : ${response.body}");
        withdrawListingModel = WithdrawListingModel.fromJson(response.body);
      } else {
        log("Withdraw Listing : ${response.body}");
        withdrawListingModel = null;
      }
    } catch (e) {
      log("Withdraw Listing : catch $e");
      withdrawListingModel = null;
    } finally {
      hideLoading();
      update();
    }
  }

  WalletHistoryModel? transactionHistory;
  UserProfileModel? userProfile;
  BankDetailModel? bankDetails;

  Future<void> fetchWalletTransactionHistory(String userId) async {
    showLoading();
    try {
      Response response = await accountRepo.getWalletTransactionHistory(userId);
      if (response.statusCode == 200) {
        log("Wallet History : ${response.body}");
        transactionHistory = WalletHistoryModel.fromJson(response.body);
      } else {
        log("Wallet History : ${response.body}");
        transactionHistory = WalletHistoryModel(
          responseCode: "error",
          message: "No Transaction History found!",
          content: [],
          errors: 1,
        );
      }
    } catch (e) {
      log("Wallet History : catch");
      transactionHistory = WalletHistoryModel(
        responseCode: "error",
        message: "Exception: $e",
        content: [],
        errors: 1,
      );
    } finally {
      hideLoading();
      update();
    }
  }

  Future<void> fetchUserProfile(String id) async {
    showLoading();
    try {
      Response response = await accountRepo.getUserProfile(id);
      if (response.statusCode == 200) {
        log("User Profile : ${response.body}");
        userProfile = UserProfileModel.fromJson(response.body);
        setProfile();
      } else {
        log("User Profile : ${response.body} in else block");
        userProfile = null;
      }
    } catch (e) {
      log("User Profile : catch : $e");
      userProfile = null;
    } finally {
      hideLoading();
      update();
    }
  }

  // status
  @override
  void onInit() {
    super.onInit();
    syncAccountStatusFromDashboard(); // sirf API call
  }

  int? accountIsActive;

  void syncAccountStatusFromDashboard() {
    final dashboard = Get.find<DashBoardController>();

    accountIsActive =
        dashboard.providerDashboardModel.content?.providerInfo?.isActive ?? 0;

    log("isActive (Dashboard) => $accountIsActive");
    update();
  }

  //Provider Reviews

  List<ProviderReview>? providerReviews;

  Future<void> fetchProviderReviews() async {
    showLoading();
    try {
      Response response = await accountRepo.getProviderReviews();
      if (response.statusCode == 200) {
        log("Provider Reviews : ${response.body}");
        final List<dynamic> reviewsJson =
            response.body['content']['reviews'] ?? [];
        providerReviews =
            reviewsJson.map((e) => ProviderReview.fromJson(e)).toList();
      } else {
        log("Provider Reviews : ${response.body} in else block");
        providerReviews = [];
      }
    } catch (e) {
      log("Provider Reviews : catch : $e");
      providerReviews = [];
    } finally {
      hideLoading();
      update();
    }
  }

  List<PackageModel>? packages;

  Future<void> fetchSubscriptionPackages() async {
    showLoading();
    try {
      Response response = await accountRepo.getSubscriptionPackagesList();
      if (response.statusCode == 200) {
        log("Subscription packages :  : ${response.body}");
        packages = (response.body['content'] as List)
            .map((e) => PackageModel.fromJson(e))
            .toList();
      } else {
        log("Subscription packages :  :  ${response.body} in else block");
        packages = [];
      }
    } catch (e) {
      log("Subscription packages :  :  catch : $e");
      packages = [];
    } finally {
      hideLoading();
      update();
    }
  }

  Future<void> purchasePlanApi({
    required String packageId,
  }) async {
    ApiClient apiClient = ApiClient(
      appBaseUrl: AppConstants.baseUrl,
      sharedPreferences: sharedPreferences,
    );

    var headers = {
      'Content-Type': 'application/json',
      'Authorization': apiClient.mainHeaders["Authorization"].toString(),
    };
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('${AppConstants.baseUrl}${AppConstants.purchasePlan}'),
    );

    request.fields.addAll(
      {
        'package_id': packageId,
        'payment_method': 'razor_pay',
      },
    );
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      Map<String, dynamic> responseData = jsonDecode(responseBody);
      final String content = responseBody;
      log('Purchase Plan Response: ${responseData['content']}');
      await Get.to(() => PaymentScreen(
            url: responseData['content'],
          ));
    } else {
      print('purchas eissue :${response.reasonPhrase}');
    }
  }

  SubscriptionPackage? mySubscriptionDetails;

  Future<void> fetchMySubscriptionDetails() async {
    showLoading();
    try {
      Response response = await accountRepo.getMySubscriptionDetails();
      if (response.statusCode == 200) {
        log("Subscription detail :  : ${response.body}");
        mySubscriptionDetails =
            SubscriptionPackage.fromJson(response.body['content']);
      } else {
        log("Subscription detail :  :  ${response.body} in else block");
      }
    } catch (e) {
      log("Subscription detail :  :  catch : $e");
    } finally {
      hideLoading();
      update();
    }
  }

  void updateLocationValues(String address, String lat, String lng) {
    addressController.text = address;
    this.lat = lat;
    this.lng = lng;
    update();
  }

  void setProfile() {
    companyNameController.text =
        userProfile?.content?.provider?.companyName ?? '';
    fullNameController.text = userProfile?.content?.provider?.fullName ?? '';
    contactNumberController.text =
        removeCountryCode(userProfile?.content?.provider?.contactNumber ?? '');
    alternateNumberController.text = removeCountryCode(
        userProfile?.content?.provider?.altContactNumber ?? '');
    emailController.text = userProfile?.content?.provider?.email ?? '';
    addressController.text =
        userProfile?.content?.provider?.companyAddress ?? '';
    aadharCardNumberController.text =
        userProfile?.content?.provider?.adharNumber ?? '';
    aadharCardImageController.text =
        userProfile?.content?.provider?.adharImg ?? '';
    panCardNumberController.text =
        userProfile?.content?.provider?.panNumber ?? '';
    panCardImageController.text = userProfile?.content?.provider?.panImg ?? '';
    dlCardNumberController.text =
        userProfile?.content?.provider?.dlNumber ?? '';
    dlCardImageController.text = userProfile?.content?.provider?.dlImg ?? '';
    profileImageUrl = userProfile?.content?.provider?.profileImg ?? '';
    lat = userProfile?.content?.provider?.coordinates?.latitude ?? '';
    lng = userProfile?.content?.provider?.coordinates?.longitude ?? '';
  }

  String removeCountryCode(String phoneNumber) {
    if (phoneNumber.startsWith('+91')) {
      return phoneNumber.substring(3);
    }
    return phoneNumber;
  }

  Future<void> fetchBankDetails() async {
    showLoading();
    try {
      Response response = await accountRepo.getBankingDetails();
      if (response.statusCode == 200) {
        log("bank details : ${response.body}");
        bankDetails = BankDetailModel.fromJson(response.body);
        setBankDetails();
      } else {
        log("bank details : ${response.body}");
        bankDetails = null;
      }
    } catch (e) {
      log("bank details : catch");
      bankDetails = null;
    } finally {
      hideLoading();
      update();
    }
  }

  void setBankDetails() {
    accountHolderNameController.text =
        bankDetails?.content?.accHolderName ?? '';
    accountNumberController.text = bankDetails?.content?.accNo ?? '';
    ifscCodeController.text = bankDetails?.content?.ifscCode ?? '';
    branchNameController.text = bankDetails?.content?.branchName ?? '';
    cancelledChequeImageUrl =
        '${AppConstants.cancelChequeImageUrl}${bankDetails?.content?.cancelcheck?[0].bankDocs}';
  }

  void clearProfileVariables() {
    companyNameController.clear();
    fullNameController.clear();
    contactNumberController.clear();
    alternateNumberController.clear();
    emailController.clear();
    addressController.clear();
    aadharCardNumberController.clear();
    aadharCardImageController.clear();
    panCardNumberController.clear();
    panCardImageController.clear();
    dlCardNumberController.clear();
    dlCardImageController.clear();
    profileImage = null;
    lat = '';
    lng = '';
    adharImage = null;
    panImage = null;
    drivingLicencesImage = null;
    adharNumber = '';
    panNumber = '';
    drivingLicencesNumber = '';
  }

  Future<void> updateBankDetails() async {
    showLoading();

    try {
      if (accountHolderNameController.text.isEmpty) {
        hideLoading();
        showCustomSnackBar("Account holder name is required.");
        return;
      }
      if (accountNumberController.text.isEmpty) {
        hideLoading();
        showCustomSnackBar("Account number is required.");
        return;
      }
      if (ifscCodeController.text.isEmpty) {
        hideLoading();
        showCustomSnackBar("IFSC code is required.");
        return;
      }
      if (branchNameController.text.isEmpty) {
        hideLoading();
        showCustomSnackBar("Branch name is required.");
        return;
      }

      Response response = await accountRepo.updateBankDetails(
        branchName: branchNameController.text,
        accNo: accountNumberController.text,
        accHolderName: accountHolderNameController.text,
        ifscCode: ifscCodeController.text,
        cancelChequeImage: cancelledChaqueImage,
      );

      if (response.statusCode == 200) {
        log("Bank details updated successfully: ${response.body}");
        if (Get.isOverlaysOpen) {
          hideLoading();
        }
        showCustomSnackBar("Bank details updated successfully.",
            isSuccess: true, isError: false);

        update();
      } else {
        log("Failed to update bank details: ${response.body}");
      }
    } catch (e) {
      log("Update Bank Details Exception: $e");
    } finally {
      hideLoading();
      update();
    }
  }

  Future<void> updateProfile() async {
    showLoading();
    try {
      if (contactNumberController.text.isEmpty ||
          contactNumberController.text.length < 10) {
        hideLoading();
        showCustomSnackBar("Please enter a valid 10-digit phone number.",
            isError: true);
        return;
      }
      if (alternateNumberController.text.isNotEmpty &&
          alternateNumberController.text.length < 10) {
        hideLoading();
        showCustomSnackBar(
            "Please enter a valid 10-digit alternate phone number.",
            isError: true);
        return;
      }

      if (emailController.text.isEmpty ||
          !GetUtils.isEmail(emailController.text.trim())) {
        hideLoading();
        showCustomSnackBar("Please enter a valid email address.");
        return;
      }

      if (fullNameController.text.isEmpty) {
        hideLoading();
        showCustomSnackBar("Full name is required.");
        return;
      }
      if (companyNameController.text.isEmpty) {
        hideLoading();
        showCustomSnackBar("Company name is required.");
        return;
      }
      if (addressController.text.isEmpty) {
        hideLoading();
        showCustomSnackBar("Company address is required.");
        return;
      }
      hideLoading();
      if (aadharCardNumberController.text.isEmpty) {
        showCustomSnackBar("Aadhar number is required.");
        return;
      }
      if (panCardNumberController.text.isEmpty) {
        hideLoading();
        showCustomSnackBar("PAN number is required.");
        return;
      }
      if (dlCardNumberController.text.isEmpty) {
        hideLoading();
        showCustomSnackBar("Driving license number is required.");
        return;
      }

      Map<String, dynamic> updateBody = {};

      if (fullNameController.text.isNotEmpty) {
        updateBody['contact_person_name'] = fullNameController.text;
      }
      if (contactNumberController.text.isNotEmpty) {
        updateBody['contact_person_phone'] = contactNumberController.text;
      }
      if (emailController.text.isNotEmpty) {
        updateBody['contact_person_email'] = emailController.text;
      }
      if (companyNameController.text.isNotEmpty) {
        updateBody['company_name'] = companyNameController.text;
      }
      if (alternateNumberController.text.isNotEmpty) {
        updateBody['alt_contact_number'] = alternateNumberController.text;
      }
      if (addressController.text.isNotEmpty) {
        updateBody['company_address'] = addressController.text;
      }
      if (profileImage != null) {
        updateBody['logo'] = profileImage;
      }
      if (lat.isNotEmpty) {
        updateBody['latitude'] = lat;
      }
      if (lng.isNotEmpty) {
        updateBody['longitude'] = lng;
      }
      if (aadharCardNumberController.text.isNotEmpty) {
        updateBody['adhar_number'] = aadharCardNumberController.text;
      }
      if (adharImage != null) {
        updateBody['adhar_img'] = adharImage;
      }
      if (panCardNumberController.text.isNotEmpty) {
        updateBody['pan_number'] = panCardNumberController.text;
      }
      if (panImage != null) {
        updateBody['pan_img'] = panImage;
      }
      if (dlCardNumberController.text.isNotEmpty) {
        updateBody['dl_number'] = dlCardNumberController.text;
      }
      if (drivingLicencesImage != null) {
        updateBody['dl_img'] = drivingLicencesImage;
      }

      Response response = await accountRepo.updateUserProfile(
        companyName: updateBody['company_name'] ?? '',
        contactPersonName: updateBody['contact_person_name'] ?? '',
        contactPersonEmail: updateBody['contact_person_email'] ?? '',
        contactPersonPhone: updateBody['contact_person_phone'] ?? '',
        alternatePhone: updateBody['alt_contact_number'] ?? '',
        adharNumber: updateBody['adhar_number'] ?? '',
        panNumber: updateBody['pan_number'] ?? '',
        drivingLicencesNumber: updateBody['dl_number'] ?? '',
        adharImage: adharImage,
        panImage: panImage,
        drivingLicencesImage: drivingLicencesImage,
        profileImage: profileImage,
        lat: lat,
        long: lng,
        companyAddress: addressController.text,
        zoneId: "e8554d44-dcf2-47c7-8cf9-400d05a1340f",
      );
      if (response.statusCode == 200) {
        log("Profile updated successfully: ${response.body}");
        hideLoading();
        update();
        showCustomSnackBar("Profile updated successfully.",
            isSuccess: true, isError: false);
      } else {
        log("Failed to update profile: ${response.body}");
      }
    } catch (e) {
      log("Update Profile Exception: $e");
    } finally {
      hideLoading();
      update();
    }
  }
}
