class BookingDetailModel {
  final String? responseCode;
  final String? message;
  final Content? content;
  final List<dynamic>? errors;

  BookingDetailModel({
    this.responseCode,
    this.message,
    this.content,
    this.errors,
  });

  factory BookingDetailModel.fromJson(Map<String, dynamic> json) =>
      BookingDetailModel(
        responseCode: json['response_code']?.toString(),
        message: json['message']?.toString(),
        content:
            json['content'] != null ? Content.fromJson(json['content']) : null,
        errors: json['errors'],
      );

  Map<String, dynamic> toJson() => {
        'response_code': responseCode,
        'message': message,
        'content': content?.toJson(),
        'errors': errors,
      };
}

class Content {
  final String? id;
  final int? readableId;
  final String? customerId;
  final String? providerId;
  final String? zoneId;
  final String? bookingStatus;
  final int? isPaid;
  final String? paymentMethod;
  final String? transactionId;
  final double? totalBookingAmount;
  final double? totalTaxAmount;
  final int? totalDiscountAmount;
  final DateTime? serviceSchedule;
  final String? serviceAddressId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? categoryId;
  final String? subCategoryId;
  final dynamic servicemanId;
  final int? totalCampaignDiscountAmount;
  final int? totalCouponDiscountAmount;
  final dynamic couponCode;
  final int? isChecked;
  final int? servicePreference;
  final int? additionalCharge;
  final int? additionalTaxAmount;
  final int? additionalDiscountAmount;
  final int? additionalCampaignDiscountAmount;
  final String? removedCouponAmount;
  final dynamic reachImage;
  final dynamic evidencePhotos;
  final String? bookingOtp;
  final int? isGuest;
  final int? isVerified;
  final int? extraFee;
  final int? totalReferralDiscountAmount;
  final int? isRepeated;
  final dynamic assignedBy;
  final String? message;
  final List<dynamic>? evidencePhotosFullPath;
  final List<Detail>? detail;
  final List<History>? scheduleHistories;
  final List<History>? statusHistories;
  final ServiceAddress? serviceAddress;
  final Customer? customer;
  final Provider? provider;
  final Zone? zone;
  final dynamic serviceman;
  final List<dynamic>? bookingPartialPayments;
  final List<dynamic>? repeat;
  final bool? isPreWorkMediaUploaded;
  final bool? isPostWorkMediaUploaded;

  Content({
    this.id,
    this.readableId,
    this.customerId,
    this.providerId,
    this.zoneId,
    this.bookingStatus,
    this.isPaid,
    this.paymentMethod,
    this.transactionId,
    this.totalBookingAmount,
    this.totalTaxAmount,
    this.totalDiscountAmount,
    this.serviceSchedule,
    this.serviceAddressId,
    this.createdAt,
    this.updatedAt,
    this.categoryId,
    this.subCategoryId,
    this.servicemanId,
    this.totalCampaignDiscountAmount,
    this.totalCouponDiscountAmount,
    this.couponCode,
    this.isChecked,
    this.servicePreference,
    this.additionalCharge,
    this.additionalTaxAmount,
    this.additionalDiscountAmount,
    this.additionalCampaignDiscountAmount,
    this.removedCouponAmount,
    this.reachImage,
    this.evidencePhotos,
    this.bookingOtp,
    this.isGuest,
    this.isVerified,
    this.extraFee,
    this.totalReferralDiscountAmount,
    this.isRepeated,
    this.assignedBy,
    this.message,
    this.evidencePhotosFullPath,
    this.detail,
    this.scheduleHistories,
    this.statusHistories,
    this.serviceAddress,
    this.customer,
    this.provider,
    this.zone,
    this.serviceman,
    this.bookingPartialPayments,
    this.repeat,
    this.isPreWorkMediaUploaded,
    this.isPostWorkMediaUploaded,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json['id']?.toString(),
        readableId: json['readable_id'] is int
            ? json['readable_id']
            : int.tryParse(json['readable_id']?.toString() ?? ''),
        customerId: json['customer_id']?.toString(),
        providerId: json['provider_id']?.toString(),
        zoneId: json['zone_id']?.toString(),
        bookingStatus: json['booking_status']?.toString(),
        isPaid: json['is_paid'] is int
            ? json['is_paid']
            : int.tryParse(json['is_paid']?.toString() ?? ''),
        paymentMethod: json['payment_method']?.toString(),
        transactionId: json['transaction_id']?.toString(),
        totalBookingAmount: json['total_booking_amount'] is double
            ? json['total_booking_amount']
            : double.tryParse(json['total_booking_amount']?.toString() ?? ''),
        totalTaxAmount: json['total_tax_amount'] is double
            ? json['total_tax_amount']
            : double.tryParse(json['total_tax_amount']?.toString() ?? ''),
        totalDiscountAmount: json['total_discount_amount'] is int
            ? json['total_discount_amount']
            : int.tryParse(json['total_discount_amount']?.toString() ?? ''),
        serviceSchedule: json['service_schedule'] != null
            ? DateTime.tryParse(json['service_schedule'])
            : null,
        serviceAddressId: json['service_address_id']?.toString(),
        createdAt: json['created_at'] != null
            ? DateTime.tryParse(json['created_at'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.tryParse(json['updated_at'])
            : null,
        categoryId: json['category_id']?.toString(),
        subCategoryId: json['sub_category_id']?.toString(),
        servicemanId: json['serviceman_id'],
        totalCampaignDiscountAmount:
            json['total_campaign_discount_amount'] is int
                ? json['total_campaign_discount_amount']
                : int.tryParse(
                    json['total_campaign_discount_amount']?.toString() ?? ''),
        totalCouponDiscountAmount: json['total_coupon_discount_amount'] is int
            ? json['total_coupon_discount_amount']
            : int.tryParse(
                json['total_coupon_discount_amount']?.toString() ?? ''),
        couponCode: json['coupon_code'],
        isChecked: json['is_checked'] is int
            ? json['is_checked']
            : int.tryParse(json['is_checked']?.toString() ?? ''),
        servicePreference: json['service_preference'] is int
            ? json['service_preference']
            : int.tryParse(json['service_preference']?.toString() ?? ''),
        additionalCharge: json['additional_charge'] is int
            ? json['additional_charge']
            : int.tryParse(json['additional_charge']?.toString() ?? ''),
        additionalTaxAmount: json['additional_tax_amount'] is int
            ? json['additional_tax_amount']
            : int.tryParse(json['additional_tax_amount']?.toString() ?? ''),
        additionalDiscountAmount: json['additional_discount_amount'] is int
            ? json['additional_discount_amount']
            : int.tryParse(
                json['additional_discount_amount']?.toString() ?? ''),
        additionalCampaignDiscountAmount:
            json['additional_campaign_discount_amount'] is int
                ? json['additional_campaign_discount_amount']
                : int.tryParse(
                    json['additional_campaign_discount_amount']?.toString() ??
                        ''),
        removedCouponAmount: json['removed_coupon_amount']?.toString(),
        reachImage: json['reach_image'],
        evidencePhotos: json['evidence_photos'],
        bookingOtp: json['booking_otp']?.toString(),
        isGuest: json['is_guest'] is int
            ? json['is_guest']
            : int.tryParse(json['is_guest']?.toString() ?? ''),
        isVerified: json['is_verified'] is int
            ? json['is_verified']
            : int.tryParse(json['is_verified']?.toString() ?? ''),
        extraFee: json['extra_fee'] is int
            ? json['extra_fee']
            : int.tryParse(json['extra_fee']?.toString() ?? ''),
        totalReferralDiscountAmount:
            json['total_referral_discount_amount'] is int
                ? json['total_referral_discount_amount']
                : int.tryParse(
                    json['total_referral_discount_amount']?.toString() ?? ''),
        isRepeated: json['is_repeated'] is int
            ? json['is_repeated']
            : int.tryParse(json['is_repeated']?.toString() ?? ''),
        assignedBy: json['assigned_by'],
        message: json['message']?.toString(),
        evidencePhotosFullPath: json['evidence_photos_full_path'],
        detail: json['detail'] != null
            ? List<Detail>.from(json['detail'].map((x) => Detail.fromJson(x)))
            : null,
        scheduleHistories: json['schedule_histories'] != null
            ? List<History>.from(
                json['schedule_histories'].map((x) => History.fromJson(x)))
            : null,
        statusHistories: json['status_histories'] != null
            ? List<History>.from(
                json['status_histories'].map((x) => History.fromJson(x)))
            : null,
        serviceAddress: json['service_address'] != null
            ? ServiceAddress.fromJson(json['service_address'])
            : null,
        customer: json['customer'] != null
            ? Customer.fromJson(json['customer'])
            : null,
        provider: json['provider'] != null
            ? Provider.fromJson(json['provider'])
            : null,
        zone: json['zone'] != null ? Zone.fromJson(json['zone']) : null,
        serviceman: json['serviceman'],
        bookingPartialPayments: json['booking_partial_payments'],
        repeat: json['repeat'],
        isPreWorkMediaUploaded: json['isPreWorkMediaUploaded'],
        isPostWorkMediaUploaded: json['isPostWorkMediaUploaded'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'readable_id': readableId,
        'customer_id': customerId,
        'provider_id': providerId,
        'zone_id': zoneId,
        'booking_status': bookingStatus,
        'is_paid': isPaid,
        'payment_method': paymentMethod,
        'transaction_id': transactionId,
        'total_booking_amount': totalBookingAmount,
        'total_tax_amount': totalTaxAmount,
        'total_discount_amount': totalDiscountAmount,
        'service_schedule': serviceSchedule?.toIso8601String(),
        'service_address_id': serviceAddressId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'category_id': categoryId,
        'sub_category_id': subCategoryId,
        'serviceman_id': servicemanId,
        'total_campaign_discount_amount': totalCampaignDiscountAmount,
        'total_coupon_discount_amount': totalCouponDiscountAmount,
        'coupon_code': couponCode,
        'is_checked': isChecked,
        'service_preference': servicePreference,
        'additional_charge': additionalCharge,
        'additional_tax_amount': additionalTaxAmount,
        'additional_discount_amount': additionalDiscountAmount,
        'additional_campaign_discount_amount': additionalCampaignDiscountAmount,
        'removed_coupon_amount': removedCouponAmount,
        'reach_image': reachImage,
        'evidence_photos': evidencePhotos,
        'booking_otp': bookingOtp,
        'is_guest': isGuest,
        'is_verified': isVerified,
        'extra_fee': extraFee,
        'total_referral_discount_amount': totalReferralDiscountAmount,
        'is_repeated': isRepeated,
        'assigned_by': assignedBy,
        'message': message,
        'evidence_photos_full_path': evidencePhotosFullPath,
        'detail': detail?.map((x) => x.toJson()).toList(),
        'schedule_histories':
            scheduleHistories?.map((x) => x.toJson()).toList(),
        'status_histories': statusHistories?.map((x) => x.toJson()).toList(),
        'service_address': serviceAddress?.toJson(),
        'customer': customer?.toJson(),
        'provider': provider?.toJson(),
        'zone': zone?.toJson(),
        'serviceman': serviceman,
        'booking_partial_payments': bookingPartialPayments,
        'repeat': repeat,
        'isPreWorkMediaUploaded': isPreWorkMediaUploaded,
        'isPostWorkMediaUploaded': isPostWorkMediaUploaded,
      };
}

class Customer {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final dynamic identificationNumber;
  final String? identificationType;
  final List<dynamic>? identificationImage;
  final dynamic dateOfBirth;
  final String? gender;
  final String? profileImage;
  final dynamic fcmToken;
  final int? isPhoneVerified;
  final int? isEmailVerified;
  final dynamic phoneVerifiedAt;
  final dynamic emailVerifiedAt;
  final int? isActive;
  final String? userType;
  final dynamic rememberToken;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? walletBalance;
  final int? loyaltyPoint;
  final String? refCode;
  final dynamic referredBy;
  final int? loginHitCount;
  final int? isTempBlocked;
  final dynamic tempBlockTime;
  final String? currentLanguageKey;
  final dynamic profileImageFullPath;
  final List<dynamic>? identificationImageFullPath;
  final dynamic storage;

  Customer({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.identificationNumber,
    this.identificationType,
    this.identificationImage,
    this.dateOfBirth,
    this.gender,
    this.profileImage,
    this.fcmToken,
    this.isPhoneVerified,
    this.isEmailVerified,
    this.phoneVerifiedAt,
    this.emailVerifiedAt,
    this.isActive,
    this.userType,
    this.rememberToken,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.walletBalance,
    this.loyaltyPoint,
    this.refCode,
    this.referredBy,
    this.loginHitCount,
    this.isTempBlocked,
    this.tempBlockTime,
    this.currentLanguageKey,
    this.profileImageFullPath,
    this.identificationImageFullPath,
    this.storage,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json['id']?.toString(),
        firstName: json['first_name']?.toString(),
        lastName: json['last_name']?.toString(),
        email: json['email']?.toString(),
        phone: json['phone']?.toString(),
        identificationNumber: json['identification_number'],
        identificationType: json['identification_type']?.toString(),
        identificationImage: json['identification_image'],
        dateOfBirth: json['date_of_birth'],
        gender: json['gender']?.toString(),
        profileImage: json['profile_image']?.toString(),
        fcmToken: json['fcm_token'],
        isPhoneVerified: json['is_phone_verified'] is int
            ? json['is_phone_verified']
            : int.tryParse(json['is_phone_verified']?.toString() ?? ''),
        isEmailVerified: json['is_email_verified'] is int
            ? json['is_email_verified']
            : int.tryParse(json['is_email_verified']?.toString() ?? ''),
        phoneVerifiedAt: json['phone_verified_at'],
        emailVerifiedAt: json['email_verified_at'],
        isActive: json['is_active'] is int
            ? json['is_active']
            : int.tryParse(json['is_active']?.toString() ?? ''),
        userType: json['user_type']?.toString(),
        rememberToken: json['remember_token'],
        deletedAt: json['deleted_at'],
        createdAt: json['created_at'] != null
            ? DateTime.tryParse(json['created_at'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.tryParse(json['updated_at'])
            : null,
        walletBalance: json['wallet_balance'] is int
            ? json['wallet_balance']
            : int.tryParse(json['wallet_balance']?.toString() ?? ''),
        loyaltyPoint: json['loyalty_point'] is int
            ? json['loyalty_point']
            : int.tryParse(json['loyalty_point']?.toString() ?? ''),
        refCode: json['ref_code']?.toString(),
        referredBy: json['referred_by'],
        loginHitCount: json['login_hit_count'] is int
            ? json['login_hit_count']
            : int.tryParse(json['login_hit_count']?.toString() ?? ''),
        isTempBlocked: json['is_temp_blocked'] is int
            ? json['is_temp_blocked']
            : int.tryParse(json['is_temp_blocked']?.toString() ?? ''),
        tempBlockTime: json['temp_block_time'],
        currentLanguageKey: json['current_language_key']?.toString(),
        profileImageFullPath: json['profile_image_full_path'],
        identificationImageFullPath: json['identification_image_full_path'],
        storage: json['storage'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone': phone,
        'identification_number': identificationNumber,
        'identification_type': identificationType,
        'identification_image': identificationImage,
        'date_of_birth': dateOfBirth,
        'gender': gender,
        'profile_image': profileImage,
        'fcm_token': fcmToken,
        'is_phone_verified': isPhoneVerified,
        'is_email_verified': isEmailVerified,
        'phone_verified_at': phoneVerifiedAt,
        'email_verified_at': emailVerifiedAt,
        'is_active': isActive,
        'user_type': userType,
        'remember_token': rememberToken,
        'deleted_at': deletedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'wallet_balance': walletBalance,
        'loyalty_point': loyaltyPoint,
        'ref_code': refCode,
        'referred_by': referredBy,
        'login_hit_count': loginHitCount,
        'is_temp_blocked': isTempBlocked,
        'temp_block_time': tempBlockTime,
        'current_language_key': currentLanguageKey,
        'profile_image_full_path': profileImageFullPath,
        'identification_image_full_path': identificationImageFullPath,
        'storage': storage,
      };
}

class Detail {
  final int? id;
  final String? bookingId;
  final String? serviceId;
  final String? serviceName;
  final String? variantKey;
  final double? serviceCost;
  final int? quantity;
  final int? discountAmount;
  final double? taxAmount;
  final double? totalCost;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? campaignDiscountAmount;
  final int? overallCouponDiscountAmount;
  final Service? service;
  final int? isAddOn;

  Detail({
    this.id,
    this.bookingId,
    this.serviceId,
    this.serviceName,
    this.variantKey,
    this.serviceCost,
    this.quantity,
    this.discountAmount,
    this.taxAmount,
    this.totalCost,
    this.createdAt,
    this.updatedAt,
    this.campaignDiscountAmount,
    this.overallCouponDiscountAmount,
    this.service,
    this.isAddOn,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
        id: json['id'] is int
            ? json['id']
            : int.tryParse(json['id']?.toString() ?? ''),
        bookingId: json['booking_id']?.toString(),
        serviceId: json['service_id']?.toString(),
        serviceName: json['service_name']?.toString(),
        variantKey: json['variant_key']?.toString(),
        serviceCost: json['service_cost'] is double
            ? json['service_cost']
            : double.tryParse(json['service_cost']?.toString() ?? ''),
        quantity: json['quantity'] is int
            ? json['quantity']
            : int.tryParse(json['quantity']?.toString() ?? ''),
        discountAmount: json['discount_amount'] is int
            ? json['discount_amount']
            : int.tryParse(json['discount_amount']?.toString() ?? ''),
        taxAmount: json['tax_amount'] is double
            ? json['tax_amount']
            : double.tryParse(json['tax_amount']?.toString() ?? ''),
        totalCost: json['total_cost'] is double
            ? json['total_cost']
            : double.tryParse(json['total_cost']?.toString() ?? ''),
        createdAt: json['created_at'] != null
            ? DateTime.tryParse(json['created_at'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.tryParse(json['updated_at'])
            : null,
        campaignDiscountAmount: json['campaign_discount_amount'] is int
            ? json['campaign_discount_amount']
            : int.tryParse(json['campaign_discount_amount']?.toString() ?? ''),
        overallCouponDiscountAmount:
            json['overall_coupon_discount_amount'] is int
                ? json['overall_coupon_discount_amount']
                : int.tryParse(
                    json['overall_coupon_discount_amount']?.toString() ?? ''),
        service:
            json['service'] != null ? Service.fromJson(json['service']) : null,
        isAddOn: json['is_addon'] is int
            ? json['is_addon']
            : int.tryParse(json['is_addon']?.toString() ?? ''),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'booking_id': bookingId,
        'service_id': serviceId,
        'service_name': serviceName,
        'variant_key': variantKey,
        'service_cost': serviceCost,
        'quantity': quantity,
        'discount_amount': discountAmount,
        'tax_amount': taxAmount,
        'total_cost': totalCost,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'campaign_discount_amount': campaignDiscountAmount,
        'overall_coupon_discount_amount': overallCouponDiscountAmount,
        'service': service?.toJson(),
        'is_addon': isAddOn,
      };
}

class Service {
  final String? id;
  final String? name;
  final String? shortDescription;
  final String? description;
  final String? coverImage;
  final String? thumbnail;
  final String? categoryId;
  final String? subCategoryId;
  final int? tax;
  final int? orderCount;
  final int? isActive;
  final int? ratingCount;
  final int? avgRating;
  final String? minBiddingPrice;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? thumbnailFullPath;
  final String? coverImageFullPath;
  final List<dynamic>? serviceDiscount;
  final List<dynamic>? campaignDiscount;
  final List<dynamic>? translations;
  final dynamic storageThumbnail;
  final dynamic storageCoverImage;

  Service({
    this.id,
    this.name,
    this.shortDescription,
    this.description,
    this.coverImage,
    this.thumbnail,
    this.categoryId,
    this.subCategoryId,
    this.tax,
    this.orderCount,
    this.isActive,
    this.ratingCount,
    this.avgRating,
    this.minBiddingPrice,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.thumbnailFullPath,
    this.coverImageFullPath,
    this.serviceDiscount,
    this.campaignDiscount,
    this.translations,
    this.storageThumbnail,
    this.storageCoverImage,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json['id']?.toString(),
        name: json['name']?.toString(),
        shortDescription: json['short_description']?.toString(),
        description: json['description']?.toString(),
        coverImage: json['cover_image']?.toString(),
        thumbnail: json['thumbnail']?.toString(),
        categoryId: json['category_id']?.toString(),
        subCategoryId: json['sub_category_id']?.toString(),
        tax: json['tax'] is int
            ? json['tax']
            : int.tryParse(json['tax']?.toString() ?? ''),
        orderCount: json['order_count'] is int
            ? json['order_count']
            : int.tryParse(json['order_count']?.toString() ?? ''),
        isActive: json['is_active'] is int
            ? json['is_active']
            : int.tryParse(json['is_active']?.toString() ?? ''),
        ratingCount: json['rating_count'] is int
            ? json['rating_count']
            : int.tryParse(json['rating_count']?.toString() ?? ''),
        avgRating: json['avg_rating'] is int
            ? json['avg_rating']
            : int.tryParse(json['avg_rating']?.toString() ?? ''),
        minBiddingPrice: json['min_bidding_price']?.toString(),
        deletedAt: json['deleted_at'],
        createdAt: json['created_at'] != null
            ? DateTime.tryParse(json['created_at'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.tryParse(json['updated_at'])
            : null,
        thumbnailFullPath: json['thumbnail_full_path']?.toString(),
        coverImageFullPath: json['cover_image_full_path']?.toString(),
        serviceDiscount: json['service_discount'],
        campaignDiscount: json['campaign_discount'],
        translations: json['translations'],
        storageThumbnail: json['storage_thumbnail'],
        storageCoverImage: json['storage_cover_image'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'short_description': shortDescription,
        'description': description,
        'cover_image': coverImage,
        'thumbnail': thumbnail,
        'category_id': categoryId,
        'sub_category_id': subCategoryId,
        'tax': tax,
        'order_count': orderCount,
        'is_active': isActive,
        'rating_count': ratingCount,
        'avg_rating': avgRating,
        'min_bidding_price': minBiddingPrice,
        'deleted_at': deletedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'thumbnail_full_path': thumbnailFullPath,
        'cover_image_full_path': coverImageFullPath,
        'service_discount': serviceDiscount,
        'campaign_discount': campaignDiscount,
        'translations': translations,
        'storage_thumbnail': storageThumbnail,
        'storage_cover_image': storageCoverImage,
      };
}

class Provider {
  final String? id;
  final String? userId;
  final String? companyName;
  final String? fullName;
  final String? companyAddress;
  final String? contactNumber;
  final String? altContactNumber;
  final String? email;
  final String? zoneId;
  final ProviderCoordinates? coordinates;
  final String? adharNumber;
  final String? adharImg;
  final String? panNumber;
  final String? panImg;
  final String? dlNumber;
  final String? dlImg;
  final String? profileImg;
  final int? serviceAvailability;
  final int? isApproved;
  final int? isActive;
  final int? isSuspended;
  final dynamic ratingCount;
  final int? avgRating;
  final String? bankDocs;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic logoFullPath;

  Provider({
    this.id,
    this.userId,
    this.companyName,
    this.fullName,
    this.companyAddress,
    this.contactNumber,
    this.altContactNumber,
    this.email,
    this.zoneId,
    this.coordinates,
    this.adharNumber,
    this.adharImg,
    this.panNumber,
    this.panImg,
    this.dlNumber,
    this.dlImg,
    this.profileImg,
    this.serviceAvailability,
    this.isApproved,
    this.isActive,
    this.isSuspended,
    this.ratingCount,
    this.avgRating,
    this.bankDocs,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.logoFullPath,
  });

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json['id']?.toString(),
        userId: json['user_id']?.toString(),
        companyName: json['company_name']?.toString(),
        fullName: json['full_name']?.toString(),
        companyAddress: json['company_address']?.toString(),
        contactNumber: json['contact_number']?.toString(),
        altContactNumber: json['alt_contact_number']?.toString(),
        email: json['email']?.toString(),
        zoneId: json['zone_id']?.toString(),
        coordinates: json['coordinates'] != null
            ? ProviderCoordinates.fromJson(json['coordinates'])
            : null,
        adharNumber: json['adhar_number']?.toString(),
        adharImg: json['adhar_img']?.toString(),
        panNumber: json['pan_number']?.toString(),
        panImg: json['pan_img']?.toString(),
        dlNumber: json['dl_number']?.toString(),
        dlImg: json['dl_img']?.toString(),
        profileImg: json['profile_img']?.toString(),
        serviceAvailability: json['service_availability'] is int
            ? json['service_availability']
            : int.tryParse(json['service_availability']?.toString() ?? ''),
        isApproved: json['is_approved'] is int
            ? json['is_approved']
            : int.tryParse(json['is_approved']?.toString() ?? ''),
        isActive: json['is_active'] is int
            ? json['is_active']
            : int.tryParse(json['is_active']?.toString() ?? ''),
        isSuspended: json['is_suspended'] is int
            ? json['is_suspended']
            : int.tryParse(json['is_suspended']?.toString() ?? ''),
        ratingCount: json['rating_count'],
        avgRating: json['avg_rating'] is int
            ? json['avg_rating']
            : int.tryParse(json['avg_rating']?.toString() ?? ''),
        bankDocs: json['bank_docs']?.toString(),
        deletedAt: json['deleted_at'],
        createdAt: json['created_at'] != null
            ? DateTime.tryParse(json['created_at'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.tryParse(json['updated_at'])
            : null,
        logoFullPath: json['logo_full_path'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'company_name': companyName,
        'full_name': fullName,
        'company_address': companyAddress,
        'contact_number': contactNumber,
        'alt_contact_number': altContactNumber,
        'email': email,
        'zone_id': zoneId,
        'coordinates': coordinates?.toJson(),
        'adhar_number': adharNumber,
        'adhar_img': adharImg,
        'pan_number': panNumber,
        'pan_img': panImg,
        'dl_number': dlNumber,
        'dl_img': dlImg,
        'profile_img': profileImg,
        'service_availability': serviceAvailability,
        'is_approved': isApproved,
        'is_active': isActive,
        'is_suspended': isSuspended,
        'rating_count': ratingCount,
        'avg_rating': avgRating,
        'bank_docs': bankDocs,
        'deleted_at': deletedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'logo_full_path': logoFullPath,
      };
}

class ProviderCoordinates {
  final String? latitude;
  final String? longitude;

  ProviderCoordinates({
    this.latitude,
    this.longitude,
  });

  factory ProviderCoordinates.fromJson(Map<String, dynamic> json) =>
      ProviderCoordinates(
        latitude: json['latitude']?.toString(),
        longitude: json['longitude']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        'latitude': latitude,
        'longitude': longitude,
      };
}

class History {
  final int? id;
  final String? bookingId;
  final String? changedBy;
  final DateTime? schedule;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? isGuest;
  final dynamic bookingRepeatId;
  final Customer? user;
  final String? bookingStatus;

  History({
    this.id,
    this.bookingId,
    this.changedBy,
    this.schedule,
    this.createdAt,
    this.updatedAt,
    this.isGuest,
    this.bookingRepeatId,
    this.user,
    this.bookingStatus,
  });

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json['id'] is int
            ? json['id']
            : int.tryParse(json['id']?.toString() ?? ''),
        bookingId: json['booking_id']?.toString(),
        changedBy: json['changed_by']?.toString(),
        schedule: json['schedule'] != null
            ? DateTime.tryParse(json['schedule'])
            : null,
        createdAt: json['created_at'] != null
            ? DateTime.tryParse(json['created_at'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.tryParse(json['updated_at'])
            : null,
        isGuest: json['is_guest'] is int
            ? json['is_guest']
            : int.tryParse(json['is_guest']?.toString() ?? ''),
        bookingRepeatId: json['booking_repeat_id'],
        user: json['user'] != null ? Customer.fromJson(json['user']) : null,
        bookingStatus: json['booking_status']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'booking_id': bookingId,
        'changed_by': changedBy,
        'schedule': schedule?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'is_guest': isGuest,
        'booking_repeat_id': bookingRepeatId,
        'user': user?.toJson(),
        'booking_status': bookingStatus,
      };
}

class ServiceAddress {
  final int? id;
  final dynamic userId;
  final String? lat;
  final String? lon;
  final String? city;
  final String? street;
  final String? zipCode;
  final String? country;
  final String? address;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? addressType;
  final String? contactPersonName;
  final String? contactPersonNumber;
  final String? addressLabel;
  final String? zoneId;
  final int? isGuest;
  final String? house;
  final String? floor;

  ServiceAddress({
    this.id,
    this.userId,
    this.lat,
    this.lon,
    this.city,
    this.street,
    this.zipCode,
    this.country,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.addressType,
    this.contactPersonName,
    this.contactPersonNumber,
    this.addressLabel,
    this.zoneId,
    this.isGuest,
    this.house,
    this.floor,
  });

  factory ServiceAddress.fromJson(Map<String, dynamic> json) => ServiceAddress(
        id: json['id'] is int
            ? json['id']
            : int.tryParse(json['id']?.toString() ?? ''),
        userId: json['user_id'],
        lat: json['lat']?.toString(),
        lon: json['lon']?.toString(),
        city: json['city']?.toString(),
        street: json['street']?.toString(),
        zipCode: json['zip_code']?.toString(),
        country: json['country']?.toString(),
        address: json['address']?.toString(),
        createdAt: json['created_at'] != null
            ? DateTime.tryParse(json['created_at'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.tryParse(json['updated_at'])
            : null,
        addressType: json['address_type']?.toString(),
        contactPersonName: json['contact_person_name']?.toString(),
        contactPersonNumber: json['contact_person_number']?.toString(),
        addressLabel: json['address_label']?.toString(),
        zoneId: json['zone_id']?.toString(),
        isGuest: json['is_guest'] is int
            ? json['is_guest']
            : int.tryParse(json['is_guest']?.toString() ?? ''),
        house: json['house']?.toString(),
        floor: json['floor']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_id': userId,
        'lat': lat,
        'lon': lon,
        'city': city,
        'street': street,
        'zip_code': zipCode,
        'country': country,
        'address': address,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'address_type': addressType,
        'contact_person_name': contactPersonName,
        'contact_person_number': contactPersonNumber,
        'address_label': addressLabel,
        'zone_id': zoneId,
        'is_guest': isGuest,
        'house': house,
        'floor': floor,
      };
}

class Zone {
  final String? id;
  final String? name;
  final ZoneCoordinates? coordinates;
  final int? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? translations;

  Zone({
    this.id,
    this.name,
    this.coordinates,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.translations,
  });

  factory Zone.fromJson(Map<String, dynamic> json) => Zone(
        id: json['id']?.toString(),
        name: json['name']?.toString(),
        coordinates: json['coordinates'] != null
            ? ZoneCoordinates.fromJson(json['coordinates'])
            : null,
        isActive: json['is_active'] is int
            ? json['is_active']
            : int.tryParse(json['is_active']?.toString() ?? ''),
        createdAt: json['created_at'] != null
            ? DateTime.tryParse(json['created_at'])
            : null,
        updatedAt: json['updated_at'] != null
            ? DateTime.tryParse(json['updated_at'])
            : null,
        translations: json['translations'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'coordinates': coordinates?.toJson(),
        'is_active': isActive,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'translations': translations,
      };
}

class ZoneCoordinates {
  final String? type;
  final List<List<List<double>>>? coordinates;

  ZoneCoordinates({
    this.type,
    this.coordinates,
  });

  factory ZoneCoordinates.fromJson(Map<String, dynamic> json) =>
      ZoneCoordinates(
        type: json['type']?.toString(),
        coordinates: json['coordinates'] != null
            ? (json['coordinates'] as List)
                .map((e) => (e as List)
                    .map((i) => (i as List)
                        .map((v) => v is double
                            ? v
                            : double.tryParse(v.toString()) ?? 0.0)
                        .toList())
                    .toList())
                .toList()
            : null,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'coordinates': coordinates,
      };
}
