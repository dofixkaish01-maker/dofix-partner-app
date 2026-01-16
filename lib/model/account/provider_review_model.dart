class ProviderReviewModel {
  final String? responseCode;
  final String? message;
  final Content? content;
  final List<dynamic>? errors;
  final CategoryInfo? categoryInfo;

  ProviderReviewModel({
    this.responseCode,
    this.message,
    this.content,
    this.errors,
    this.categoryInfo,
  });
}

class Content {
  final List<ProviderReview>? reviews;
  final Rating? rating;

  Content({
    this.reviews,
    this.rating,
  });
}

class CategoryInfo {
  final int minimumBalance;
  final String categoryName;

  CategoryInfo({
    required this.minimumBalance,
    required this.categoryName,
  });

  factory CategoryInfo.fromJson(Map<String, dynamic> json) {
    return CategoryInfo(
      minimumBalance: json['minimum_balance'] ?? 0,
      categoryName: json['category_name'] ?? '',
    );
  }
}


class Rating {
  final int? ratingCount;
  final double? averageRating;
  final List<RatingGroupCount>? ratingGroupCount;

  Rating({
    this.ratingCount,
    this.averageRating,
    this.ratingGroupCount,
  });
}

class RatingGroupCount {
  final int? reviewRating;
  final int? total;

  RatingGroupCount({
    this.reviewRating,
    this.total,
  });
}

class ProviderReview {
  final String? id;
  final int? readableId;
  final String? bookingId;
  final String? serviceId;
  final String? providerId;
  final int? reviewRating;
  final String? reviewComment;
  final List<dynamic>? reviewImages;
  final DateTime? bookingDate;
  final int? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? customerId;
  final Booking? booking;
  final Provider? provider;
  final Customer? customer;
  final dynamic reviewReply;
  final Service? service;

  ProviderReview({
    this.id,
    this.readableId,
    this.bookingId,
    this.serviceId,
    this.providerId,
    this.reviewRating,
    this.reviewComment,
    this.reviewImages,
    this.bookingDate,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.customerId,
    this.booking,
    this.provider,
    this.customer,
    this.reviewReply,
    this.service,
  });

  factory ProviderReview.fromJson(Map<String, dynamic> json) {
    return ProviderReview(
      id: json['id'] ?? '',
      readableId: json['readable_id'] ?? '',
      bookingId: json['booking_id'] ?? '',
      serviceId: json['service_id'] ?? '',
      providerId: json['provider_id'] ?? '',
      reviewRating: (json['review_rating'] as num?)?.toInt(),
      reviewComment: json['review_comment'] ?? '',
      reviewImages: json['review_images'] ?? [],
      bookingDate: json['booking_date'] != null
          ? DateTime.parse(json['booking_date'])
          : null,
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      customer:
          json['customer'] != null ? Customer.fromJson(json['customer']) : null,
    );
  }
}

class Booking {
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
  final String? reachImage;
  final String? preVideos;
  final String? postVideos;
  final String? preWorkImage;
  final List<EvidencePhoto>? evidencePhotos;
  final String? bookingOtp;
  final int? isGuest;
  final int? isVerified;
  final int? extraFee;
  final int? totalReferralDiscountAmount;
  final int? isRepeated;
  final dynamic assignedBy;
  final String? message;
  final List<String>? evidencePhotosFullPath;
  final List<Detail>? detail;

  Booking({
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
    this.preVideos,
    this.postVideos,
    this.preWorkImage,
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
  });
}

class Detail {
  final int? id;
  final String? bookingId;
  final String? serviceId;
  final String? serviceName;
  final String? variantKey;
  final int? serviceCost;
  final int? quantity;
  final int? discountAmount;
  final double? taxAmount;
  final double? totalCost;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? campaignDiscountAmount;
  final int? overallCouponDiscountAmount;

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
  });
}

class EvidencePhoto {
  final String? image;
  final String? storage;

  EvidencePhoto({
    this.image,
    this.storage,
  });
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

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      id: json['id'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      identificationNumber: json['identification_number'],
      identificationType: json['identification_type'] ?? '',
      identificationImage: json['identification_image'] ?? [],
      dateOfBirth: json['date_of_birth'],
      gender: json['gender'] ?? '',
      profileImage: json['profile_image'] ?? '',
      fcmToken: json['fcm_token'],
      isPhoneVerified: (json['is_phone_verified'] as num?)?.toInt(),
      isEmailVerified: (json['is_email_verified'] as num?)?.toInt(),
      phoneVerifiedAt: json['phone_verified_at'],
      emailVerifiedAt: json['email_verified_at'],
      isActive: (json['is_active'] as num?)?.toInt(),
      userType: json['user_type'] ?? '',
      rememberToken: json['remember_token'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
      walletBalance: json['wallet_balance'] ?? 0,
      loyaltyPoint: json['loyalty_point'] ?? 0,
      refCode: json['ref_code'] ?? '',
      referredBy: json['referred_by'],
      loginHitCount: (json['login_hit_count'] as num?)?.toInt() ?? 0,
      isTempBlocked: (json['is_temp_blocked'] as num?)?.toInt(),
      tempBlockTime: json['temp_block_time'],
      currentLanguageKey: json['current_language_key'] ?? '',
      profileImageFullPath: json['profile_image_full_path'],
      identificationImageFullPath: json['identification_image_full_path'] ?? [],
      storage: json['storage'],
    );
  }
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
  final Coordinates? coordinates;
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
  final int? ratingCount;
  final double? avgRating;
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
}

class Coordinates {
  final String? latitude;
  final String? longitude;

  Coordinates({
    this.latitude,
    this.longitude,
  });
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
  final double? avgRating;
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
}
