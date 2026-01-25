class AppConstants {
  // static const String baseUrl = "https://lab7.invoidea.in/dofix/public/";
  static const String baseUrl = "https://panel.dofix.in/";
  // static const String baseUrl = "http://192.168.1.3:7000";
  static const String imgBaseUrl =
      "https://lab5.invoidea.in/offle/assets/admin/images/coupan/";
  static const String imgLogoBaseUrl =
      "https://lab5.invoidea.in/offle/assets/admin/images/logoImage/";
  static const String imgProfileBaseUrl =
      "https://panel.dofix.in/storage/provider/profile_img/";
  static const String aadharImageUrl =
      "https://panel.dofix.in/storage/provider/adhar_img/";
  static const String panImageUrl =
      "https://panel.dofix.in/storage/provider/pan_img/";
  static const String passbookImageUrl =
      "https://panel.dofix.in/storage/provider/passbook_img/";
  static const String dlImageUrl = "mybookshop/storage/provider/dl_img/";
  static const String cancelChequeImageUrl =
      "https://panel.dofix.in/storage/provider/cancelchequeImage/";
  static const String appName = 'DoFix Technician';
  static const double appVersion = 1.0;
  static const String fontFamily = 'AlbertSans';

  static const String couponListUrl = 'coupon/index';
  static const String configUri = 'api/v1/provider/config';
  static const String sendOtp = 'api/v1/provider/auth/send-otp';
  static const String getServiceCategory = 'api/v1/provider/auth/get-category';
  static const String verifyOtp = 'api/v1/provider/auth/verify-otp';
  static const String register = 'api/v1/provider/auth/registration';
  static const String category = 'api/v1/customer/category';
  static const String service = 'api/v1/customer/service';
  static const String serviceDetails = 'api/v1/customer/service/detail';
  static const String bookingDetails = 'api/v1/provider/booking/';
  static const String booking = 'api/v1/provider/booking';
  static const String bookAddOns = 'api/v1/customer/booking/addons-book';
  static const String addonServices = 'api/v1/provider/get-addons-services';
  static const String bookingSecond = 'api/v1/provider/booking/status-booking';
  static const String getStoredAddOn =
      'api/v1/customer/booking/get-store-addons';
  static const String dashboardUri = 'api/v1/provider/dashboard';
  static const String providerInfo = 'api/v1/provider';
  static const String updateBookingStatus =
      'api/v1/provider/booking/status-update';
  static const String zones = 'api/v1/customer/config/get-zone-id';
  static const String pages = 'api/v1/customer/config/pages';
  static const String categoriesToServices =
      'api/v1/customer/service/sub-category';
  static const String categoriesToSubCategories =
      'api/v1/customer/category/childes';
  static const String accountInfo = 'api/v1/provider/account/overview';
  static const String geoCodeLocation = 'api/v1/customer/config/geocode-api';
  static const String banners = 'api/v1/customer/banner';
  static const String reviewLists = 'api/v1/provider/review'; //here
  static const String homeStats = 'api/v1/provider/booking/home-stats';
  static const String couponShowUrl = 'coupon/show';
  static const String categoryListUrl = 'category/index';
  static const String categoryShowUrl = 'category/category-show';
  static const String forgotPassSendOtp = 'password/email';
  static const String forgotPassVerifyOtp = 'password/verify-code';
  static const String forgotPassNewPass = 'password/reset';
  static const String redeemedCoupon = 'coupon/redeem';
  static const String redeemedCouponList = 'coupon/redeem-list';
  static const String updateRegularBooking =
      'api/v1/provider/booking/service/edit/update-booking';

  static const String serviceListBasedOnSubCategory =
      'api/v1/provider/service/data/sub-category-wise';

  static const String theme = 'theme';
  static const String intro = 'intro';
  static const String token = 'token';

  static const String getBookingPriceList =
      'api/v1/provider/booking/service/info';

  static const String getWalletTransactionList = 'api/v1/provider/transactions';
  static const String getUserProfileDetails =
      'api/v1/customer/provider-details';
  static const String updateUserProfileDetails =
      'api/v1/provider/update/profile';
  static const String getBankDetails = 'api/v1/provider/get-bank-details';
  static const String updateBankDetails = 'api/v1/provider/update-bank-details';
  static const String getTodaysBooking = 'api/v1/provider/booking/today';
  static const String getProviderReview = 'api/v1/provider/review/list';
  static const String purchasePlan =
      'api/v1/provider/subscription/package/purchase';
  static const String getMySubscriptionDetails =
      'api/v1/provider/subscription/package/subscriber-details';
  static const String getSubscriptionPackagesList =
      'api/v1/provider/subscription/package/list';
  static const String walletRecharge =
      'api/v1/provider/account/wallet-recharge';
  static const String adjustMybalance = 'api/v1/provider/adjust';
  static const String getWithdrawMethods = 'api/v1/provider/withdraw/methods';
  static const String withdrawBalance = 'api/v1/provider/withdraw';
  static const String getBookingDueAmount =
      'api/v1/customer/booking/get-due-amount';
  static const String updateBookingDueAmount =
      'api/v1/customer/booking/update-due-payment-success';
}
