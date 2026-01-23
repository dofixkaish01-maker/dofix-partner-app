import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dofix_technichian/app/BookingEditScreen/booking_edit_screen.dart';
import 'package:dofix_technichian/controllers/auth_controller.dart';
import 'package:dofix_technichian/model/addon_cart_model.dart';
import 'package:dofix_technichian/model/booking_count_response.dart';
import 'package:dofix_technichian/model/booking_details_content/booking_details_model.dart';
import 'package:dofix_technichian/model/extra_services_model.dart';
import 'package:dofix_technichian/model/review_response.dart';
import 'package:dofix_technichian/model/saved_add_on_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app/views/account/account_screen.dart';
import '../app/views/bookingScreen/booking_screen.dart';
import '../app/views/dashboard/dashboard_screen.dart';
import '../app/views/home/SubScreens/category_to_services.dart';
import '../app/views/home/home_screen.dart';
import '../app/views/naya_kaam/naya_kaam.dart';
import '../app/views/naya_kaam/service_details_screen.dart';
import '../app/views/no_service_screen.dart';
import '../app/widgets/custom_wallet_balance.dart';
import '../data/api/api.dart';
import '../data/repo/auth_repo.dart';
import '../helper/route_helper.dart';
import '../model/ConfigModel/config_model.dart';
import '../model/MonthlyStats/monthly_stats.dart';
import '../model/booking_details_content/booking_details_content.dart';
import '../model/booking_model.dart' as booking;
import '../model/booking_status/booking_status.dart';
import '../model/category_model.dart';
import '../model/pages_model.dart';
import '../model/provider_dashboard_model.dart';
import '../model/provider_model.dart';
import '../model/service_model.dart';
import '../utils/app_constants.dart';
import '../utils/date_converter.dart';
import '../views/ReviewScreen/review_screen.dart';
import '../widgets/common_loading.dart';
import '../widgets/custom_snack_bar.dart';
import '../../model/service_model_second/service_model_second.dart'
    as scService;

class DashBoardController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  final SharedPreferences sharedPreferences;

  DashBoardController({
    required this.authRepo,
    required this.sharedPreferences,
  });

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // handleLocationPermission(Get.context!);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      debugPrint("DashboardScreen initState");
      //TODO: Unwanted function call on controller initialization
      // getListOfBookings();
    });
    getAccountOverview();
  }

  RxInt accountIsActive = (-1).obs;

  Future<void> getAccountOverview() async {
    try {
      final response = await authRepo.getAccountInfo();

      // OWNER STATUS (YEH 0 AARHA HAI TUMHARE RESPONSE ME)
      final rawIsActive =
          response.body?['content']?['provider_info']?['owner']?['is_active'];

      accountIsActive.value = rawIsActive == 1 ? 1 : 0;

      debugPrint("OWNER accountIsActive => ${accountIsActive.value}");
    } catch (e) {
      accountIsActive.value = 0;
    }
  }

  RxInt registrationFeeStatus = 0.obs;

  Future<int> isRegistrationFees() async {
    try {
      final response = await authRepo.getAccountInfo();

      registrationFeeStatus.value =
          response.body?['content']?['provider_info']?['registration_fee_status'] ?? 0;

      return registrationFeeStatus.value;
    } catch (err) {
      debugPrint("Error in isRegistrationFees: $err");
      return 0;
    }
  }


  bool _isLoginLoading = false;
  CategoryModel? categoryList = CategoryModel(data: []);
  Services? servicesListing = Services(data: []);
  Services? categoriesToServiceListing = Services(data: []);
  SubCategoryModel? subCategoryModelListing = SubCategoryModel(data: []);
  ServiceModel serviceModel = ServiceModel();
  booking.BookingList bookingModel = booking.BookingList(data: []);
  BookingModel bookingModelSecond = BookingModel(data: []);

  ConfigModel _configModel = ConfigModel();

  ConfigModel get configModel => _configModel;
  List<scService.ServiceModel>? _serviceList;

  List<scService.ServiceModel>? get serviceList => _serviceList;

  String? address = "";
  List<String> banners1 = [];
  List<String> banner2 = [];
  List<subcategories> selectedSubCategories = [];
  TextEditingController addressController = TextEditingController();
  String lat = "";
  String long = "";
  String zoneIdForRegisteration = "";

  File? _capturedImage;

  File? get capturedImage => _capturedImage;

  void setCapturedImage(File? file) {
    _capturedImage = file;
    log("Captured Image Path Controller setCapturedImagePath: $_capturedImage");
    update();
  }

  List<File> _jobStartImages = [];

  List<File> get jobStartImages => _jobStartImages;

  void addJobStartImage(File file) {
    _jobStartImages.add(file);
    update();
  }

  void clearJobStartMedia() {
    _jobStartImages.clear();
    jobStartVideo = null;
    update();
  }

  File? jobStartVideo;

  void setJobStartVideo(File file) {
    jobStartVideo = file;
    update();
  }

  ApiResponse apiResponse = ApiResponse(
      responseCode: '',
      message: '',
      content: ContentData(images: PolicyImages()),
      errors: []);

  void updateLatLong(String lat, String long) {
    this.lat = lat;
    this.long = long;
    update();
  }

  void updateAddress(String address) {
    this.addressController.text = address;
    update();
  }

  Future<void> getData(String limit, String offset) async {
    try {
      Response response = await authRepo.categories(limit, offset);
      var responseData = response.body;

      if (responseData == null) {
        throw Exception("Response data is null");
      }
      debugPrint("Category Listing===>: $responseData");

      if (response.statusCode == 200) {
        if (responseData['message']
            .toString()
            .contains("Successfully data fetched")) {
          categoryList = CategoryModel.fromJson(responseData['content']);
          update();
        } else {
          closeSnackBarIfActive();
          showCustomSnackBar(responseData['message'], isError: true);
        }
      } else {
        closeSnackBarIfActive();
        showCustomSnackBar(responseData['message'], isError: true);
      }
    } catch (e) {
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      debugPrint("Error fetching categories: $e");
      closeSnackBarIfActive();
    } finally {
      _isLoginLoading = false;
      // showCustomSnackBar("Something went wrong. Please try again.", isError: true);
      hideLoading();
      // update();
    }
  }

  Future<void> getServices(String limit, String offset) async {
    showLoading();
    update();
    try {
      Response response = await authRepo.service(limit, offset);
      var responseData = response.body;

      if (responseData == null) {
        throw Exception("Response data is null");
      }
      debugPrint("Response data: $responseData");

      if (response.statusCode == 200) {
        if (responseData['message']
            .toString()
            .contains("Successfully data fetched")) {
          servicesListing = Services.fromJson(responseData['content']);
          hideLoading();
          update();
        } else {
          hideLoading();

          closeSnackBarIfActive();
          showCustomSnackBar(responseData['message'], isError: true);
        }
      } else {
        hideLoading();

        closeSnackBarIfActive();
        showCustomSnackBar(responseData['message'], isError: true);
      }
    } catch (e) {
      hideLoading();
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      debugPrint("Error fetching categories: $e");
      closeSnackBarIfActive();
    } finally {
      _isLoginLoading = false;
      // showCustomSnackBar("Something went wrong. Please try again.", isError: true);
      hideLoading();
      // update();
    }
  }

  Future<void> getServicesDetails(
    String id,
  ) async {
    showLoading();
    update();
    try {
      Response response = await authRepo.serviceDetails(id);
      var responseData = response.body;

      if (responseData == null) {
        throw Exception("Response data is null");
      }
      debugPrint("Response data: $responseData");

      if (response.statusCode == 200) {
        if (responseData['message']
            .toString()
            .contains("Successfully data fetched")) {
          serviceModel = ServiceModel.fromJson(responseData['content']);
          hideLoading();
          Get.to(() => ServiceDetails());
          update();
        } else {
          hideLoading();

          closeSnackBarIfActive();
          showCustomSnackBar(responseData['message'], isError: true);
        }
      } else {
        hideLoading();

        closeSnackBarIfActive();
        showCustomSnackBar(responseData['message'], isError: true);
      }
    } catch (e) {
      hideLoading();
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      debugPrint("Error fetching categories: $e");
      closeSnackBarIfActive();
    } finally {
      _isLoginLoading = false;
      // showCustomSnackBar("Something went wrong. Please try again.", isError: true);
      hideLoading();
      // update();
    }
  }

  Future<void> getZone() async {
    ApiClient apiClient = ApiClient(
        appBaseUrl: AppConstants.baseUrl, sharedPreferences: sharedPreferences);
    try {
      Response response =
          await authRepo.zones(latitude.toString(), longitude.toString());
      var responseData = response.body;

      if (responseData == null) {
        hideLoading();
        throw Exception("Response data is null");
      }
      debugPrint("Response data: $responseData");

      if (response.statusCode == 200) {
        if (responseData['message']
            .toString()
            .contains("Successfully data fetched")) {
          debugPrint("Zone: $responseData");
          String? token =
              await sharedPreferences.getString(AppConstants.token).toString();
          apiClient.updateHeader(
              token, responseData['content']['zone']['id'].toString());
          debugPrint(
              "Zone ID: ${responseData['content']['zone']['id'].toString()}");
          // debugPrint("Zone ID: ${apiClient.mainHeaders}");
          await Future.delayed(Duration(milliseconds: 10));
          getLocationDate();
          update();
        } else {
          hideLoading();
          closeSnackBarIfActive();
          showCustomSnackBar(responseData['message'], isError: true);
        }
      } else {
        closeSnackBarIfActive();
        hideLoading();
        showCustomSnackBar(responseData['message'], isError: true);

        screens = [
          NoServiceScreen(
            message: responseData['message'].toString(),
          ),
          NoServiceScreen(
            message: responseData['message'].toString(),
          ),
          NoServiceScreen(
            message: responseData['message'].toString(),
          ),
          NoServiceScreen(
            message: responseData['message'].toString(),
          ),
        ];
        Get.offAll(() => DashboardScreen(pageIndex: 0));
        update();
      }
    } catch (e) {
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      debugPrint("Error fetching categories: $e");
      closeSnackBarIfActive();
    } finally {
      _isLoginLoading = false;
      // showCustomSnackBar("Something went wrong. Please try again.", isError: true);
      // hideLoading();
      // update();
    }
  }

  Future<void> getzoneIdForRegisteration() async {
    // ApiClient apiClient = ApiClient(appBaseUrl: AppConstants.baseUrl, sharedPreferences: sharedPreferences);
    try {
      Response response = await authRepo.zones(lat.toString(), long.toString());
      var responseData = response.body;

      if (responseData == null) {
        hideLoading();
        throw Exception("Response data is null");
      }
      debugPrint("Response data: $responseData");

      if (response.statusCode == 200) {
        if (responseData['message']
            .toString()
            .contains("Successfully data fetched")) {
          debugPrint("Zone: $responseData");
          debugPrint(
              "Zone ID: ${responseData['content']['zone']['id'].toString()}");
          zoneIdForRegisteration =
              responseData['content']['zone']['id'].toString();
          debugPrint("Zone ID: $zoneIdForRegisteration");
          update();
        } else {
          hideLoading();
          closeSnackBarIfActive();
          // showCustomSnackBar(responseData['message'], isError: true);
        }
      } else {
        closeSnackBarIfActive();
        hideLoading();
        // showCustomSnackBar(responseData['message'], isError: true);
        update();
      }
    } catch (e) {
      // showCustomSnackBar("Something went wrong. Please try again. $e",
      //     isError: true);
      debugPrint("Error fetching categories: $e");
      closeSnackBarIfActive();
    } finally {
      _isLoginLoading = false;
      // showCustomSnackBar("Something went wrong. Please try again.", isError: true);
      // hideLoading();
      // update();
    }
  }

  Future<void> getPagesData({bool isLogin = false}) async {
    if (!isLogin) {
      showLoading();
    }

    // ApiClient apiClient = ApiClient(appBaseUrl: AppConstants.baseUrl, sharedPreferences: sharedPreferences);
    try {
      Response response = await authRepo.pages();
      var responseData = response.body;

      if (responseData == null) {
        if (!isLogin) {
          hideLoading();
        }

        throw Exception("Response data is null");
      }
      debugPrint("Response data: $responseData");

      if (response.statusCode == 200) {
        if (responseData['message']
            .toString()
            .contains("Successfully data fetched")) {
          apiResponse = ApiResponse.fromJson(responseData);
          if (!isLogin) {
            hideLoading();
          }
          // debugPrint("Zone ID: $zoneIdForRegisteration");
          update();
        } else {
          if (!isLogin) {
            hideLoading();
          }
          closeSnackBarIfActive();
          showCustomSnackBar(responseData['message'], isError: true);
        }
      } else {
        closeSnackBarIfActive();
        if (!isLogin) {
          hideLoading();
        }
        showCustomSnackBar(responseData['message'], isError: true);
        update();
      }
    } catch (e) {
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      debugPrint("Error fetching categories: $e");
      closeSnackBarIfActive();
    } finally {
      _isLoginLoading = false;
      // showCustomSnackBar("Something went wrong. Please try again.", isError: true);
      // hideLoading();
      // update();
    }
  }

  Future<void> updateBookingStatus(
    Map<String, String> body, {
    List<dynamic>? images,
    File? imageName,
    File? videos,
    String? postImageName,
    String? postVideoName,
  }) async {
    showLoading();
    try {
      log("Status of update booking : $body");
      List<MultipartBody> documents = [];
      if (imageName != null) {
        log("Image Name Path: ${imageName.path}");
        documents.add(MultipartBody("reach_image", imageName));
      } else {
        log("Image Name Path: ${images?.length.toString()}");
        for (int i = 0; i < (images ?? []).length; i++) {
          documents.add(MultipartBody(
              postImageName != null
                  ? "$postImageName[$i]"
                  : "pre_work_image[$i]",
              images?[i]));
        }
        if (videos != null) {
          log("Video Name Path: ${videos.length.toString()}");
          documents
              .add(MultipartBody(postVideoName ?? "pre_work_video", videos));
        }
      }
      log("Status of update booking : 2");
      Response response = await authRepo.updateBookingStatus(body, documents);
      var responseData = response.body;
      log("Status of update booking : 3");
      log("Status of update booking : Response data upload data : $responseData");
      if (responseData == null) {
        hideLoading();
        throw Exception("Response data is null");
      }
      debugPrint("Response data: $responseData");

      if (response.statusCode == 200) {
        if (responseData['message']
            .toString()
            .contains("Booking status updated successfully")) {
          hideLoading();
          // debugPrint("Zone ID: $zoneIdForRegisteration");
          await getBookingDetails(
              id: body['booking_id'].toString(), isLoading: false);
          update();
        } else {
          hideLoading();
          closeSnackBarIfActive();
          showCustomSnackBar(responseData['message'], isError: true);
        }
      } else {
        closeSnackBarIfActive();
        hideLoading();
        showCustomSnackBar(responseData['message'], isError: true);
        update();
      }
    } catch (e) {
      log("Status of update booking : 100");
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      log("Status of update booking : $e");
      debugPrint("Error Updating Status: $e");
      closeSnackBarIfActive();
    } finally {
      _isLoginLoading = false;
      // showCustomSnackBar("Something went wrong. Please try again.", isError: true);
      // hideLoading();
      // update();
    }
  }

  Future<void> getCategoriesToServices(
      {required String id,
      required String limit,
      required String offset,
      bool? isLoading}) async {
    categoriesToServiceListing = Services(data: []);
    if (isLoading ?? false) {
      showLoading();
    }
    update();

    try {
      Response response =
          await authRepo.categoriesToServices(id, limit, offset);
      var responseData = response.body;

      if (responseData == null) {
        hideLoading();
        throw Exception("Response data is null");
      }
      debugPrint("Response data: $responseData");

      if (response.statusCode == 200) {
        if (responseData['message']
            .toString()
            .contains("Successfully data fetched")) {
          categoriesToServiceListing =
              Services.fromJson(responseData['content']);
          if ((categoriesToServiceListing?.data ?? []).isNotEmpty) {
            hideLoading();
            Get.to(() => CategoryToServices());
          }

          update();
        } else {
          hideLoading();
          closeSnackBarIfActive();
          Get.to(() => CategoryToServices());
          // showCustomSnackBar(responseData['message'], isError: true);
        }
      } else {
        closeSnackBarIfActive();
        hideLoading();
        showCustomSnackBar(responseData['message'], isError: true);

        screens = [
          NoServiceScreen(
            message: responseData['message'].toString(),
          ),
          NoServiceScreen(
            message: responseData['message'].toString(),
          ),
          NoServiceScreen(
            message: responseData['message'].toString(),
          ),
          NoServiceScreen(
            message: responseData['message'].toString(),
          ),
        ];
        Get.offAll(() => DashboardScreen(pageIndex: 0));
        update();
      }
    } catch (e) {
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      debugPrint("Error fetching categories: $e");
      closeSnackBarIfActive();
    } finally {
      _isLoginLoading = false;
      // showCustomSnackBar("Something went wrong. Please try again.", isError: true);
      // hideLoading();
      // update();
    }
  }

  ReviewResponse reviewResponse =
      ReviewResponse(responseCode: '', message: '', content: null);

  Future<void> getReviews() async {
    showLoading();
    try {
      Response response = await authRepo.getReviewsResponse();
      var responseData = response.body;
      log("Review response data: $responseData");
      if (responseData == null) {
        hideLoading();
        throw Exception("Response data is null");
      }
      log("Review Data: $responseData");

      if (response.statusCode == 200) {
        if (responseData['message']
            .toString()
            .contains("Successfully data fetched")) {
          reviewResponse = ReviewResponse.fromJson(responseData);
          update();
          hideLoading();
          if (reviewResponse.content?.reviews.data.isEmpty ?? false) {
            showCustomSnackBar("No review found.", isError: true);
          } else {
            Get.to(() => const ReviewScreen());
          }
        } else {
          hideLoading();
          closeSnackBarIfActive();

          // showCustomSnackBar(responseData['message'], isError: true);
        }
      } else {
        closeSnackBarIfActive();
        hideLoading();
        showCustomSnackBar(responseData['message'], isError: true);
        update();
      }
    } catch (e) {
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      debugPrint("Error fetching reviews: $e");
      closeSnackBarIfActive();
    } finally {
      _isLoginLoading = false;
      // showCustomSnackBar("Something went wrong. Please try again.", isError: true);
      // hideLoading();
      // update();
    }
  }

  BookingCountResponse bookingCountResponse = BookingCountResponse(
    responseCode: '',
    message: '',
    content: BookingContent(
      bookingsCount: BookingsCount(
        pending: 0,
        accepted: 0,
        ongoing: 0,
        completed: 0,
        canceled: 0,
      ),
    ),
  );

  Future<void> getBookingCounts({required bool getAccountInfoAlso}) async {
    try {
      Response response = await authRepo.getBookingCounts();
      var responseData = response.body;

      if (responseData == null) {
        hideLoading();
        throw Exception("Response data is null");
      }
      log("BookingCounts Data: $responseData");

      if (response.statusCode == 200) {
        if (responseData['message']
            .toString()
            .contains("Successfully data fetched")) {
          bookingCountResponse = BookingCountResponse.fromJson(responseData);
          debugPrint("BookingCounts: $bookingCountResponse");
          if (getAccountInfoAlso) {
            getAccountInfo(false);
          }
          update();
          hideLoading();
        } else {
          hideLoading();
          closeSnackBarIfActive();

          // showCustomSnackBar(responseData['message'], isError: true);
        }
      } else {
        closeSnackBarIfActive();
        hideLoading();
        showCustomSnackBar(responseData['message'], isError: true);
        update();
      }
    } catch (e) {
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      debugPrint("Error fetching HomeStats: $e");
      closeSnackBarIfActive();
    } finally {
      _isLoginLoading = false;
      // showCustomSnackBar("Something went wrong. Please try again.", isError: true);
      hideLoading();
      // update();
    }
  }

  Future<void> getBooking(Map<String, String> query) async {
    bookingModelSecond.data?.clear();
    // showLoading();
    update();
    try {
      log("Query: $query");
      Response response = await authRepo.bookings(query);
      var responseData = response.body;

      if (responseData == null) {
        throw Exception("Response data is null");
      }
      log("Response data booking: $responseData");

      if (response.statusCode == 200) {
        if (responseData['message']
            .toString()
            .contains("Successfully data fetched")) {
          bookingModelSecond = BookingModel.fromJson(responseData);
          // hideLoading();
          // update();
        } else {
          // hideLoading();

          closeSnackBarIfActive();
          showCustomSnackBar(responseData['message'], isError: true);
        }
      } else {
        // hideLoading();

        closeSnackBarIfActive();
        showCustomSnackBar(responseData['message'], isError: true);
      }
    } catch (e) {
      // hideLoading();
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      debugPrint("Error fetching bookings. : $e");
      closeSnackBarIfActive();
    } finally {
      _isLoginLoading = false;
      // showCustomSnackBar("Something went wrong. Please try again.", isError: true);
      // hideLoading();
      update();
    }
  }

  BookingDetailModel? bookingDetails;
  bool? isBookingDetailsLoading = false;

  BookingDetailsModel? _bookingDetails2;

  BookingDetailsModel? get bookingDetails2 => _bookingDetails2;

  Future<void> getBookingDetails({
    required String id,
    bool? isLoading,
  }) async {
    // showLoading();
    isBookingDetailsLoading = true;
    if (isLoading ?? false) {
      showLoading();
    }
    update();

    try {
      Response response = await authRepo.bookingDetails(id);
      var responseData = response.body;

      if (responseData == null) {
        hideLoading();
        throw Exception("Response data is null");
      }
      log("Response Detail Booking data: $responseData");
      debugPrint("Response Detail Booking data debugprint: $responseData");

      if (response.statusCode == 200) {
        hideLoading();
        if (responseData['message']
            .toString()
            .contains("Successfully data fetched")) {
          // bookingDetails = booking.Booking.fromJson(responseData['content']);
          bookingDetails = BookingDetailModel.fromJson(responseData);
          _bookingDetails2 = BookingDetailsModel.fromJson(responseData);
          isBookingDetailsLoading = false;

          update();
        } else {
          hideLoading();
          isBookingDetailsLoading = false;
          closeSnackBarIfActive();
          // showCustomSnackBar(responseData['message'], isError: true);
        }
      } else {
        closeSnackBarIfActive();
        isBookingDetailsLoading = false;
        hideLoading();
        showCustomSnackBar(responseData['message'], isError: true);

        update();
      }
    } catch (e) {
      isBookingDetailsLoading = false;
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      debugPrint("Error fetching categories: $e");
      closeSnackBarIfActive();
    } finally {
      isBookingDetailsLoading = false;
      _isLoginLoading = false;
      // showCustomSnackBar("Something went wrong. Please try again.", isError: true);
      // hideLoading();
      update();
    }
  }

  ProviderModel providerModel =
      ProviderModel(responseCode: '', message: '', content: null);

  Future<void> getProviderInfo() async {
    try {
      Response response = await authRepo.getProviderInfo();
      var responseData = response.body;

      if (responseData == null) {
        hideLoading();
        throw Exception("Response data is null");
      }
      log("Provider data: $responseData");

      if (response.statusCode == 200) {
        if (responseData['message']
            .toString()
            .contains("Successfully data fetched")) {
          providerModel = ProviderModel.fromJson(responseData);
          debugPrint("ProviderModel: $providerModel");
          getBookingCounts(getAccountInfoAlso: true);

          update();
        } else {
          hideLoading();
          closeSnackBarIfActive();
          // showCustomSnackBar(responseData['message'], isError: true);
        }
      } else {
        closeSnackBarIfActive();
        hideLoading();
        showCustomSnackBar(responseData['message'], isError: true);
      }
    } catch (e) {
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      debugPrint("Error fetching providerInfo: $e");
      closeSnackBarIfActive();
    } finally {
      _isLoginLoading = false;
      // showCustomSnackBar("Something went wrong. Please try again.", isError: true);
      // hideLoading();
      // update();
    }
  }

  Future<void> getCategoriesToSubCategories(
      {required String id,
      required String limit,
      required String offset}) async {
    subCategoryModelListing = SubCategoryModel(data: []);
    showLoading();
    update();

    try {
      Response response =
          await authRepo.categoriesToSubCategories(id, limit, offset);
      var responseData = response.body;

      if (responseData == null) {
        hideLoading();
        throw Exception("Response data is null");
      }
      debugPrint("Response data SubCategories: $responseData");

      if (response.statusCode == 200) {
        if (responseData['message']
            .toString()
            .contains("Successfully data fetched")) {
          subCategoryModelListing =
              SubCategoryModel.fromJson(responseData['content']);
          update();
          if ((subCategoryModelListing?.data ?? []).isNotEmpty) {
            selectedSubCategories.clear();
            selectedSubCategories.add((subCategoryModelListing?.data ?? [])[0]);
            update();
            hideLoading();
            getCategoriesToServices(
                id: (subCategoryModelListing?.data ?? [])[0].id.toString(),
                limit: "10",
                offset: "1",
                isLoading: false);
          }
          update();
        } else {
          hideLoading();
          closeSnackBarIfActive();
          showCustomSnackBar(responseData['message'], isError: true);
        }
      } else {
        closeSnackBarIfActive();
        hideLoading();
        showCustomSnackBar(responseData['message'], isError: true);

        screens = [
          NoServiceScreen(
            message: responseData['message'].toString(),
          ),
          NoServiceScreen(
            message: responseData['message'].toString(),
          ),
          NoServiceScreen(
            message: responseData['message'].toString(),
          ),
          NoServiceScreen(
            message: responseData['message'].toString(),
          ),
        ];
        Get.offAll(() => DashboardScreen(pageIndex: 0));
        update();
      }
    } catch (e) {
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      debugPrint("Error fetching categories: $e");
      closeSnackBarIfActive();
    } finally {
      _isLoginLoading = false;
      // showCustomSnackBar("Something went wrong. Please try again.", isError: true);
      // hideLoading();
      // update();
    }
  }

  ProviderDashboardModel providerDashboardModel =
      ProviderDashboardModel(responseCode: '', message: '', content: null);

  Future<void> getAccountInfo(bool? isLoading) async {
    providerDashboardModel =
        ProviderDashboardModel(responseCode: '', message: '', content: null);
    if (isLoading ?? false) {
      showLoading();
    }

    update();

    try {
      Response response = await authRepo.getAccountInfo();
      var responseData = response.body;

      if (responseData == null) {
        hideLoading();
        throw Exception("Response data is null");
      }
      debugPrint("Response data SubCategories: $responseData");

      if (response.statusCode == 200) {
        if (responseData['message']
            .toString()
            .contains("Successfully data fetched")) {
          providerDashboardModel =
              ProviderDashboardModel.fromJson(responseData);
          update();
          hideLoading();
        } else {
          hideLoading();
          closeSnackBarIfActive();
          showCustomSnackBar(responseData['message'], isError: true);
        }
      } else {
        closeSnackBarIfActive();
        hideLoading();
        showCustomSnackBar(responseData['message'], isError: true);
        update();
      }
    } catch (e) {
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      debugPrint("Error fetching accountinfo: $e");
      closeSnackBarIfActive();
    } finally {
      _isLoginLoading = false;
      // showCustomSnackBar("Something went wrong. Please try again.", isError: true);
      hideLoading();
      update();
    }
  }

  Future<void> getLocationDate() async {
    _isLoginLoading = true;
    showLoading();
    update();

    try {
      Response response =
          await authRepo.addressData(latitude.toString(), longitude.toString());
      var responseData = response.body;

      if (responseData == null) {
        throw Exception("Response data is null");
      }
      debugPrint("Response data: $responseData");

      if (response.statusCode == 200) {
        if (responseData['message']
            .toString()
            .contains("Successfully data fetched")) {
          getBanners();
          address = responseData["content"]["results"][0]["formatted_address"]
              .toString();
          if ((address ?? "").isNotEmpty) {
            getData("6", "1");
          }
          // hideLoading();
          update();
        } else {
          hideLoading();
          closeSnackBarIfActive();
          showCustomSnackBar(responseData['message'], isError: true);
        }
      } else {
        hideLoading();
        closeSnackBarIfActive();
        showCustomSnackBar(responseData['message'], isError: true);
      }
    } catch (e) {
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      debugPrint("Error fetching categories: $e");
      closeSnackBarIfActive();
    } finally {
      _isLoginLoading = false;
      // showCustomSnackBar("Something went wrong. Please try again.", isError: true);
      // hideLoading();
      // update();
    }
  }

  Future<void> getBanners() async {
    try {
      Response response = await authRepo.banners();
      var responseData = response.body;

      if (responseData == null) {
        throw Exception("Response data is null");
      }
      debugPrint("Response data: $responseData");

      if (response.statusCode == 200) {
        if (responseData['message']
            .toString()
            .contains("Successfully data fetched")) {
          debugPrint("Banners: $responseData");
          responseData['content']['data'].forEach((element) {
            String imagePath = element['banner_image_full_path'];

            if (element['position'].toString() == "1") {
              if (!banners1.contains(imagePath)) {
                banners1.add(imagePath);
                update();
              }
            } else {
              if (!banner2.contains(imagePath)) {
                banner2.add(imagePath);
                update();
              }
            }
          });

          update();
        } else {
          hideLoading();
          closeSnackBarIfActive();
          showCustomSnackBar(responseData['message'], isError: true);
        }
      } else {
        hideLoading();
        closeSnackBarIfActive();
        showCustomSnackBar(responseData['message'], isError: true);
      }
    } catch (e) {
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      debugPrint("Error fetching categories: $e");
      closeSnackBarIfActive();
    } finally {
      _isLoginLoading = false;
      // showCustomSnackBar("Something went wrong. Please try again.", isError: true);
      // hideLoading();
      // update();
    }
  }

  // Future<void> getListOfBookings({required bool isRefresh}) async {
  //   if (!isRefresh) {
  //     showLoading();
  //   }

  //   ApiClient apiClient = ApiClient(
  //     appBaseUrl: AppConstants.baseUrl,
  //     sharedPreferences: sharedPreferences,
  //   );
  //   debugPrint("Body of booking Listing: ");
  //   String? token = sharedPreferences.getString(AppConstants.token);
  //   apiClient.updateHeader(token);
  //   log("Token used in getTodaysBooking: $token");
  //   log("Token used in getTodaysBooking: ${apiClient.mainHeaders["Authorization"].toString()}");
  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Authorization': apiClient.mainHeaders["Authorization"].toString(),
  //   };
  //   var request = http.Request('POST',
  //       Uri.parse('${AppConstants.baseUrl}${AppConstants.getTodaysBooking}'));
  //   request.body = json.encode({
  //     "limit": 100,
  //     "offset": 1,
  //     "booking_status": "all",
  //     "service_type": "all"
  //   });

  //   log("Request Headers: $headers");
  //   log("Request Body: ${request.body}");
  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     String responseBody = await response.stream.bytesToString();
  //     Map<String, dynamic> responseData = jsonDecode(responseBody);
  //     log("$responseData today booking data");
  //     bookingModel =
  //         booking.BookingList.fromJson(responseData['content']['bookings']);
  //     if (!isRefresh) {
  //       getProviderInfo();
  //     }

  //     update();
  //     // hideLoading();
  //   } else {
  //     hideLoading();
  //     log("${response.reasonPhrase} issue error ${response.statusCode}");
  //     if (response.reasonPhrase == 'Unauthorized') {
  //       closeSnackBarIfActive();
  //       showCustomSnackBar("Your session has expired. Please login again.",
  //           isError: true);
  //       // Get.find<AuthController>().logout();
  //     } else {
  //       closeSnackBarIfActive();
  //       showCustomSnackBar("Failed to fetch bookings. Please try again.",
  //           isError: true);
  //     }

  //     update();
  //   }
  // }

  Future<void> getListOfBookings({required bool isRefresh}) async {
    if (!isRefresh) {
      showLoading();
    }

    try {
      // Prepare API client and headers
      ApiClient apiClient = ApiClient(
        appBaseUrl: AppConstants.baseUrl,
        sharedPreferences: sharedPreferences,
      );
      String? token = sharedPreferences.getString(AppConstants.token);
      apiClient.updateHeader(token);

      // Prepare request body
      Map<String, String> body = {
        "limit": "100",
        "offset": "1",
        "booking_status": "all",
        "service_type": "all"
      };

      log("Request Body: $body");
      log("Headers: ${apiClient.mainHeaders}");

      // Make API call using ApiClient's postData method
      Response response = await apiClient.postData(
        AppConstants.getTodaysBooking,
        body,
        headers: apiClient.mainHeaders,
      );

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        log("$responseData today booking data");
        if (responseData['content'] != null &&
            responseData['content']['bookings'] != null) {
          bookingModel =
              booking.BookingList.fromJson(responseData['content']['bookings']);
          if (!isRefresh) {
            getProviderInfo();
          }
          update();
          // hideLoading();
        } else {
          log("Error: Invalid response structure");
          hideLoading();
        }
      } else {
        hideLoading();
        log("${response.statusText} issue error ${response.statusCode}");
        if (response.statusText == 'Unauthorized') {
          closeSnackBarIfActive();
          showCustomSnackBar("Your session has expired. Please login again.",
              isError: true);
          Get.find<AuthController>().logout();
        } else {
          closeSnackBarIfActive();
          showCustomSnackBar("Failed to fetch bookings. Please try again.",
              isError: true);
        }
        update();
      }
    } catch (e) {
      hideLoading();
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      log("Error fetching bookings: $e");
      closeSnackBarIfActive();
    }
  }

  List<Widget> screens = [
    const HomeScreen(
      key: ValueKey('home'),
    ),
    const Naya_kaam(
      key: ValueKey('naya_kaam'),
    ),
    const BookingScreen(
      key: ValueKey('booking'),
    ),
    const PaiseScreen(
      key: ValueKey('paise'),
    ),
  ];

  final List<String> screenTitle = [
    "Home",
    "Naya Kaam",
    "Bookings",
    "Paise",
  ];

  double? latitude = 28.5463443;
  double? longitude = 77.2519989;

  Future<void> handleLocationPermission(BuildContext context) async {
    LocationPermission permission = await Geolocator.checkPermission();
    showLoading();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      // Permission already granted, fetch location directly
      fetchUserLocation();
    } else {
      // Show dialog only if permission is not granted
      showLocationPermissionDialog(context);
    }
  }

  Future<void> showLocationPermissionDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Location Permission Required"),
          content: Text(
            "We need access to your location to provide personalized naya_kaam and better recommendations.",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                requestLocationPermission();
              },
              child: Text("Allow"),
            ),
          ],
        );
      },
    );
  }

  Future<void> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Location permission denied.");
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print("Location permission permanently denied. Enable from settings.");
      return;
    }
    fetchUserLocation();
  }

  Future<void> fetchUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print("Latitude: ${position.latitude}, Longitude: ${position.longitude}");

    longitude = position.longitude;
    latitude = position.latitude;
    update();
    Future.delayed(Duration(milliseconds: 10));
    getZone();
  }

  void updateValues(String address, String lat, String long) {
    this.address = address;
    this.lat = lat;
    this.long = long;
    update();
  }

  double getTransactionAmountAmount(double payable, double receivable) {
    double amount = 0;
    if (payable > receivable) {
      amount = payable - receivable;
    } else {
      amount = receivable - payable;
    }
    return amount;
  }

  TransactionType getTransactionType(double payable, double receivable) {
    TransactionType type = TransactionType.none;

    if (payable == receivable) {
      if (payable == 0 || receivable == 0) {
        type = TransactionType.none;
      } else {
        type = TransactionType.adjust; //main
      }
    } else if (payable > receivable) {
      if (receivable > 0.0) {
        type = TransactionType.adjustAndPayable; //main
      } else {
        type = TransactionType.payable;
      }
    } else if (receivable > payable) {
      // if (payable > 0.0) {
      type = TransactionType.adjustWithdrawAble; //main
      // } else {
      //   type = TransactionType.withdrawAble;
      // }
    } else {
      type = TransactionType.none;
    }

    return type;
  }

  EarningType _showMonthlyEarnStatisticsChart = EarningType.monthly;

  EarningType get getChartType => _showMonthlyEarnStatisticsChart;
  String _selectedYear = DateConverter.stringYear(DateTime.now());

  String get selectedYear => _selectedYear;
  String _selectedMonth = DateFormat('MMMM').format(DateTime.now());

  String get selectedMonth => _selectedMonth;

  void changeGraph(EarningType selectedType) {
    _showMonthlyEarnStatisticsChart = selectedType;
    _selectedYear = DateConverter.stringYear(DateTime.now());
    _selectedMonth = DateFormat('MMMM').format(DateTime.now());
    update();
  }

  List<MonthlyStats> _monthlyStatsList = [];

  List<MonthlyStats> get monthlyStatsList => _monthlyStatsList;

  List<double> _mStatsList = [];

  List<double> get mStatsList => _mStatsList;

  List<BarChartGroupData> _monthlyChartList = [];

  List<BarChartGroupData> get monthlyChartList => _monthlyChartList;

  double _mmM = 0;

  double get mmM => _mmM;

  bool _isLeapYear = false;

  get isLeapYear => _isLeapYear;

  Future<void> getMonthlyBookingsDataForChart(String year, String month) async {
    _monthlyStatsList = [];
    Response response =
        await authRepo.getMonthlyDashBoardChartData(year, month);
    if (response.statusCode == 200) {
      _monthlyStatsList = [];
      _mStatsList = [];
      _monthlyChartList = [];

      log("Chart response body: ${response.body}");

      // Check if content and earning_stats exist
      if (response.body['content'] != null &&
          response.body['content'].isNotEmpty &&
          response.body['content'][0]['earning_stats'] != null) {
        response.body['content'][0]['earning_stats'].forEach((element) {
          _monthlyStatsList.add(MonthlyStats.fromJson(element));
        });
      }
      if (month == '2') {
        int lip = 0;
        bool isLeapYear(yer) =>
            (yer % 4 == 0) && ((yer % 100 != 0) || (yer % 400 == 0));
        bool leapYear = isLeapYear(int.tryParse(year));
        if (leapYear == true) {
          _isLeapYear = true;
          lip = 30; // February in leap year has 29 days, but need index 0-29
          update();
        } else {
          lip = 29; // February has 28 days, but need index 0-28
        }
        for (int i = 0; i < lip; i++) {
          _mStatsList.add(0);
        }
      } else if (month == '4' ||
          month == '6' ||
          month == '9' ||
          month == '11') {
        // These months have 30 days, so need indices 0-30
        for (int i = 0; i < 31; i++) {
          _mStatsList.add(0);
        }
      } else if (month == '1' ||
          month == '3' ||
          month == '5' ||
          month == '7' ||
          month == '8' ||
          month == '10' ||
          month == '12') {
        // These months have 31 days, so need indices 0-31
        for (int i = 0; i < 32; i++) {
          _mStatsList.add(0);
        }
      }
      for (int i = 0; i < _monthlyStatsList.length; i++) {
        int dayIndex = _monthlyStatsList[i].day!;
        if (dayIndex >= 0 && dayIndex < _mStatsList.length) {
          _mStatsList[dayIndex] =
              double.tryParse(_monthlyStatsList[i].sums!)?.toDouble() ?? 0.0;
        }
      }

      _monthlyChartList = List.generate(_mStatsList.length, (index) {
        return BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: _mStatsList[index],
              color: index == 0 ? Colors.white : Colors.white.withOpacity(0.6),
              width: 8,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        );
      });

      // Find max value without sorting (sorting breaks day order)
      _mmM = _mStatsList.reduce((a, b) => a > b ? a : b);
      update();
    } else {}
    update();
  }

  void changeDashboardDropdownValue(
      String indexValue, String value, String type) {
    if (type == "Year") {
      _selectedYear = indexValue;
      if (_selectedYear != "Select" &&
          _showMonthlyEarnStatisticsChart == EarningType.yearly) {
        getYearlyBookingsDataForChart(_selectedYear);
      }
      update();
    } else if (type == "Month") {
      _selectedMonth = value;
      if (_selectedYear != "Select") {
        getMonthlyBookingsDataForChart(_selectedYear, indexValue);
      }
      update();
    }
  }

  //yearly Stats
  List<YearlyStats> _yearlyStatsList = [];

  List<YearlyStats> get yearlyStatsList => _yearlyStatsList;

  List<double> _yStatsList = [];

  List<double> get yStatsList => _yStatsList;

  List<BarChartGroupData> _yearlyChartList = [];

  List<BarChartGroupData> get yearlyChartList => _yearlyChartList;

  double _mmY = 0;

  double get mmY => _mmY;

  Future<void> getYearlyBookingsDataForChart(String year) async {
    _yearlyStatsList = [];
    Response response = await authRepo.getYearlyDashBoardChartData(year);
    if (response.statusCode == 200) {
      _yearlyStatsList = [];
      _yStatsList = [];
      _yearlyChartList = [];

      // Check if content and earning_stats exist
      if (response.body['content'] != null &&
          response.body['content'].isNotEmpty &&
          response.body['content'][0]['earning_stats'] != null) {
        List<dynamic> yearlyDynamicList =
            response.body['content'][0]['earning_stats'];
        for (var element in yearlyDynamicList) {
          _yearlyStatsList.add(YearlyStats.fromJson(element));
        }
      }

      for (int i = 0; i < 13; i++) {
        _yStatsList.add(0);
      }

      for (int i = 0; i < _yearlyStatsList.length; i++) {
        var monthIndex = monthMap[_yearlyStatsList[i].month];
        if (monthIndex != null &&
            monthIndex >= 0 &&
            monthIndex < _yStatsList.length) {
          _yStatsList[monthIndex] =
              double.tryParse(_yearlyStatsList[i].sums!)?.toDouble() ?? 0.0;
        }
      }

      _yearlyChartList = List.generate(_yStatsList.length, (index) {
        return BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: _yStatsList[index],
              color: index == 0 ? Colors.white : Colors.white.withOpacity(0.6),
              width: 16,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        );
      });

      // Find max value without sorting (sorting breaks month order)
      _mmY = _yStatsList.reduce((a, b) => a > b ? a : b);
      update();
    } else {}
    update();
  }

  Map<String, int> monthMap = {
    'January': 1,
    'February': 2,
    'March': 3,
    'April': 4,
    'May': 5,
    'June': 6,
    'July': 7,
    'August': 8,
    'September': 9,
    'October': 10,
    'November': 11,
    'December': 12,
  };
  Map<int, String> monthMap2 = {
    0: 'Jan',
    1: 'Feb',
    2: 'Mar',
    3: 'Apr',
    4: 'May',
    5: 'Jun',
    6: 'Jul',
    7: 'Aug',
    8: 'Sep',
    9: 'Oct',
    10: 'Nov',
    11: 'Dec',
  };

  Future<bool> getConfigData() async {
    showLoading();
    Response response = await authRepo.getConfigData();
    bool isSuccess = false;
    if (response.statusCode == 200) {
      _configModel = ConfigModel.fromJson(response.body);
      hideLoading();
    } else {
      hideLoading();
    }
    update();
    return isSuccess;
  }

  int _paymentMethodIndex = -1;

  int get paymentMethodIndex => _paymentMethodIndex;

  void updateIndex(int index, {bool isUpdate = true}) {
    _paymentMethodIndex = index;
    if (isUpdate) {
      update();
    }
  }

  List<CartModel> _cartList = [];

  List<CartModel> get cartList => _cartList;
  String initialBookingStatus = 'pending';
  bool _paymentStatusPaid = true;

  bool get paymentStatusPaid => _paymentStatusPaid;
  ServicemanModel? _selectedServiceman;

  ServicemanModel? get selectedServiceman => _selectedServiceman;
  String _bookingStatus = '';

  String get selectedBookingStatus => _bookingStatus;
  String? _scheduleTime;

  String? get scheduleTime => _scheduleTime;
  BookingDetailsModel? _subBookingDetails;

  BookingDetailsModel? get subBookingDetails => _subBookingDetails;

  String? _previousScheduleTime;

  initializedControllerValue(BookingDetailsContent? bookingDetailsContent,
      {bool shouldUpdate = true}) {
    initialBookingStatus = bookingDetailsContent?.bookingStatus ?? "";
    _paymentStatusPaid = bookingDetailsContent?.isPaid == 1 ? true : false;
    _selectedServiceman = bookingDetailsContent?.serviceman?.user ??
        bookingDetailsContent?.subBooking?.serviceman?.user;
    _bookingStatus = bookingDetailsContent?.bookingStatus ?? "";
    _scheduleTime = bookingDetailsContent?.serviceSchedule ??
        bookingDetailsContent?.subBooking?.serviceSchedule;
    _previousScheduleTime = bookingDetailsContent?.serviceSchedule ??
        bookingDetailsContent?.subBooking?.serviceSchedule;

    _initializedCartValue(bookingDetailsContent?.nextService?.details ??
        bookingDetailsContent?.details);

    if (shouldUpdate) {
      update();
    }
  }

  _initializedCartValue(List<ItemService>? bookedCartList) {
    _cartList = [];
    bookedCartList?.forEach((element) {
      CartModel cartModel = CartModel(
        id: "",
        isNewItem: false,
        serviceId: element.serviceId,
        variantKey: element.variantKey,
        serviceName: element.serviceName,
        quantity: element.quantity,
        serviceThumbnail: element.service?.thumbnailFullPath ?? "",
        serviceCost: element.serviceCost,
        totalCost: (element.totalCost ?? 0) -
            (element.overallCouponDiscountAmount ?? 0),
        taxAmount: element.taxAmount,
        campaignDiscountAmount: element.campaignDiscountAmount,
        discountAmount: element.discountAmount,
      );
      _cartList.add(cartModel);
    });
  }

  void removeCartItem(int index) {
    _cartList.removeAt(index);
    update();
  }

  bool? _isLoading = false;
  List<BookingPriceItem>? bookingPriceList;

  void updateCartItemQuantity(CartModel? cart, int cartIndex,
      {bool increment = true}) async {
    _isLoading = true;
    update();

    List<Map<String, String>> variationList = [];

    int quantity;
    if (increment) {
      quantity = (cart?.quantity ?? 0) + 1;
    } else {
      quantity = (cart?.quantity ?? 0) - 1;
    }

    if (quantity <= 0 && cart?.isNewItem == true) {
      _cartList.remove(cart);
    } else {
      variationList.add({
        "service_id": cart?.serviceId ?? "",
        "variant_key": cart?.variantKey ?? "",
        "quantity": quantity.toString()
      });

      Response response = await authRepo.getBookingPriceList(
          bookingDetails!.content!.zoneId ?? "", jsonEncode(variationList));
      if (response.statusCode == 200 &&
          response.body["response_code"] == "default_200") {
        bookingPriceList =
            BookingPrice.fromJson(response.body).bookingPriceContent ?? [];

        bookingPriceList?.forEach((element) {
          _cartList[cartIndex].totalCost = element.totalCost;
          _cartList[cartIndex].quantity = element.quantity;
        });
      } else {}
    }

    _isLoading = false;
    update();
  }

  Future<void> updateBooking(
      {String? bookingId,
      String? subBookingId,
      String? zoneId,
      required BookingEditType bookingEditType}) async {
    Get.back();
    showLoading();

    update();

    List<Map<String, String?>> updatedBookedServiceList = [];

    for (var element in _cartList) {
      updatedBookedServiceList.add({
        "service_id": element.serviceId,
        "variant_key": element.variantKey,
        "quantity": element.quantity.toString(),
      });
    }

    Response response = await authRepo.updateBooking(
        bookingId: bookingId,
        zoneId: zoneId,
        paymentStatus: paymentStatusPaid ? "1" : "0",
        servicemanId: _selectedServiceman?.serviceman?.id,
        bookingStatus: _bookingStatus,
        serviceSchedule: _scheduleTime,
        serviceInfo: jsonEncode(updatedBookedServiceList),
        bookingEditType: bookingEditType,
        subBookingId: subBookingId,
        changeNextAllBooking: false);
    if (response.statusCode == 200) {
      hideLoading();
      showCustomSnackBar("Booking updated successfully", isSuccess: true);
      Get.back();
      await Get.find<DashBoardController>()
          .getBookingDetails(id: bookingId ?? "");
    } else {
      Get.back();
    }

    update();
  }

  bool _isCartButtonActive = false;

  bool get isCartButtonActive => _isCartButtonActive;

  Future<void> getServiceListBasedOnSubcategory(
      {required String subCategoryId}) async {
    showLoading();
    Response response =
        await authRepo.getServiceListBasedOnSubcategory(subCategoryId);
    if (response.statusCode == 200) {
      List<dynamic> list = response.body['content']['data'];
      _serviceList = [];
      for (var service in list) {
        _serviceList?.add(scService.ServiceModel.fromJson(service));
      }
      hideLoading();
    } else {
      hideLoading();
    }

    update();
    hideLoading();
  }

  void updatedVariationQuantity(int serviceIndex, int variationIndex,
      {bool increment = true}) {
    if (increment) {
      int quantity =
          _serviceList![serviceIndex].variations![variationIndex].quantity + 1;
      _serviceList![serviceIndex].variations![variationIndex].quantity =
          quantity;
    } else {
      int quantity =
          _serviceList![serviceIndex].variations![variationIndex].quantity - 1;
      _serviceList![serviceIndex].variations![variationIndex].quantity =
          quantity;
    }

    for (int i = 0; i < _serviceList![serviceIndex].variations!.length; i++) {
      if (_serviceList![serviceIndex].variations![i].quantity > 0) {
        _isCartButtonActive = true;
        break;
      } else {
        _isCartButtonActive = false;
      }
    }

    update();
  }

  Future<void> addMultipleCartItem(int serviceIndex) async {
    List<Map<String, String>> variationList = [];

    for (int i = 0; i < _serviceList![serviceIndex].variations!.length; i++) {
      if (_serviceList![serviceIndex].variations![i].quantity > 0) {
        scService.Variations variations =
            _serviceList![serviceIndex].variations![i];

        variationList.add({
          "service_id": variations.serviceId ?? "",
          "variant_key": variations.variantKey ?? "",
          "quantity": variations.quantity.toString()
        });
      }
    }
    await getBookingPriceList(jsonEncode(variationList),
        thumbnail: _serviceList![serviceIndex].thumbnailFullPath);
  }

  Future<void> getBookingPriceList(String serviceInfo,
      {String? thumbnail}) async {
    _isLoading = true;
    update();

    Response response = await authRepo.getBookingPriceList(
        bookingDetails2?.content?.zoneId ?? "", serviceInfo);
    if (response.statusCode == 200 &&
        response.body["response_code"] == "default_200") {
      bookingPriceList =
          BookingPrice.fromJson(response.body).bookingPriceContent ?? [];

      bookingPriceList?.forEach((element) {
        addCartItem(CartModel(
          id: "",
          isNewItem: true,
          serviceId: element.serviceId,
          serviceName: element.serviceName,
          variantKey: element.variantKey,
          quantity: element.quantity,
          serviceThumbnail: thumbnail ?? "",
          serviceCost: element.serviceCost,
          totalCost: element.totalCost,
        ));
      });
    }
    _isLoading = false;
    update();
  }

  void resetSelectedServiceVariationQuantity(int serviceIndex) {
    if (_serviceList?[serviceIndex] != null &&
        _serviceList?[serviceIndex].variations != null) {
      for (int variationIndex = 0;
          variationIndex < _serviceList![serviceIndex].variations!.length;
          variationIndex++) {
        _serviceList![serviceIndex].variations![variationIndex].quantity = 0;
      }
      _isCartButtonActive = false;
    }
  }

  void addCartItem(CartModel cartModel) {
    bool availableToCart = false;

    for (int i = 0; i < _cartList.length; i++) {
      if (_cartList[i].variantKey == cartModel.variantKey) {
        availableToCart = true;
        _cartList[i].quantity =
            (_cartList[i].quantity ?? 0) + (cartModel.quantity ?? 0);
        _cartList[i].totalCost =
            (_cartList[i].totalCost ?? 0) + (cartModel.totalCost ?? 0);
        break;
      }
    }
    if (!availableToCart) {
      _cartList.add(cartModel);
    }
  }

  Rxn<ExtraServicesModel> addOnServiceListing = Rxn<ExtraServicesModel>();

  final RxList<AddonCartItem> _addonCartItems = <AddonCartItem>[].obs;

  List<AddonCartItem> get addonCartItems => _addonCartItems;

  AddonCart get addonCart => AddonCart(items: _addonCartItems);

  int get addonCartTotalItems =>
      _addonCartItems.fold(0, (sum, item) => sum + item.quantity);

  int get addonCartTotalPrice =>
      _addonCartItems.fold(0, (sum, item) => sum + item.totalPrice);

  int get addonCartTotalMrp =>
      _addonCartItems.fold(0, (sum, item) => sum + item.totalMrp);

  int get addonCartTotalSavings => addonCartTotalMrp - addonCartTotalPrice;

  void addAddonToCart({
    required String serviceId,
    required String variantKey,
    required String serviceName,
    required String variantName,
    required int price,
    required int mrpPrice,
    String? duration,
    String? description,
    String? thumbnailPath,
    required String variationId,
  }) {
    try {
      log("Variation id : $variationId");

      final existingIndex = _addonCartItems.indexWhere(
        (item) => item.serviceId == serviceId && item.variantKey == variantKey,
      );

      if (existingIndex != -1) {
        final existingItem = _addonCartItems[existingIndex];
        _addonCartItems[existingIndex] = existingItem.copyWith(
          quantity: existingItem.quantity + 1,
        );
        // showCustomSnackBar("Addon service quantity updated", isSuccess: true);
      } else {
        final newItem = AddonCartItem(
          serviceId: serviceId,
          variantKey: variantKey,
          serviceName: serviceName,
          variantName: variantName,
          price: price,
          mrpPrice: mrpPrice,
          duration: duration,
          description: description,
          quantity: 1,
          thumbnailPath: thumbnailPath,
          variationId: variationId,
        );
        _addonCartItems.add(newItem);
        // showCustomSnackBar("Addon service added to cart", isSuccess: true);
      }

      log("Addon added to cart. Total items: ${addonCartTotalItems}");
      update();
    } catch (e) {
      showCustomSnackBar("Failed to add addon service", isError: true);
      log("Error adding addon to cart: $e");
    }
  }

  void removeAddonFromCart(String serviceId, String variantKey) {
    try {
      _addonCartItems.removeWhere(
        (item) => item.serviceId == serviceId && item.variantKey == variantKey,
      );
      // showCustomSnackBar("Addon service removed from cart", isSuccess: true);
      log("Addon removed from cart. Total items: ${addonCartTotalItems}");
      update();
    } catch (e) {
      showCustomSnackBar("Failed to remove addon service", isError: true);
      log("Error removing addon from cart: $e");
    }
  }

  void updateAddonQuantity(String serviceId, String variantKey,
      {required bool increment}) {
    try {
      final existingIndex = _addonCartItems.indexWhere(
        (item) => item.serviceId == serviceId && item.variantKey == variantKey,
      );

      if (existingIndex != -1) {
        final existingItem = _addonCartItems[existingIndex];

        if (increment) {
          _addonCartItems[existingIndex] = existingItem.copyWith(
            quantity: existingItem.quantity + 1,
          );
          log("Addon quantity increased to ${existingItem.quantity + 1}");
        } else {
          if (existingItem.quantity > 1) {
            _addonCartItems[existingIndex] = existingItem.copyWith(
              quantity: existingItem.quantity - 1,
            );
            log("Addon quantity decreased to ${existingItem.quantity - 1}");
          } else {
            removeAddonFromCart(serviceId, variantKey);
            return;
          }
        }
        update();
      }
    } catch (e) {
      showCustomSnackBar("Failed to update addon quantity", isError: true);
      log("Error updating addon quantity: $e");
    }
  }

  int getAddonQuantity(String serviceId, String variantKey) {
    try {
      final item = _addonCartItems.firstWhere(
        (item) => item.serviceId == serviceId && item.variantKey == variantKey,
      );
      return item.quantity;
    } catch (e) {
      return 0;
    }
  }

  bool isAddonInCart(String serviceId, String variantKey) {
    return _addonCartItems.any(
      (item) => item.serviceId == serviceId && item.variantKey == variantKey,
    );
  }

  Future<void> clearAddonCart() async {
    _addonCartItems.clear();
    // showCustomSnackBar("Addon cart cleared", isSuccess: true);
    log("Addon cart cleared");
    update();
  }

  Map<String, dynamic> getAddonCartSummary() {
    return {
      'total_items': addonCartTotalItems,
      'total_price': addonCartTotalPrice,
      'total_mrp': addonCartTotalMrp,
      'total_savings': addonCartTotalSavings,
      'items': _addonCartItems.map((item) => item.toJson()).toList(),
    };
  }

  Future<void> getExtraServicesList({required String subcategoryid}) async {
    showLoading();
    try {
      Map<String, String> body = {
        "sub_category_id": subcategoryid,
      };
      Response response = await authRepo.addExtraServicesRepo(body);

      if (response.body == null) {
        hideLoading();
        throw Exception("Response body is null");
      }

      var responseData = jsonDecode(response.body);
      log("Response data extra services data : $responseData");

      if (responseData == null) {
        hideLoading();
        throw Exception("Response data is null");
      }

      log("Response data: $responseData");

      if (response.statusCode == 200) {
        if (responseData['message']
                ?.toString()
                .contains("Successfully data fetched") ??
            false) {
          try {
            addOnServiceListing.value =
                ExtraServicesModel.fromJson(responseData);
            log("Extra services parsed successfully");
          } catch (parseError) {
            log("Error parsing ExtraServicesModel: $parseError");
            throw Exception("Failed to parse extra services data: $parseError");
          }
          hideLoading();
          update();
        } else {
          hideLoading();
          closeSnackBarIfActive();
          showCustomSnackBar(responseData['message'] ?? "Unknown error",
              isError: true);
        }
      } else {
        closeSnackBarIfActive();
        hideLoading();
        showCustomSnackBar(responseData['message'] ?? "Server error",
            isError: true);
        update();
      }
    } catch (e, stackTrace) {
      hideLoading();
      log("Error in getExtraServicesList: $e");
      log("Stack trace: $stackTrace");
      showCustomSnackBar("Something went wrong. Please try again. $e",
          isError: true);
      debugPrint("Error fetching extra services: $e");
      closeSnackBarIfActive();
    } finally {
      _isLoginLoading = false;
      hideLoading();
    }
  }

  Future<void> bookAddons({required String bookingId}) async {
    final url = Uri.parse('${AppConstants.baseUrl}${AppConstants.bookAddOns}');
    final token = authRepo.getUserToken();
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final addons = addonCart.items
        .map((item) => {
              'service_id': int.tryParse(item.serviceId) ?? item.serviceId,
              'variant_key': item.variantKey,
              'quantity': item.quantity,
              'service_cost': item.price,
              'total_cost': item.totalPrice,
              'variation_id': item.variationId,
              'service_name': item.serviceName,
            })
        .toList();
    final body = {
      'booking_id': bookingId,
      'addons': addons,
    };
    try {
      final request = http.Request('POST', url);
      request.body = jsonEncode(body);
      request.headers.addAll(headers);
      final response = await request.send();
      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();
        showCustomSnackBar(
          'Service added successfully!',
          isError: false,
          isSuccess: true,
        );
        debugPrint(respStr);
      } else {
        final errorBody = await response.stream.bytesToString();
        log('API Error: ${response.reasonPhrase} ======== $errorBody');
        showCustomSnackBar('Failed to add services: $errorBody', isError: true);
      }
    } catch (e) {
      debugPrint(e.toString());
      showCustomSnackBar('Exception: $e', isError: true);
    }
  }

  RxList<SavedAddOnModel> savedAddonModelList = <SavedAddOnModel>[].obs;

  Future<void> getSavedAddOns({required String bookingId}) async {
    final url =
        Uri.parse('${AppConstants.baseUrl}${AppConstants.getStoredAddOn}');
    final token = authRepo.getUserToken();
    final headers = {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    };

    final body = {
      'booking_id': bookingId,
    };
    try {
      savedAddonModelList.clear();
      final request = http.Request('POST', url);
      request.body = jsonEncode(body);
      request.headers.addAll(headers);
      final response = await request.send();
      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();
        log("Saved addons are : $respStr");
        final decoded = jsonDecode(respStr);
        log("Saved addons are 2 : $decoded");
        if (decoded is List) {
          final list = decoded.map((x) => SavedAddOnModel.fromJson(x)).toList();
          savedAddonModelList.value = list;
          log("API returned a list with ${list.length} items");
        } else if (decoded is Map<String, dynamic>) {
          savedAddonModelList.value = [SavedAddOnModel.fromJson(decoded)];
          log("API returned a single map, converted to list");
        } else {
          log("Unexpected response type: " + decoded.runtimeType.toString());
          savedAddonModelList.value = [];
        }
        log("Final count: ${savedAddonModelList.length}");
      } else {
        final errorBody = await response.stream.bytesToString();
        log('API Error: ${response.reasonPhrase} ======== $errorBody');
        showCustomSnackBar('Failed to add services: $errorBody', isError: true);
      }
    } catch (e) {
      debugPrint(e.toString());
      showCustomSnackBar('Exception: $e', isError: true);
    }
  }

  RxDouble dueAmount = 0.0.obs;

  Future<void> getBookingDueAmount({required String bookingId}) async {
    showLoading();
    update();
    try {
      Map<String, String> body = {"booking_id": bookingId};
      Response response = await authRepo.getBookingDueAmountRepo(body);
      debugPrint("Due amount raw response: ${response.body}");
      if (response.body == null) {
        throw Exception("Response data is null");
      }
      debugPrint("Due amount raw response: ${response.body}");
      dynamic responseData;
      if (response.body is String) {
        responseData = jsonDecode(response.body);
      } else {
        responseData = response.body;
      }
      closeSnackBarIfActive();
      hideLoading();
      debugPrint("Due amount parsed data: $responseData");
      if (response.statusCode == 200) {
        if (responseData is Map<String, dynamic>) {
          if (responseData['status'] == true ||
              responseData['status'] == 'true') {
            var dueAmountValue = responseData['due_amount'] ??
                responseData['dueAmount'] ??
                responseData['content']?['due_amount'] ??
                0;
            dueAmount.value = double.tryParse(dueAmountValue.toString()) ?? 0.0;
            hideLoading();
            update();
          } else {
            dueAmount.value = 0.0;
            hideLoading();
            closeSnackBarIfActive();
            // showCustomSnackBar(
            //     responseData['message']?.toString() ??
            //         'Failed to fetch due amount',
            //     isError: true);
          }
        } else {
          log("Unexpected response format: ${responseData.runtimeType}");
          dueAmount.value = 0;
          hideLoading();
        }
        log("Due amount is ${dueAmount.value}");
      } else {
        hideLoading();
        closeSnackBarIfActive();
        var errorMessage = 'Failed to fetch due amount';
        if (responseData is Map<String, dynamic>) {
          errorMessage = responseData['message']?.toString() ?? errorMessage;
        }
        // showCustomSnackBar(errorMessage, isError: true);
      }
    } catch (e, stackTrace) {
      hideLoading();
      log("Error getting due amount: $e");
      log("Stack trace: $stackTrace");
      showCustomSnackBar("Something went wrong. Please try again.",
          isError: true);
      debugPrint("Error fetching due amount: $e");
      closeSnackBarIfActive();
    } finally {
      _isLoginLoading = false;
      closeSnackBarIfActive();
      hideLoading();
      update();
    }
  }

  RxBool dueAmountPaid = false.obs;
  RxString transactionId = ''.obs;

  Future<void> updateBookingDueAmount({
    required String bookingId,
    required String amount,
    required bool isRazorpay,
  }) async {
    dueAmountPaid.value = false;
    showLoading();
    update();
    try {
      Map<String, String> body = {};
      if (isRazorpay) {
        body = {
          "booking_id": bookingId,
          "paid_amount": amount,
          "trx_id": transactionId.value,
          "payment_method": "razor_pay",
        };
      } else {
        body = {
          "booking_id": bookingId,
          "paid_amount": amount,
          "trx_id": transactionId.value,
        };
      }
      log("Update body is : ${body}");
      Response response = await authRepo.updateBookingDueAmountRepo(body);

      if (response.body == null) {
        throw Exception("Response data is null");
      }
      debugPrint("Update due amount raw response: ${amount.toString()}");
      debugPrint("Update due amount raw response: ${response.body}");
      dynamic responseData;
      if (response.body is String) {
        responseData = jsonDecode(response.body);
      } else {
        responseData = response.body;
      }
      debugPrint("Due amount parsed data: $responseData");
      if (response.statusCode == 200) {
        dueAmountPaid.value = true;
        log("Amount paid status: ${dueAmountPaid.value}");
      } else {
        hideLoading();
        closeSnackBarIfActive();
        var errorMessage = 'Failed to fetch due amount';
        if (responseData is Map<String, dynamic>) {
          errorMessage = responseData['message']?.toString() ?? errorMessage;
        }
        // showCustomSnackBar(errorMessage, isError: true);
      }
    } catch (e, stackTrace) {
      hideLoading();
      log("Error getting due amount: $e");
      log("Stack trace: $stackTrace");
      showCustomSnackBar("Something went wrong. Please try again.",
          isError: true);
      debugPrint("Error fetching due amount: $e");
      closeSnackBarIfActive();
    } finally {
      _isLoginLoading = false;
      closeSnackBarIfActive();
      hideLoading();
    }
  }
}
