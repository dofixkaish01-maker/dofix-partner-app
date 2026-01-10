import 'package:freezed_annotation/freezed_annotation.dart';

part 'provider_dashboard_model.freezed.dart';
part 'provider_dashboard_model.g.dart';

@freezed
class ProviderDashboardModel with _$ProviderDashboardModel {
  const factory ProviderDashboardModel({
    @JsonKey(name: 'response_code') String? responseCode,
    String? message,
    Content? content,
    List<dynamic>? errors,
  }) = _ProviderDashboardModel;

  factory ProviderDashboardModel.fromJson(Map<String, dynamic> json) => _$ProviderDashboardModelFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class Content with _$Content {
  const factory Content({
    @JsonKey(name: 'provider_info') ProviderInfo? providerInfo,
    @JsonKey(name: 'booking_overview') List<BookingOverview>? bookingOverview,
    @JsonKey(name: 'promotional_cost_percentage') PromotionalCostPercentage? promotionalCostPercentage,
    @JsonKey(name: 'subscription_info') SubscriptionInfo? subscriptionInfo,
  }) = _Content;

  factory Content.fromJson(Map<String, dynamic> json) => _$ContentFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class ProviderInfo with _$ProviderInfo {
  const factory ProviderInfo({
    String? id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'company_name') String? companyName,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'company_address') String? companyAddress,
    @JsonKey(name: 'contact_number') String? contactNumber,
    @JsonKey(name: 'alt_contact_number') String? altContactNumber,
    String? email,
    @JsonKey(name: 'zone_id') String? zoneId,
    Coordinates? coordinates,
    @JsonKey(name: 'adhar_number') String? adharNumber,
    @JsonKey(name: 'adhar_img') String? adharImg,
    @JsonKey(name: 'pan_number') String? panNumber,
    @JsonKey(name: 'pan_img') String? panImg,
    @JsonKey(name: 'dl_number') String? dlNumber,
    @JsonKey(name: 'dl_img') String? dlImg,
    @JsonKey(name: 'profile_img') String? profileImg,
    @JsonKey(name: 'service_availability') int? serviceAvailability,
    @JsonKey(name: 'is_approved') int? isApproved,
    @JsonKey(name: 'is_active') int? isActive,
    @JsonKey(name: 'is_suspended') int? isSuspended,
    @JsonKey(name: 'rating_count') int? ratingCount,
    @JsonKey(name: 'avg_rating') int? avgRating,
    @JsonKey(name: 'bank_docs') String? bankDocs,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'cash_limit_status') String? cashLimitStatus,
    @JsonKey(name: 'logo_full_path') String? logoFullPath,
    Owner? owner,
  }) = _ProviderInfo;

  factory ProviderInfo.fromJson(Map<String, dynamic> json) => _$ProviderInfoFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class Coordinates with _$Coordinates {
  const factory Coordinates({
    String? latitude,
    String? longitude,
  }) = _Coordinates;

  factory Coordinates.fromJson(Map<String, dynamic> json) => _$CoordinatesFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class Owner with _$Owner {
  const factory Owner({
    String? id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? email,
    String? phone,
    @JsonKey(name: 'identification_number') String? identificationNumber,
    @JsonKey(name: 'identification_type') String? identificationType,
    @JsonKey(name: 'identification_image') List<dynamic>? identificationImage,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    String? gender,
    @JsonKey(name: 'profile_image') String? profileImage,
    @JsonKey(name: 'fcm_token') String? fcmToken,
    @JsonKey(name: 'is_phone_verified') int? isPhoneVerified,
    @JsonKey(name: 'is_email_verified') int? isEmailVerified,
    @JsonKey(name: 'phone_verified_at') String? phoneVerifiedAt,
    @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
    @JsonKey(name: 'is_active') int? isActive,
    @JsonKey(name: 'user_type') String? userType,
    @JsonKey(name: 'remember_token') String? rememberToken,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'wallet_balance') int? walletBalance,
    @JsonKey(name: 'loyalty_point') int? loyaltyPoint,
    @JsonKey(name: 'ref_code') String? refCode,
    @JsonKey(name: 'referred_by') String? referredBy,
    @JsonKey(name: 'login_hit_count') int? loginHitCount,
    @JsonKey(name: 'is_temp_blocked') int? isTempBlocked,
    @JsonKey(name: 'temp_block_time') String? tempBlockTime,
    @JsonKey(name: 'current_language_key') String? currentLanguageKey,
    @JsonKey(name: 'profile_image_full_path') String? profileImageFullPath,
    @JsonKey(name: 'identification_image_full_path') List<dynamic>? identificationImageFullPath,
    Account? account,
    dynamic storage,
  }) = _Owner;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class Account with _$Account {
  const factory Account({
    String? id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'balance_pending') int? balancePending,
    @JsonKey(name: 'received_balance') int? receivedBalance,
    @JsonKey(name: 'account_payable') int? accountPayable,
    @JsonKey(name: 'account_receivable') int? accountReceivable,
    @JsonKey(name: 'total_withdrawn') int? totalWithdrawn,
    @JsonKey(name: 'total_expense') String? totalExpense,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _Account;

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class BookingOverview with _$BookingOverview {
  const factory BookingOverview({
    @JsonKey(name: 'booking_status') String? bookingStatus,
    int? total,
  }) = _BookingOverview;

  factory BookingOverview.fromJson(Map<String, dynamic> json) => _$BookingOverviewFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class PromotionalCostPercentage with _$PromotionalCostPercentage {
  const factory PromotionalCostPercentage({
    int? discount,
    int? campaign,
    int? coupon,
  }) = _PromotionalCostPercentage;

  factory PromotionalCostPercentage.fromJson(Map<String, dynamic> json) => _$PromotionalCostPercentageFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class SubscriptionInfo with _$SubscriptionInfo {
  const factory SubscriptionInfo({
    @JsonKey(name: 'total_subscription') int? totalSubscription,
    String? status,
    @JsonKey(name: 'subscribed_package_details') dynamic subscribedPackageDetails,
    @JsonKey(name: 'renewal_package_details') dynamic renewalPackageDetails,
    @JsonKey(name: 'applicable_vat') int? applicableVat,
  }) = _SubscriptionInfo;

  factory SubscriptionInfo.fromJson(Map<String, dynamic> json) => _$SubscriptionInfoFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
