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

  factory ProviderReviewModel.fromJson(Map<String, dynamic> json) {
    return ProviderReviewModel(
      responseCode: json['response_code']?.toString(),
      message: json['message']?.toString(),
      content:
      json['content'] != null ? Content.fromJson(json['content']) : null,
      errors: json['errors'] is List ? json['errors'] as List<dynamic> : [],
      categoryInfo: json['category_info'] != null
          ? CategoryInfo.fromJson(json['category_info'])
          : null,
    );
  }
}

class Content {
  final Reviews? reviews;
  final Rating? rating;

  Content({
    this.reviews,
    this.rating,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      reviews: json['reviews'] != null ? Reviews.fromJson(json['reviews']) : null,
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
    );
  }
}

class Reviews {
  final int? currentPage;
  final List<ProviderReview>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<PaginationLink>? links;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final String? prevPageUrl;
  final int? to;
  final int? total;

  Reviews({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Reviews.fromJson(dynamic json) {
    /// Case 1: reviews direct List hai
    if (json is List) {
      return Reviews(
        currentPage: 1,
        data: json.map((e) => ProviderReview.fromJson(e)).toList(),
        firstPageUrl: null,
        from: json.isNotEmpty ? 1 : 0,
        lastPage: 1,
        lastPageUrl: null,
        links: [],
        nextPageUrl: null,
        path: null,
        perPage: json.length,
        prevPageUrl: null,
        to: json.length,
        total: json.length,
      );
    }

    /// Case 2: reviews object hai with data
    if (json is Map<String, dynamic>) {
      return Reviews(
        currentPage: (json['current_page'] as num?)?.toInt(),
        data: json['data'] != null
            ? List<ProviderReview>.from(
            (json['data'] as List).map((e) => ProviderReview.fromJson(e)))
            : [],
        firstPageUrl: json['first_page_url']?.toString(),
        from: (json['from'] as num?)?.toInt(),
        lastPage: (json['last_page'] as num?)?.toInt(),
        lastPageUrl: json['last_page_url']?.toString(),
        links: json['links'] != null
            ? List<PaginationLink>.from(
            (json['links'] as List).map((e) => PaginationLink.fromJson(e)))
            : [],
        nextPageUrl: json['next_page_url']?.toString(),
        path: json['path']?.toString(),
        perPage: (json['per_page'] as num?)?.toInt(),
        prevPageUrl: json['prev_page_url']?.toString(),
        to: (json['to'] as num?)?.toInt(),
        total: (json['total'] as num?)?.toInt(),
      );
    }

    return Reviews(data: []);
  }
}

class PaginationLink {
  final String? url;
  final String? label;
  final bool? active;

  PaginationLink({
    this.url,
    this.label,
    this.active,
  });

  factory PaginationLink.fromJson(Map<String, dynamic> json) {
    return PaginationLink(
      url: json['url']?.toString(),
      label: json['label']?.toString(),
      active: json['active'] as bool?,
    );
  }
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
      minimumBalance: (json['minimum_balance'] as num?)?.toInt() ?? 0,
      categoryName: json['category_name']?.toString() ?? '',
    );
  }
}

class Rating {
  final int? ratingCount;
  final int? reviewCount;
  final double? averageRating;
  final List<RatingGroupCount>? ratingGroupCount;

  Rating({
    this.ratingCount,
    this.reviewCount,
    this.averageRating,
    this.ratingGroupCount,
  });

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      ratingCount: (json['rating_count'] as num?)?.toInt(),
      reviewCount: (json['review_count'] as num?)?.toInt(),
      averageRating: (json['average_rating'] as num?)?.toDouble(),
      ratingGroupCount: json['rating_group_count'] != null
          ? List<RatingGroupCount>.from((json['rating_group_count'] as List)
          .map((e) => RatingGroupCount.fromJson(e)))
          : [],
    );
  }
}

class RatingGroupCount {
  final int? reviewRating;
  final int? totalComment;
  final int? total;

  RatingGroupCount({
    this.reviewRating,
    this.totalComment,
    this.total,
  });

  factory RatingGroupCount.fromJson(Map<String, dynamic> json) {
    return RatingGroupCount(
      reviewRating: (json['review_rating'] as num?)?.toInt(),
      totalComment: (json['total_comment'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );
  }
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
      id: json['id']?.toString(),
      readableId: (json['readable_id'] as num?)?.toInt(),
      bookingId: json['booking_id']?.toString(),
      serviceId: json['service_id']?.toString(),
      providerId: json['provider_id']?.toString(),
      reviewRating: (json['review_rating'] as num?)?.toInt(),
      reviewComment: json['review_comment']?.toString() ?? '',
      reviewImages: json['review_images'] is List
          ? json['review_images'] as List<dynamic>
          : [],
      bookingDate: json['booking_date'] != null
          ? DateTime.tryParse(json['booking_date'].toString())
          : null,
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'].toString())
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'].toString())
          : null,
      customerId: json['customer_id']?.toString(),
      booking: json['booking'] != null ? Booking.fromJson(json['booking']) : null,
      provider:
      json['provider'] != null ? Provider.fromJson(json['provider']) : null,
      customer:
      json['customer'] != null ? Customer.fromJson(json['customer']) : null,
      reviewReply: json['review_reply'],
      service: json['service'] != null ? Service.fromJson(json['service']) : null,
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
  final double? totalDiscountAmount;
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
  final dynamic preWorkImage;
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

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id']?.toString(),
      readableId: (json['readable_id'] as num?)?.toInt(),
      customerId: json['customer_id']?.toString(),
      providerId: json['provider_id']?.toString(),
      zoneId: json['zone_id']?.toString(),
      bookingStatus: json['booking_status']?.toString(),
      isPaid: (json['is_paid'] as num?)?.toInt(),
      paymentMethod: json['payment_method']?.toString(),
      transactionId: json['transaction_id']?.toString(),
      totalBookingAmount: (json['total_booking_amount'] as num?)?.toDouble(),
      totalTaxAmount: (json['total_tax_amount'] as num?)?.toDouble(),
      totalDiscountAmount: (json['total_discount_amount'] as num?)?.toDouble(),
      serviceSchedule: json['service_schedule'] != null
          ? DateTime.tryParse(json['service_schedule'].toString())
          : null,
      serviceAddressId: json['service_address_id']?.toString(),
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'].toString())
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'].toString())
          : null,
      categoryId: json['category_id']?.toString(),
      subCategoryId: json['sub_category_id']?.toString(),
      servicemanId: json['serviceman_id'],
      totalCampaignDiscountAmount:
      (json['total_campaign_discount_amount'] as num?)?.toInt(),
      totalCouponDiscountAmount:
      (json['total_coupon_discount_amount'] as num?)?.toInt(),
      couponCode: json['coupon_code'],
      isChecked: (json['is_checked'] as num?)?.toInt(),
      servicePreference: (json['service_preference'] as num?)?.toInt(),
      additionalCharge: (json['additional_charge'] as num?)?.toInt(),
      additionalTaxAmount: (json['additional_tax_amount'] as num?)?.toInt(),
      additionalDiscountAmount:
      (json['additional_discount_amount'] as num?)?.toInt(),
      additionalCampaignDiscountAmount:
      (json['additional_campaign_discount_amount'] as num?)?.toInt(),
      removedCouponAmount: json['removed_coupon_amount']?.toString(),
      reachImage: json['reach_image']?.toString(),
      preVideos: json['pre_videos']?.toString(),
      postVideos: json['post_videos']?.toString(),
      preWorkImage: json['pre_work_image'],
      evidencePhotos: json['evidence_photos'] != null
          ? List<EvidencePhoto>.from(
        (json['evidence_photos'] as List).map(
              (e) => EvidencePhoto.fromJson(e),
        ),
      )
          : [],
      bookingOtp: json['booking_otp']?.toString(),
      isGuest: (json['is_guest'] as num?)?.toInt(),
      isVerified: (json['is_verified'] as num?)?.toInt(),
      extraFee: (json['extra_fee'] as num?)?.toInt(),
      totalReferralDiscountAmount:
      (json['total_referral_discount_amount'] as num?)?.toInt(),
      isRepeated: (json['is_repeated'] as num?)?.toInt(),
      assignedBy: json['assigned_by'],
      message: json['message']?.toString(),
      evidencePhotosFullPath: json['evidence_photos_full_path'] != null
          ? List<String>.from(json['evidence_photos_full_path'])
          : [],
      detail: json['detail'] != null
          ? List<Detail>.from(
        (json['detail'] as List).map((e) => Detail.fromJson(e)),
      )
          : [],
    );
  }
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

  factory Detail.fromJson(Map<String, dynamic> json) {
    return Detail(
      id: (json['id'] as num?)?.toInt(),
      bookingId: json['booking_id']?.toString(),
      serviceId: json['service_id']?.toString(),
      serviceName: json['service_name']?.toString(),
      variantKey: json['variant_key']?.toString(),
      serviceCost: (json['service_cost'] as num?)?.toInt(),
      quantity: (json['quantity'] as num?)?.toInt(),
      discountAmount: (json['discount_amount'] as num?)?.toInt(),
      taxAmount: (json['tax_amount'] as num?)?.toDouble(),
      totalCost: (json['total_cost'] as num?)?.toDouble(),
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'].toString())
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'].toString())
          : null,
      campaignDiscountAmount:
      (json['campaign_discount_amount'] as num?)?.toInt(),
      overallCouponDiscountAmount:
      (json['overall_coupon_discount_amount'] as num?)?.toInt(),
    );
  }
}

class EvidencePhoto {
  final String? image;
  final String? storage;

  EvidencePhoto({
    this.image,
    this.storage,
  });

  factory EvidencePhoto.fromJson(Map<String, dynamic> json) {
    return EvidencePhoto(
      image: json['image']?.toString(),
      storage: json['storage']?.toString(),
    );
  }
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
      id: json['id']?.toString(),
      firstName: json['first_name']?.toString(),
      lastName: json['last_name']?.toString(),
      email: json['email']?.toString(),
      phone: json['phone']?.toString(),
      identificationNumber: json['identification_number'],
      identificationType: json['identification_type']?.toString(),
      identificationImage: json['identification_image'] is List
          ? json['identification_image'] as List<dynamic>
          : [],
      dateOfBirth: json['date_of_birth'],
      gender: json['gender']?.toString(),
      profileImage: json['profile_image']?.toString(),
      fcmToken: json['fcm_token'],
      isPhoneVerified: (json['is_phone_verified'] as num?)?.toInt(),
      isEmailVerified: (json['is_email_verified'] as num?)?.toInt(),
      phoneVerifiedAt: json['phone_verified_at'],
      emailVerifiedAt: json['email_verified_at'],
      isActive: (json['is_active'] as num?)?.toInt(),
      userType: json['user_type']?.toString(),
      rememberToken: json['remember_token'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'].toString())
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'].toString())
          : null,
      walletBalance: (json['wallet_balance'] as num?)?.toInt(),
      loyaltyPoint: (json['loyalty_point'] as num?)?.toInt(),
      refCode: json['ref_code']?.toString(),
      referredBy: json['referred_by'],
      loginHitCount: (json['login_hit_count'] as num?)?.toInt(),
      isTempBlocked: (json['is_temp_blocked'] as num?)?.toInt(),
      tempBlockTime: json['temp_block_time'],
      currentLanguageKey: json['current_language_key']?.toString(),
      profileImageFullPath: json['profile_image_full_path'],
      identificationImageFullPath: json['identification_image_full_path'] is List
          ? json['identification_image_full_path'] as List<dynamic>
          : [],
      storage: json['storage'],
    );
  }
}

class Provider {
  final String? id;
  final String? dofixPartnerId;
  final String? userId;
  final String? companyName;
  final String? fullName;
  final String? companyAddress;
  final String? contactNumber;
  final String? altContactNumber;
  final String? email;
  final int? registrationFeeStatus;
  final String? zoneId;
  final Coordinates? coordinates;
  final String? adharNumber;
  final String? adharImg;
  final String? panNumber;
  final String? panImg;
  final String? dlNumber;
  final String? dlImg;
  final String? passbookImg;
  final String? profileImg;
  final int? serviceAvailability;
  final int? isApproved;
  final int? isActive;
  final int? isSuspended;
  final int? ratingCount;
  final double? avgRating;
  final String? bankDocs;
  final String? serviceId;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic logoFullPath;

  Provider({
    this.id,
    this.dofixPartnerId,
    this.userId,
    this.companyName,
    this.fullName,
    this.companyAddress,
    this.contactNumber,
    this.altContactNumber,
    this.email,
    this.registrationFeeStatus,
    this.zoneId,
    this.coordinates,
    this.adharNumber,
    this.adharImg,
    this.panNumber,
    this.panImg,
    this.dlNumber,
    this.dlImg,
    this.passbookImg,
    this.profileImg,
    this.serviceAvailability,
    this.isApproved,
    this.isActive,
    this.isSuspended,
    this.ratingCount,
    this.avgRating,
    this.bankDocs,
    this.serviceId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.logoFullPath,
  });

  factory Provider.fromJson(Map<String, dynamic> json) {
    return Provider(
      id: json['id']?.toString(),
      dofixPartnerId: json['dofix_partner_id']?.toString(),
      userId: json['user_id']?.toString(),
      companyName: json['company_name']?.toString(),
      fullName: json['full_name']?.toString(),
      companyAddress: json['company_address']?.toString(),
      contactNumber: json['contact_number']?.toString(),
      altContactNumber: json['alt_contact_number']?.toString(),
      email: json['email']?.toString(),
      registrationFeeStatus: (json['registration_fee_status'] as num?)?.toInt(),
      zoneId: json['zone_id']?.toString(),
      coordinates: json['coordinates'] != null
          ? Coordinates.fromJson(json['coordinates'])
          : null,
      adharNumber: json['adhar_number']?.toString(),
      adharImg: json['adhar_img']?.toString(),
      panNumber: json['pan_number']?.toString(),
      panImg: json['pan_img']?.toString(),
      dlNumber: json['dl_number']?.toString(),
      dlImg: json['dl_img']?.toString(),
      passbookImg: json['passbook_img']?.toString(),
      profileImg: json['profile_img']?.toString(),
      serviceAvailability: (json['service_availability'] as num?)?.toInt(),
      isApproved: (json['is_approved'] as num?)?.toInt(),
      isActive: (json['is_active'] as num?)?.toInt(),
      isSuspended: (json['is_suspended'] as num?)?.toInt(),
      ratingCount: (json['rating_count'] as num?)?.toInt(),
      avgRating: (json['avg_rating'] as num?)?.toDouble(),
      bankDocs: json['bank_docs']?.toString(),
      serviceId: json['service_id']?.toString(),
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'].toString())
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'].toString())
          : null,
      logoFullPath: json['logo_full_path'],
    );
  }
}

class Coordinates {
  final String? latitude;
  final String? longitude;

  Coordinates({
    this.latitude,
    this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      latitude: json['latitude']?.toString(),
      longitude: json['longitude']?.toString(),
    );
  }
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
  final String? serviceCharges;
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
    this.serviceCharges,
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

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id']?.toString(),
      name: json['name']?.toString(),
      shortDescription: json['short_description']?.toString(),
      description: json['description']?.toString(),
      coverImage: json['cover_image']?.toString(),
      thumbnail: json['thumbnail']?.toString(),
      categoryId: json['category_id']?.toString(),
      subCategoryId: json['sub_category_id']?.toString(),
      tax: (json['tax'] as num?)?.toInt(),
      orderCount: (json['order_count'] as num?)?.toInt(),
      isActive: (json['is_active'] as num?)?.toInt(),
      ratingCount: (json['rating_count'] as num?)?.toInt(),
      avgRating: (json['avg_rating'] as num?)?.toDouble(),
      minBiddingPrice: json['min_bidding_price']?.toString(),
      serviceCharges: json['service_charges']?.toString(),
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'].toString())
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'].toString())
          : null,
      thumbnailFullPath: json['thumbnail_full_path']?.toString(),
      coverImageFullPath: json['cover_image_full_path']?.toString(),
      serviceDiscount: json['service_discount'] is List
          ? json['service_discount'] as List<dynamic>
          : [],
      campaignDiscount: json['campaign_discount'] is List
          ? json['campaign_discount'] as List<dynamic>
          : [],
      translations: json['translations'] is List
          ? json['translations'] as List<dynamic>
          : [],
      storageThumbnail: json['storage_thumbnail'],
      storageCoverImage: json['storage_cover_image'],
    );
  }
}



// class ProviderReviewModel {
//   final String? responseCode;
//   final String? message;
//   final Content? content;
//   final List<dynamic>? errors;
//   final CategoryInfo? categoryInfo;
//
//   ProviderReviewModel({
//     this.responseCode,
//     this.message,
//     this.content,
//     this.errors,
//     this.categoryInfo,
//   });
// }
//
// class Content {
//   final List<ProviderReview>? reviews;
//   final Rating? rating;
//
//   Content({
//     this.reviews,
//     this.rating,
//   });
// }
//
// class CategoryInfo {
//   final int minimumBalance;
//   final String categoryName;
//
//   CategoryInfo({
//     required this.minimumBalance,
//     required this.categoryName,
//   });
//
//   factory CategoryInfo.fromJson(Map<String, dynamic> json) {
//     return CategoryInfo(
//       minimumBalance: json['minimum_balance'] ?? 0,
//       categoryName: json['category_name'] ?? '',
//     );
//   }
// }
//
//
// class Rating {
//   final int? ratingCount;
//   final double? averageRating;
//   final List<RatingGroupCount>? ratingGroupCount;
//
//   Rating({
//     this.ratingCount,
//     this.averageRating,
//     this.ratingGroupCount,
//   });
// }
//
// class RatingGroupCount {
//   final int? reviewRating;
//   final int? total;
//
//   RatingGroupCount({
//     this.reviewRating,
//     this.total,
//   });
// }
//
// class ProviderReview {
//   final String? id;
//   final int? readableId;
//   final String? bookingId;
//   final String? serviceId;
//   final String? providerId;
//   final int? reviewRating;
//   final String? reviewComment;
//   final List<dynamic>? reviewImages;
//   final DateTime? bookingDate;
//   final int? isActive;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final String? customerId;
//   final Booking? booking;
//   final Provider? provider;
//   final Customer? customer;
//   final dynamic reviewReply;
//   final Service? service;
//
//   ProviderReview({
//     this.id,
//     this.readableId,
//     this.bookingId,
//     this.serviceId,
//     this.providerId,
//     this.reviewRating,
//     this.reviewComment,
//     this.reviewImages,
//     this.bookingDate,
//     this.isActive,
//     this.createdAt,
//     this.updatedAt,
//     this.customerId,
//     this.booking,
//     this.provider,
//     this.customer,
//     this.reviewReply,
//     this.service,
//   });
//
//   factory ProviderReview.fromJson(Map<String, dynamic> json) {
//     return ProviderReview(
//       id: json['id'] ?? '',
//       readableId: json['readable_id'] ?? '',
//       bookingId: json['booking_id'] ?? '',
//       serviceId: json['service_id'] ?? '',
//       providerId: json['provider_id'] ?? '',
//       reviewRating: (json['review_rating'] as num?)?.toInt(),
//       reviewComment: json['review_comment'] ?? '',
//       reviewImages: json['review_images'] ?? [],
//       bookingDate: json['booking_date'] != null
//           ? DateTime.parse(json['booking_date'])
//           : null,
//       isActive: (json['is_active'] as num?)?.toInt(),
//       createdAt: json['created_at'] != null
//           ? DateTime.parse(json['created_at'])
//           : null,
//       updatedAt: json['updated_at'] != null
//           ? DateTime.parse(json['updated_at'])
//           : null,
//       customer:
//           json['customer'] != null ? Customer.fromJson(json['customer']) : null,
//     );
//   }
// }
//
// class Booking {
//   final String? id;
//   final int? readableId;
//   final String? customerId;
//   final String? providerId;
//   final String? zoneId;
//   final String? bookingStatus;
//   final int? isPaid;
//   final String? paymentMethod;
//   final String? transactionId;
//   final double? totalBookingAmount;
//   final double? totalTaxAmount;
//   final int? totalDiscountAmount;
//   final DateTime? serviceSchedule;
//   final String? serviceAddressId;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final String? categoryId;
//   final String? subCategoryId;
//   final dynamic servicemanId;
//   final int? totalCampaignDiscountAmount;
//   final int? totalCouponDiscountAmount;
//   final dynamic couponCode;
//   final int? isChecked;
//   final int? servicePreference;
//   final int? additionalCharge;
//   final int? additionalTaxAmount;
//   final int? additionalDiscountAmount;
//   final int? additionalCampaignDiscountAmount;
//   final String? removedCouponAmount;
//   final String? reachImage;
//   final String? preVideos;
//   final String? postVideos;
//   final String? preWorkImage;
//   final List<EvidencePhoto>? evidencePhotos;
//   final String? bookingOtp;
//   final int? isGuest;
//   final int? isVerified;
//   final int? extraFee;
//   final int? totalReferralDiscountAmount;
//   final int? isRepeated;
//   final dynamic assignedBy;
//   final String? message;
//   final List<String>? evidencePhotosFullPath;
//   final List<Detail>? detail;
//
//   Booking({
//     this.id,
//     this.readableId,
//     this.customerId,
//     this.providerId,
//     this.zoneId,
//     this.bookingStatus,
//     this.isPaid,
//     this.paymentMethod,
//     this.transactionId,
//     this.totalBookingAmount,
//     this.totalTaxAmount,
//     this.totalDiscountAmount,
//     this.serviceSchedule,
//     this.serviceAddressId,
//     this.createdAt,
//     this.updatedAt,
//     this.categoryId,
//     this.subCategoryId,
//     this.servicemanId,
//     this.totalCampaignDiscountAmount,
//     this.totalCouponDiscountAmount,
//     this.couponCode,
//     this.isChecked,
//     this.servicePreference,
//     this.additionalCharge,
//     this.additionalTaxAmount,
//     this.additionalDiscountAmount,
//     this.additionalCampaignDiscountAmount,
//     this.removedCouponAmount,
//     this.reachImage,
//     this.preVideos,
//     this.postVideos,
//     this.preWorkImage,
//     this.evidencePhotos,
//     this.bookingOtp,
//     this.isGuest,
//     this.isVerified,
//     this.extraFee,
//     this.totalReferralDiscountAmount,
//     this.isRepeated,
//     this.assignedBy,
//     this.message,
//     this.evidencePhotosFullPath,
//     this.detail,
//   });
// }
//
// class Detail {
//   final int? id;
//   final String? bookingId;
//   final String? serviceId;
//   final String? serviceName;
//   final String? variantKey;
//   final int? serviceCost;
//   final int? quantity;
//   final int? discountAmount;
//   final double? taxAmount;
//   final double? totalCost;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final int? campaignDiscountAmount;
//   final int? overallCouponDiscountAmount;
//
//   Detail({
//     this.id,
//     this.bookingId,
//     this.serviceId,
//     this.serviceName,
//     this.variantKey,
//     this.serviceCost,
//     this.quantity,
//     this.discountAmount,
//     this.taxAmount,
//     this.totalCost,
//     this.createdAt,
//     this.updatedAt,
//     this.campaignDiscountAmount,
//     this.overallCouponDiscountAmount,
//   });
// }
//
// class EvidencePhoto {
//   final String? image;
//   final String? storage;
//
//   EvidencePhoto({
//     this.image,
//     this.storage,
//   });
// }
//
// class Customer {
//   final String? id;
//   final String? firstName;
//   final String? lastName;
//   final String? email;
//   final String? phone;
//   final dynamic identificationNumber;
//   final String? identificationType;
//   final List<dynamic>? identificationImage;
//   final dynamic dateOfBirth;
//   final String? gender;
//   final String? profileImage;
//   final dynamic fcmToken;
//   final int? isPhoneVerified;
//   final int? isEmailVerified;
//   final dynamic phoneVerifiedAt;
//   final dynamic emailVerifiedAt;
//   final int? isActive;
//   final String? userType;
//   final dynamic rememberToken;
//   final dynamic deletedAt;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final int? walletBalance;
//   final int? loyaltyPoint;
//   final String? refCode;
//   final dynamic referredBy;
//   final int? loginHitCount;
//   final int? isTempBlocked;
//   final dynamic tempBlockTime;
//   final String? currentLanguageKey;
//   final dynamic profileImageFullPath;
//   final List<dynamic>? identificationImageFullPath;
//   final dynamic storage;
//
//   Customer({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.email,
//     this.phone,
//     this.identificationNumber,
//     this.identificationType,
//     this.identificationImage,
//     this.dateOfBirth,
//     this.gender,
//     this.profileImage,
//     this.fcmToken,
//     this.isPhoneVerified,
//     this.isEmailVerified,
//     this.phoneVerifiedAt,
//     this.emailVerifiedAt,
//     this.isActive,
//     this.userType,
//     this.rememberToken,
//     this.deletedAt,
//     this.createdAt,
//     this.updatedAt,
//     this.walletBalance,
//     this.loyaltyPoint,
//     this.refCode,
//     this.referredBy,
//     this.loginHitCount,
//     this.isTempBlocked,
//     this.tempBlockTime,
//     this.currentLanguageKey,
//     this.profileImageFullPath,
//     this.identificationImageFullPath,
//     this.storage,
//   });
//
//   factory Customer.fromJson(Map<String, dynamic> json) {
//     return Customer(
//       id: json['id'] ?? '',
//       firstName: json['first_name'] ?? '',
//       lastName: json['last_name'] ?? '',
//       email: json['email'] ?? '',
//       phone: json['phone'] ?? '',
//       identificationNumber: json['identification_number'],
//       identificationType: json['identification_type'] ?? '',
//       identificationImage: json['identification_image'] ?? [],
//       dateOfBirth: json['date_of_birth'],
//       gender: json['gender'] ?? '',
//       profileImage: json['profile_image'] ?? '',
//       fcmToken: json['fcm_token'],
//       isPhoneVerified: (json['is_phone_verified'] as num?)?.toInt(),
//       isEmailVerified: (json['is_email_verified'] as num?)?.toInt(),
//       phoneVerifiedAt: json['phone_verified_at'],
//       emailVerifiedAt: json['email_verified_at'],
//       isActive: (json['is_active'] as num?)?.toInt(),
//       userType: json['user_type'] ?? '',
//       rememberToken: json['remember_token'],
//       deletedAt: json['deleted_at'],
//       createdAt: json['created_at'] != null
//           ? DateTime.parse(json['created_at'])
//           : null,
//       updatedAt: json['updated_at'] != null
//           ? DateTime.parse(json['updated_at'])
//           : null,
//       walletBalance: json['wallet_balance'] ?? 0,
//       loyaltyPoint: json['loyalty_point'] ?? 0,
//       refCode: json['ref_code'] ?? '',
//       referredBy: json['referred_by'],
//       loginHitCount: (json['login_hit_count'] as num?)?.toInt() ?? 0,
//       isTempBlocked: (json['is_temp_blocked'] as num?)?.toInt(),
//       tempBlockTime: json['temp_block_time'],
//       currentLanguageKey: json['current_language_key'] ?? '',
//       profileImageFullPath: json['profile_image_full_path'],
//       identificationImageFullPath: json['identification_image_full_path'] ?? [],
//       storage: json['storage'],
//     );
//   }
// }
//
// class Provider {
//   final String? id;
//   final String? userId;
//   final String? companyName;
//   final String? fullName;
//   final String? companyAddress;
//   final String? contactNumber;
//   final String? altContactNumber;
//   final String? email;
//   final int? registrationFeeStatus;
//   final String? zoneId;
//   final Coordinates? coordinates;
//   final String? adharNumber;
//   final String? adharImg;
//   final String? panNumber;
//   final String? panImg;
//   final String? dlNumber;
//   final String? dlImg;
//   final String? profileImg;
//   final int? serviceAvailability;
//   final int? isApproved;
//   final int? isActive;
//   final int? isSuspended;
//   final int? ratingCount;
//   final double? avgRating;
//   final String? bankDocs;
//   final dynamic deletedAt;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final dynamic logoFullPath;
//
//   Provider({
//     this.id,
//     this.userId,
//     this.companyName,
//     this.fullName,
//     this.companyAddress,
//     this.contactNumber,
//     this.altContactNumber,
//     this.email,
//     this.registrationFeeStatus,
//     this.zoneId,
//     this.coordinates,
//     this.adharNumber,
//     this.adharImg,
//     this.panNumber,
//     this.panImg,
//     this.dlNumber,
//     this.dlImg,
//     this.profileImg,
//     this.serviceAvailability,
//     this.isApproved,
//     this.isActive,
//     this.isSuspended,
//     this.ratingCount,
//     this.avgRating,
//     this.bankDocs,
//     this.deletedAt,
//     this.createdAt,
//     this.updatedAt,
//     this.logoFullPath,
//   });
// }
//
// class Coordinates {
//   final String? latitude;
//   final String? longitude;
//
//   Coordinates({
//     this.latitude,
//     this.longitude,
//   });
// }
//
// class Service {
//   final String? id;
//   final String? name;
//   final String? shortDescription;
//   final String? description;
//   final String? coverImage;
//   final String? thumbnail;
//   final String? categoryId;
//   final String? subCategoryId;
//   final int? tax;
//   final int? orderCount;
//   final int? isActive;
//   final int? ratingCount;
//   final double? avgRating;
//   final String? minBiddingPrice;
//   final dynamic deletedAt;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final String? thumbnailFullPath;
//   final String? coverImageFullPath;
//   final List<dynamic>? serviceDiscount;
//   final List<dynamic>? campaignDiscount;
//   final List<dynamic>? translations;
//   final dynamic storageThumbnail;
//   final dynamic storageCoverImage;
//
//   Service({
//     this.id,
//     this.name,
//     this.shortDescription,
//     this.description,
//     this.coverImage,
//     this.thumbnail,
//     this.categoryId,
//     this.subCategoryId,
//     this.tax,
//     this.orderCount,
//     this.isActive,
//     this.ratingCount,
//     this.avgRating,
//     this.minBiddingPrice,
//     this.deletedAt,
//     this.createdAt,
//     this.updatedAt,
//     this.thumbnailFullPath,
//     this.coverImageFullPath,
//     this.serviceDiscount,
//     this.campaignDiscount,
//     this.translations,
//     this.storageThumbnail,
//     this.storageCoverImage,
//   });
// }
