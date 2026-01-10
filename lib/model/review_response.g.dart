// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewResponse _$ReviewResponseFromJson(Map<String, dynamic> json) =>
    _ReviewResponse(
      responseCode: json['response_code'] as String,
      message: json['message'] as String,
      content: json['content'] == null
          ? null
          : ReviewContent.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewResponseToJson(_ReviewResponse instance) =>
    <String, dynamic>{
      'response_code': instance.responseCode,
      'message': instance.message,
      'content': instance.content,
    };

_ReviewContent _$ReviewContentFromJson(Map<String, dynamic> json) =>
    _ReviewContent(
      reviews:
          ReviewPagination.fromJson(json['reviews'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ReviewContentToJson(_ReviewContent instance) =>
    <String, dynamic>{
      'reviews': instance.reviews,
    };

_ReviewPagination _$ReviewPaginationFromJson(Map<String, dynamic> json) =>
    _ReviewPagination(
      currentPage: (json['current_page'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => ReviewData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ReviewPaginationToJson(_ReviewPagination instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data,
    };

_ReviewData _$ReviewDataFromJson(Map<String, dynamic> json) => _ReviewData(
      id: json['id'] as String,
      readableId: (json['readable_id'] as num).toInt(),
      bookingId: json['booking_id'] as String,
      serviceId: json['service_id'] as String,
      providerId: json['provider_id'] as String,
      reviewRating: (json['review_rating'] as num).toInt(),
      reviewComment: json['review_comment'] as String,
      reviewImages: json['review_images'] as List<dynamic>,
      bookingDate: json['booking_date'] as String,
      isActive: (json['is_active'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      customerId: json['customer_id'] as String,
      booking: json['booking'] == null
          ? null
          : Booking.fromJson(json['booking'] as Map<String, dynamic>),
      provider: json['provider'] == null
          ? null
          : Provider.fromJson(json['provider'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : Customer.fromJson(json['customer'] as Map<String, dynamic>),
      reviewReply: json['review_reply'],
      service: json['service'],
    );

Map<String, dynamic> _$ReviewDataToJson(_ReviewData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'readable_id': instance.readableId,
      'booking_id': instance.bookingId,
      'service_id': instance.serviceId,
      'provider_id': instance.providerId,
      'review_rating': instance.reviewRating,
      'review_comment': instance.reviewComment,
      'review_images': instance.reviewImages,
      'booking_date': instance.bookingDate,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'customer_id': instance.customerId,
      'booking': instance.booking,
      'provider': instance.provider,
      'customer': instance.customer,
      'review_reply': instance.reviewReply,
      'service': instance.service,
    };

_Booking _$BookingFromJson(Map<String, dynamic> json) => _Booking(
      id: json['id'] as String,
      readableId: (json['readable_id'] as num).toInt(),
      customerId: json['customer_id'] as String,
      providerId: json['provider_id'] as String,
      zoneId: json['zone_id'] as String,
      bookingStatus: json['booking_status'] as String,
      isPaid: (json['is_paid'] as num).toInt(),
      paymentMethod: json['payment_method'] as String,
      transactionId: json['transaction_id'] as String,
      totalBookingAmount: json['total_booking_amount'] as num,
      totalTaxAmount: json['total_tax_amount'] as num,
      totalDiscountAmount: json['total_discount_amount'] as num,
      serviceSchedule: json['service_schedule'] as String,
      serviceAddressId: json['service_address_id'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      categoryId: json['category_id'] as String,
      subCategoryId: json['sub_category_id'] as String,
      servicemanId: json['serviceman_id'] as String?,
      totalCampaignDiscountAmount:
          json['total_campaign_discount_amount'] as num,
      totalCouponDiscountAmount: json['total_coupon_discount_amount'] as num,
      couponCode: json['coupon_code'] as String?,
      isChecked: (json['is_checked'] as num).toInt(),
      servicePreference: (json['service_preference'] as num).toInt(),
      additionalCharge: json['additional_charge'] as num,
      additionalTaxAmount: json['additional_tax_amount'] as num,
      additionalDiscountAmount: json['additional_discount_amount'] as num,
      additionalCampaignDiscountAmount:
          json['additional_campaign_discount_amount'] as num,
      removedCouponAmount: json['removed_coupon_amount'] as String,
      reachImage: json['reach_image'] as String?,
      evidencePhotos: json['evidence_photos'],
      bookingOtp: json['booking_otp'] as String,
      isGuest: (json['is_guest'] as num).toInt(),
      isVerified: (json['is_verified'] as num).toInt(),
      extraFee: json['extra_fee'] as num,
      totalReferralDiscountAmount:
          json['total_referral_discount_amount'] as num,
      isRepeated: (json['is_repeated'] as num).toInt(),
      assignedBy: json['assigned_by'],
      evidencePhotosFullPath:
          json['evidence_photos_full_path'] as List<dynamic>,
      detail: (json['detail'] as List<dynamic>)
          .map((e) => BookingDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BookingToJson(_Booking instance) => <String, dynamic>{
      'id': instance.id,
      'readable_id': instance.readableId,
      'customer_id': instance.customerId,
      'provider_id': instance.providerId,
      'zone_id': instance.zoneId,
      'booking_status': instance.bookingStatus,
      'is_paid': instance.isPaid,
      'payment_method': instance.paymentMethod,
      'transaction_id': instance.transactionId,
      'total_booking_amount': instance.totalBookingAmount,
      'total_tax_amount': instance.totalTaxAmount,
      'total_discount_amount': instance.totalDiscountAmount,
      'service_schedule': instance.serviceSchedule,
      'service_address_id': instance.serviceAddressId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'category_id': instance.categoryId,
      'sub_category_id': instance.subCategoryId,
      'serviceman_id': instance.servicemanId,
      'total_campaign_discount_amount': instance.totalCampaignDiscountAmount,
      'total_coupon_discount_amount': instance.totalCouponDiscountAmount,
      'coupon_code': instance.couponCode,
      'is_checked': instance.isChecked,
      'service_preference': instance.servicePreference,
      'additional_charge': instance.additionalCharge,
      'additional_tax_amount': instance.additionalTaxAmount,
      'additional_discount_amount': instance.additionalDiscountAmount,
      'additional_campaign_discount_amount':
          instance.additionalCampaignDiscountAmount,
      'removed_coupon_amount': instance.removedCouponAmount,
      'reach_image': instance.reachImage,
      'evidence_photos': instance.evidencePhotos,
      'booking_otp': instance.bookingOtp,
      'is_guest': instance.isGuest,
      'is_verified': instance.isVerified,
      'extra_fee': instance.extraFee,
      'total_referral_discount_amount': instance.totalReferralDiscountAmount,
      'is_repeated': instance.isRepeated,
      'assigned_by': instance.assignedBy,
      'evidence_photos_full_path': instance.evidencePhotosFullPath,
      'detail': instance.detail,
    };

_BookingDetail _$BookingDetailFromJson(Map<String, dynamic> json) =>
    _BookingDetail(
      id: (json['id'] as num).toInt(),
      bookingId: json['booking_id'] as String,
      serviceId: json['service_id'] as String,
      serviceName: json['service_name'] as String,
      variantKey: json['variant_key'] as String,
      serviceCost: json['service_cost'] as num,
      quantity: (json['quantity'] as num).toInt(),
      discountAmount: json['discount_amount'] as num,
      taxAmount: json['tax_amount'] as num,
      totalCost: json['total_cost'] as num,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      campaignDiscountAmount: json['campaign_discount_amount'] as num,
      overallCouponDiscountAmount:
          json['overall_coupon_discount_amount'] as num,
    );

Map<String, dynamic> _$BookingDetailToJson(_BookingDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'booking_id': instance.bookingId,
      'service_id': instance.serviceId,
      'service_name': instance.serviceName,
      'variant_key': instance.variantKey,
      'service_cost': instance.serviceCost,
      'quantity': instance.quantity,
      'discount_amount': instance.discountAmount,
      'tax_amount': instance.taxAmount,
      'total_cost': instance.totalCost,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'campaign_discount_amount': instance.campaignDiscountAmount,
      'overall_coupon_discount_amount': instance.overallCouponDiscountAmount,
    };

_Provider _$ProviderFromJson(Map<String, dynamic> json) => _Provider(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      companyName: json['company_name'] as String,
      fullName: json['full_name'] as String,
      companyAddress: json['company_address'] as String,
      contactNumber: json['contact_number'] as String,
      altContactNumber: json['alt_contact_number'] as String,
      email: json['email'] as String,
      zoneId: json['zone_id'] as String,
      coordinates:
          Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      adharNumber: json['adhar_number'] as String,
      adharImg: json['adhar_img'] as String,
      panNumber: json['pan_number'] as String,
      panImg: json['pan_img'] as String,
      dlNumber: json['dl_number'] as String,
      dlImg: json['dl_img'] as String,
      profileImg: json['profile_img'] as String,
      serviceAvailability: (json['service_availability'] as num).toInt(),
      isApproved: (json['is_approved'] as num).toInt(),
      isActive: (json['is_active'] as num).toInt(),
      isSuspended: (json['is_suspended'] as num).toInt(),
      ratingCount: (json['rating_count'] as num?)?.toInt() ?? 0,
      avgRating: (json['avg_rating'] as num).toDouble(),
      bankDocs: json['bank_docs'] as String,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      logoFullPath: json['logo_full_path'],
    );

Map<String, dynamic> _$ProviderToJson(_Provider instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'company_name': instance.companyName,
      'full_name': instance.fullName,
      'company_address': instance.companyAddress,
      'contact_number': instance.contactNumber,
      'alt_contact_number': instance.altContactNumber,
      'email': instance.email,
      'zone_id': instance.zoneId,
      'coordinates': instance.coordinates,
      'adhar_number': instance.adharNumber,
      'adhar_img': instance.adharImg,
      'pan_number': instance.panNumber,
      'pan_img': instance.panImg,
      'dl_number': instance.dlNumber,
      'dl_img': instance.dlImg,
      'profile_img': instance.profileImg,
      'service_availability': instance.serviceAvailability,
      'is_approved': instance.isApproved,
      'is_active': instance.isActive,
      'is_suspended': instance.isSuspended,
      'rating_count': instance.ratingCount,
      'avg_rating': instance.avgRating,
      'bank_docs': instance.bankDocs,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'logo_full_path': instance.logoFullPath,
    };

_Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => _Coordinates(
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
    );

Map<String, dynamic> _$CoordinatesToJson(_Coordinates instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_Customer _$CustomerFromJson(Map<String, dynamic> json) => _Customer(
      id: json['id'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      identificationNumber: json['identification_number'],
      identificationType: json['identification_type'] as String,
      identificationImage: json['identification_image'] as List<dynamic>,
      dateOfBirth: json['date_of_birth'],
      gender: json['gender'] as String,
      profileImage: json['profile_image'] as String,
      fcmToken: json['fcm_token'] as String?,
      isPhoneVerified: (json['is_phone_verified'] as num).toInt(),
      isEmailVerified: (json['is_email_verified'] as num).toInt(),
      phoneVerifiedAt: json['phone_verified_at'],
      emailVerifiedAt: json['email_verified_at'],
      isActive: (json['is_active'] as num).toInt(),
      userType: json['user_type'] as String,
      rememberToken: json['remember_token'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      walletBalance: (json['wallet_balance'] as num).toInt(),
      loyaltyPoint: (json['loyalty_point'] as num).toInt(),
      refCode: json['ref_code'] as String,
      referredBy: json['referred_by'],
      loginHitCount: (json['login_hit_count'] as num).toInt(),
      isTempBlocked: (json['is_temp_blocked'] as num).toInt(),
      tempBlockTime: json['temp_block_time'],
      currentLanguageKey: json['current_language_key'] as String,
      profileImageFullPath: json['profile_image_full_path'],
      identificationImageFullPath:
          json['identification_image_full_path'] as List<dynamic>,
      storage: json['storage'],
    );

Map<String, dynamic> _$CustomerToJson(_Customer instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'phone': instance.phone,
      'identification_number': instance.identificationNumber,
      'identification_type': instance.identificationType,
      'identification_image': instance.identificationImage,
      'date_of_birth': instance.dateOfBirth,
      'gender': instance.gender,
      'profile_image': instance.profileImage,
      'fcm_token': instance.fcmToken,
      'is_phone_verified': instance.isPhoneVerified,
      'is_email_verified': instance.isEmailVerified,
      'phone_verified_at': instance.phoneVerifiedAt,
      'email_verified_at': instance.emailVerifiedAt,
      'is_active': instance.isActive,
      'user_type': instance.userType,
      'remember_token': instance.rememberToken,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'wallet_balance': instance.walletBalance,
      'loyalty_point': instance.loyaltyPoint,
      'ref_code': instance.refCode,
      'referred_by': instance.referredBy,
      'login_hit_count': instance.loginHitCount,
      'is_temp_blocked': instance.isTempBlocked,
      'temp_block_time': instance.tempBlockTime,
      'current_language_key': instance.currentLanguageKey,
      'profile_image_full_path': instance.profileImageFullPath,
      'identification_image_full_path': instance.identificationImageFullPath,
      'storage': instance.storage,
    };
