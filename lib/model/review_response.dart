import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_response.freezed.dart';
part 'review_response.g.dart';

@freezed
class ReviewResponse with _$ReviewResponse {
  const factory ReviewResponse({
    @JsonKey(name: 'response_code') required String responseCode,
    required String message,
    ReviewContent? content,
  }) = _ReviewResponse;

  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class ReviewContent with _$ReviewContent {
  const factory ReviewContent({
    required ReviewPagination reviews,
  }) = _ReviewContent;

  factory ReviewContent.fromJson(Map<String, dynamic> json) =>
      _$ReviewContentFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class ReviewPagination with _$ReviewPagination {
  const factory ReviewPagination({
    @JsonKey(name: 'current_page') required int currentPage,
    required List<ReviewData> data,
  }) = _ReviewPagination;

  factory ReviewPagination.fromJson(Map<String, dynamic> json) =>
      _$ReviewPaginationFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class ReviewData with _$ReviewData {
  const factory ReviewData({
    required String id,
    @JsonKey(name: 'readable_id') required int readableId,
    @JsonKey(name: 'booking_id') required String bookingId,
    @JsonKey(name: 'service_id') required String serviceId,
    @JsonKey(name: 'provider_id') required String providerId,
    @JsonKey(name: 'review_rating') required int reviewRating,
    @JsonKey(name: 'review_comment') required String reviewComment,
    @JsonKey(name: 'review_images') required List<dynamic> reviewImages,
    @JsonKey(name: 'booking_date') required String bookingDate,
    @JsonKey(name: 'is_active') required int isActive,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'customer_id') required String customerId,
    Booking? booking,
    Provider? provider,
    Customer? customer,
    @JsonKey(name: 'review_reply') dynamic reviewReply,
    dynamic service,
  }) = _ReviewData;

  factory ReviewData.fromJson(Map<String, dynamic> json) =>
      _$ReviewDataFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class Booking with _$Booking {
  const factory Booking({
    required String id,
    @JsonKey(name: 'readable_id') required int readableId,
    @JsonKey(name: 'customer_id') required String customerId,
    @JsonKey(name: 'provider_id') required String providerId,
    @JsonKey(name: 'zone_id') required String zoneId,
    @JsonKey(name: 'booking_status') required String bookingStatus,
    @JsonKey(name: 'is_paid') required int isPaid,
    @JsonKey(name: 'payment_method') required String paymentMethod,
    @JsonKey(name: 'transaction_id') required String transactionId,
    @JsonKey(name: 'total_booking_amount') required num totalBookingAmount,
    @JsonKey(name: 'total_tax_amount') required num totalTaxAmount,
    @JsonKey(name: 'total_discount_amount') required num totalDiscountAmount,
    @JsonKey(name: 'service_schedule') required String serviceSchedule,
    @JsonKey(name: 'service_address_id') required String serviceAddressId,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'category_id') required String categoryId,
    @JsonKey(name: 'sub_category_id') required String subCategoryId,
    @JsonKey(name: 'serviceman_id') String? servicemanId,
    @JsonKey(name: 'total_campaign_discount_amount')
    required num totalCampaignDiscountAmount,
    @JsonKey(name: 'total_coupon_discount_amount')
    required num totalCouponDiscountAmount,
    @JsonKey(name: 'coupon_code') String? couponCode,
    @JsonKey(name: 'is_checked') required int isChecked,
    @JsonKey(name: 'service_preference') required int servicePreference,
    @JsonKey(name: 'additional_charge') required num additionalCharge,
    @JsonKey(name: 'additional_tax_amount') required num additionalTaxAmount,
    @JsonKey(name: 'additional_discount_amount')
    required num additionalDiscountAmount,
    @JsonKey(name: 'additional_campaign_discount_amount')
    required num additionalCampaignDiscountAmount,
    @JsonKey(name: 'removed_coupon_amount') required String removedCouponAmount,
    @JsonKey(name: 'reach_image') String? reachImage,
    @JsonKey(name: 'evidence_photos') dynamic evidencePhotos,
    @JsonKey(name: 'booking_otp') required String bookingOtp,
    @JsonKey(name: 'is_guest') required int isGuest,
    @JsonKey(name: 'is_verified') required int isVerified,
    @JsonKey(name: 'extra_fee') required num extraFee,
    @JsonKey(name: 'total_referral_discount_amount')
    required num totalReferralDiscountAmount,
    @JsonKey(name: 'is_repeated') required int isRepeated,
    @JsonKey(name: 'assigned_by') dynamic assignedBy,
    @JsonKey(name: 'evidence_photos_full_path')
    required List<dynamic> evidencePhotosFullPath,
    required List<BookingDetail> detail,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class BookingDetail with _$BookingDetail {
  const factory BookingDetail({
    required int id,
    @JsonKey(name: 'booking_id') required String bookingId,
    @JsonKey(name: 'service_id') required String serviceId,
    @JsonKey(name: 'service_name') required String serviceName,
    @JsonKey(name: 'variant_key') required String variantKey,
    @JsonKey(name: 'service_cost') required num serviceCost,
    required int quantity,
    @JsonKey(name: 'discount_amount') required num discountAmount,
    @JsonKey(name: 'tax_amount') required num taxAmount,
    @JsonKey(name: 'total_cost') required num totalCost,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'campaign_discount_amount')
    required num campaignDiscountAmount,
    @JsonKey(name: 'overall_coupon_discount_amount')
    required num overallCouponDiscountAmount,
  }) = _BookingDetail;

  factory BookingDetail.fromJson(Map<String, dynamic> json) =>
      _$BookingDetailFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class Provider with _$Provider {
  const factory Provider({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'company_name') required String companyName,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'company_address') required String companyAddress,
    @JsonKey(name: 'contact_number') required String contactNumber,
    @JsonKey(name: 'alt_contact_number') required String altContactNumber,
    required String email,
    @JsonKey(name: 'zone_id') required String zoneId,
    required Coordinates coordinates,
    @JsonKey(name: 'adhar_number') required String adharNumber,
    @JsonKey(name: 'adhar_img') required String adharImg,
    @JsonKey(name: 'pan_number') required String panNumber,
    @JsonKey(name: 'pan_img') required String panImg,
    @JsonKey(name: 'dl_number') required String dlNumber,
    @JsonKey(name: 'dl_img') required String dlImg,
    @JsonKey(name: 'profile_img') required String profileImg,
    @JsonKey(name: 'service_availability') required int serviceAvailability,
    @JsonKey(name: 'is_approved') required int isApproved,
    @JsonKey(name: 'is_active') required int isActive,
    @JsonKey(name: 'is_suspended') required int isSuspended,
    @Default(0) @JsonKey(name: 'rating_count') int? ratingCount,
    @JsonKey(name: 'avg_rating') required double avgRating,
    @JsonKey(name: 'bank_docs') required String bankDocs,
    @JsonKey(name: 'deleted_at') dynamic deletedAt,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'logo_full_path') dynamic logoFullPath,
  }) = _Provider;

  factory Provider.fromJson(Map<String, dynamic> json) =>
      _$ProviderFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class Coordinates with _$Coordinates {
  const factory Coordinates({
    required String latitude,
    required String longitude,
  }) = _Coordinates;

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class Customer with _$Customer {
  const factory Customer({
    required String id,
    @JsonKey(name: 'first_name') required String firstName,
    @JsonKey(name: 'last_name') required String lastName,
    required String email,
    required String phone,
    @JsonKey(name: 'identification_number') dynamic identificationNumber,
    @JsonKey(name: 'identification_type') required String identificationType,
    @JsonKey(name: 'identification_image')
    required List<dynamic> identificationImage,
    @JsonKey(name: 'date_of_birth') dynamic dateOfBirth,
    required String gender,
    @JsonKey(name: 'profile_image') required String profileImage,
    @JsonKey(name: 'fcm_token') String? fcmToken,
    @JsonKey(name: 'is_phone_verified') required int isPhoneVerified,
    @JsonKey(name: 'is_email_verified') required int isEmailVerified,
    @JsonKey(name: 'phone_verified_at') dynamic phoneVerifiedAt,
    @JsonKey(name: 'email_verified_at') dynamic emailVerifiedAt,
    @JsonKey(name: 'is_active') required int isActive,
    @JsonKey(name: 'user_type') required String userType,
    @JsonKey(name: 'remember_token') dynamic rememberToken,
    @JsonKey(name: 'deleted_at') dynamic deletedAt,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'wallet_balance') required int walletBalance,
    @JsonKey(name: 'loyalty_point') required int loyaltyPoint,
    @JsonKey(name: 'ref_code') required String refCode,
    @JsonKey(name: 'referred_by') dynamic referredBy,
    @JsonKey(name: 'login_hit_count') required int loginHitCount,
    @JsonKey(name: 'is_temp_blocked') required int isTempBlocked,
    @JsonKey(name: 'temp_block_time') dynamic tempBlockTime,
    @JsonKey(name: 'current_language_key') required String currentLanguageKey,
    @JsonKey(name: 'profile_image_full_path') dynamic profileImageFullPath,
    @JsonKey(name: 'identification_image_full_path')
    required List<dynamic> identificationImageFullPath,
    dynamic storage,
  }) = _Customer;

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
