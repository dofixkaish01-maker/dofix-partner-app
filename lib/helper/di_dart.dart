import 'package:dofix_technichian/controllers/razorpay_qr_controller.dart';
import 'package:dofix_technichian/data/repo/account_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controllers/account_controller.dart';
import '../controllers/auth_controller.dart';
import '../controllers/dashboard_controller.dart';
import '../data/api/api.dart';
import '../data/repo/auth_repo.dart';
import '../utils/app_constants.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.put<SharedPreferences>(sharedPreferences, permanent: true);

  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.baseUrl, sharedPreferences: Get.find()));

  /// Repository
  // Get.lazyPut(
  //     () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  Get.put(
    AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()),
    permanent: true,
  );

  Get.lazyPut(
          () => AccountRepo(apiClient: Get.find(), sharedPreferences: Get.find()));

  /// Controller
  Get.lazyPut(() =>
      AuthController(authRepo: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() =>
      DashBoardController(authRepo: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => AccountController(
      accountRepo: Get.find(),
      sharedPreferences: Get.find(),
      authRepo: Get.find()));
  Get.lazyPut(() => RazorpayQRPaymentController());
}