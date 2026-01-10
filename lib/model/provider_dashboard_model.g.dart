// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProviderDashboardModel _$ProviderDashboardModelFromJson(
        Map<String, dynamic> json) =>
    _ProviderDashboardModel(
      responseCode: json['response_code'] as String?,
      message: json['message'] as String?,
      content: json['content'] == null
          ? null
          : Content.fromJson(json['content'] as Map<String, dynamic>),
      errors: json['errors'] as List<dynamic>?,
    );

Map<String, dynamic> _$ProviderDashboardModelToJson(
        _ProviderDashboardModel instance) =>
    <String, dynamic>{
      'response_code': instance.responseCode,
      'message': instance.message,
      'content': instance.content,
      'errors': instance.errors,
    };

_Content _$ContentFromJson(Map<String, dynamic> json) => _Content(
      providerInfo: json['provider_info'] == null
          ? null
          : ProviderInfo.fromJson(
              json['provider_info'] as Map<String, dynamic>),
      bookingOverview: (json['booking_overview'] as List<dynamic>?)
          ?.map((e) => BookingOverview.fromJson(e as Map<String, dynamic>))
          .toList(),
      promotionalCostPercentage: json['promotional_cost_percentage'] == null
          ? null
          : PromotionalCostPercentage.fromJson(
              json['promotional_cost_percentage'] as Map<String, dynamic>),
      subscriptionInfo: json['subscription_info'] == null
          ? null
          : SubscriptionInfo.fromJson(
              json['subscription_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContentToJson(_Content instance) => <String, dynamic>{
      'provider_info': instance.providerInfo,
      'booking_overview': instance.bookingOverview,
      'promotional_cost_percentage': instance.promotionalCostPercentage,
      'subscription_info': instance.subscriptionInfo,
    };

_ProviderInfo _$ProviderInfoFromJson(Map<String, dynamic> json) =>
    _ProviderInfo(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      companyName: json['company_name'] as String?,
      fullName: json['full_name'] as String?,
      companyAddress: json['company_address'] as String?,
      contactNumber: json['contact_number'] as String?,
      altContactNumber: json['alt_contact_number'] as String?,
      email: json['email'] as String?,
      zoneId: json['zone_id'] as String?,
      coordinates: json['coordinates'] == null
          ? null
          : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>),
      adharNumber: json['adhar_number'] as String?,
      adharImg: json['adhar_img'] as String?,
      panNumber: json['pan_number'] as String?,
      panImg: json['pan_img'] as String?,
      dlNumber: json['dl_number'] as String?,
      dlImg: json['dl_img'] as String?,
      profileImg: json['profile_img'] as String?,
      serviceAvailability: (json['service_availability'] as num?)?.toInt(),
      isApproved: (json['is_approved'] as num?)?.toInt(),
      isActive: (json['is_active'] as num?)?.toInt(),
      isSuspended: (json['is_suspended'] as num?)?.toInt(),
      ratingCount: (json['rating_count'] as num?)?.toInt(),
      avgRating: (json['avg_rating'] as num?)?.toInt(),
      bankDocs: json['bank_docs'] as String?,
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      cashLimitStatus: json['cash_limit_status'] as String?,
      logoFullPath: json['logo_full_path'] as String?,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProviderInfoToJson(_ProviderInfo instance) =>
    <String, dynamic>{
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
      'cash_limit_status': instance.cashLimitStatus,
      'logo_full_path': instance.logoFullPath,
      'owner': instance.owner,
    };

_Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => _Coordinates(
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
    );

Map<String, dynamic> _$CoordinatesToJson(_Coordinates instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_Owner _$OwnerFromJson(Map<String, dynamic> json) => _Owner(
      id: json['id'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      identificationNumber: json['identification_number'] as String?,
      identificationType: json['identification_type'] as String?,
      identificationImage: json['identification_image'] as List<dynamic>?,
      dateOfBirth: json['date_of_birth'] as String?,
      gender: json['gender'] as String?,
      profileImage: json['profile_image'] as String?,
      fcmToken: json['fcm_token'] as String?,
      isPhoneVerified: (json['is_phone_verified'] as num?)?.toInt(),
      isEmailVerified: (json['is_email_verified'] as num?)?.toInt(),
      phoneVerifiedAt: json['phone_verified_at'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      isActive: (json['is_active'] as num?)?.toInt(),
      userType: json['user_type'] as String?,
      rememberToken: json['remember_token'] as String?,
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      walletBalance: (json['wallet_balance'] as num?)?.toInt(),
      loyaltyPoint: (json['loyalty_point'] as num?)?.toInt(),
      refCode: json['ref_code'] as String?,
      referredBy: json['referred_by'] as String?,
      loginHitCount: (json['login_hit_count'] as num?)?.toInt(),
      isTempBlocked: (json['is_temp_blocked'] as num?)?.toInt(),
      tempBlockTime: json['temp_block_time'] as String?,
      currentLanguageKey: json['current_language_key'] as String?,
      profileImageFullPath: json['profile_image_full_path'] as String?,
      identificationImageFullPath:
          json['identification_image_full_path'] as List<dynamic>?,
      account: json['account'] == null
          ? null
          : Account.fromJson(json['account'] as Map<String, dynamic>),
      storage: json['storage'],
    );

Map<String, dynamic> _$OwnerToJson(_Owner instance) => <String, dynamic>{
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
      'account': instance.account,
      'storage': instance.storage,
    };

_Account _$AccountFromJson(Map<String, dynamic> json) => _Account(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      balancePending: (json['balance_pending'] as num?)?.toInt(),
      receivedBalance: (json['received_balance'] as num?)?.toInt(),
      accountPayable: (json['account_payable'] as num?)?.toInt(),
      accountReceivable: (json['account_receivable'] as num?)?.toInt(),
      totalWithdrawn: (json['total_withdrawn'] as num?)?.toInt(),
      totalExpense: json['total_expense'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$AccountToJson(_Account instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'balance_pending': instance.balancePending,
      'received_balance': instance.receivedBalance,
      'account_payable': instance.accountPayable,
      'account_receivable': instance.accountReceivable,
      'total_withdrawn': instance.totalWithdrawn,
      'total_expense': instance.totalExpense,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

_BookingOverview _$BookingOverviewFromJson(Map<String, dynamic> json) =>
    _BookingOverview(
      bookingStatus: json['booking_status'] as String?,
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BookingOverviewToJson(_BookingOverview instance) =>
    <String, dynamic>{
      'booking_status': instance.bookingStatus,
      'total': instance.total,
    };

_PromotionalCostPercentage _$PromotionalCostPercentageFromJson(
        Map<String, dynamic> json) =>
    _PromotionalCostPercentage(
      discount: (json['discount'] as num?)?.toInt(),
      campaign: (json['campaign'] as num?)?.toInt(),
      coupon: (json['coupon'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PromotionalCostPercentageToJson(
        _PromotionalCostPercentage instance) =>
    <String, dynamic>{
      'discount': instance.discount,
      'campaign': instance.campaign,
      'coupon': instance.coupon,
    };

_SubscriptionInfo _$SubscriptionInfoFromJson(Map<String, dynamic> json) =>
    _SubscriptionInfo(
      totalSubscription: (json['total_subscription'] as num?)?.toInt(),
      status: json['status'] as String?,
      subscribedPackageDetails: json['subscribed_package_details'],
      renewalPackageDetails: json['renewal_package_details'],
      applicableVat: (json['applicable_vat'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SubscriptionInfoToJson(_SubscriptionInfo instance) =>
    <String, dynamic>{
      'total_subscription': instance.totalSubscription,
      'status': instance.status,
      'subscribed_package_details': instance.subscribedPackageDetails,
      'renewal_package_details': instance.renewalPackageDetails,
      'applicable_vat': instance.applicableVat,
    };
