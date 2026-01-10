// ...existing code...

class UserProfileModel {
  final String? responseCode;
  final String? message;
  final Content? content;
  final List<dynamic>? errors;

  UserProfileModel({
    this.responseCode,
    this.message,
    this.content,
    this.errors,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      UserProfileModel(
        responseCode: json["response_code"],
        message: json["message"],
        content:
            json["content"] == null ? null : Content.fromJson(json["content"]),
        errors: json["errors"] ?? [],
      );

  Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "message": message,
        "content": content?.toJson(),
        "errors": errors ?? [],
      };
}

class Content {
  final Provider? provider;
  final List<dynamic>? subCategories;
  final Reviews? reviews;
  final Rating? rating;

  Content({
    this.provider,
    this.subCategories,
    this.reviews,
    this.rating,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        provider: json["provider"] == null
            ? null
            : Provider.fromJson(json["provider"]),
        subCategories: json["sub_categories"] ?? [],
        reviews:
            json["reviews"] == null ? null : Reviews.fromJson(json["reviews"]),
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
      );

  Map<String, dynamic> toJson() => {
        "provider": provider?.toJson(),
        "sub_categories": subCategories ?? [],
        "reviews": reviews?.toJson(),
        "rating": rating?.toJson(),
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
  final dynamic ratingCount;
  final int? avgRating;
  final String? bankDocs;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? totalServiceServed;
  final int? subscribedServicesCount;
  final int? isFavorite;
  final dynamic timeSchedule;
  final List<dynamic>? weekends;
  final bool? nextBookingEligibility;
  final bool? scheduleBookingEligibility;
  final String? cashLimitStatus;
  final dynamic logoFullPath;
  final Owner? owner;

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
    this.totalServiceServed,
    this.subscribedServicesCount,
    this.isFavorite,
    this.timeSchedule,
    this.weekends,
    this.nextBookingEligibility,
    this.scheduleBookingEligibility,
    this.cashLimitStatus,
    this.logoFullPath,
    this.owner,
  });

  // ...existing code...

  factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json["id"],
        userId: json["user_id"],
        companyName: json["company_name"],
        fullName: json["full_name"],
        companyAddress: json["company_address"],
        contactNumber: json["contact_number"],
        altContactNumber: json["alt_contact_number"],
        email: json["email"],
        zoneId: json["zone_id"],
        coordinates: json["coordinates"] == null
            ? null
            : Coordinates.fromJson(json["coordinates"]),
        adharNumber: json["adhar_number"],
        adharImg: json["adhar_img"],
        panNumber: json["pan_number"],
        panImg: json["pan_img"],
        dlNumber: json["dl_number"],
        dlImg: json["dl_img"],
        profileImg: json["profile_img"],
        serviceAvailability: (json["service_availability"] as num?)?.toInt(),
        isApproved: (json["is_approved"] as num?)?.toInt(),
        isActive: (json["is_active"] as num?)?.toInt(),
        isSuspended: (json["is_suspended"] as num?)?.toInt(),
        ratingCount: (json["rating_count"] as num?)?.toInt(),
        avgRating: (json["avg_rating"] as num?)?.toInt(),
        bankDocs: json["bank_docs"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        totalServiceServed: (json["total_service_served"] as num?)?.toInt(),
        subscribedServicesCount:
            (json["subscribed_services_count"] as num?)?.toInt(),
        isFavorite: (json["is_favorite"] as num?)?.toInt(),
        timeSchedule: json["time_schedule"],
        weekends: json["weekends"] ?? [],
        nextBookingEligibility: json["nextBookingEligibility"],
        scheduleBookingEligibility: json["scheduleBookingEligibility"],
        cashLimitStatus: json["cash_limit_status"],
        logoFullPath: json["logo_full_path"],
        owner: json["owner"] == null ? null : Owner.fromJson(json["owner"]),
      );

// ...existing code...

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "company_name": companyName,
        "full_name": fullName,
        "company_address": companyAddress,
        "contact_number": contactNumber,
        "alt_contact_number": altContactNumber,
        "email": email,
        "zone_id": zoneId,
        "coordinates": coordinates?.toJson(),
        "adhar_number": adharNumber,
        "adhar_img": adharImg,
        "pan_number": panNumber,
        "pan_img": panImg,
        "dl_number": dlNumber,
        "dl_img": dlImg,
        "profile_img": profileImg,
        "service_availability": serviceAvailability,
        "is_approved": isApproved,
        "is_active": isActive,
        "is_suspended": isSuspended,
        "rating_count": ratingCount,
        "avg_rating": avgRating,
        "bank_docs": bankDocs,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "total_service_served": totalServiceServed,
        "subscribed_services_count": subscribedServicesCount,
        "is_favorite": isFavorite,
        "time_schedule": timeSchedule,
        "weekends": weekends ?? [],
        "nextBookingEligibility": nextBookingEligibility,
        "scheduleBookingEligibility": scheduleBookingEligibility,
        "cash_limit_status": cashLimitStatus,
        "logo_full_path": logoFullPath,
        "owner": owner?.toJson(),
      };
}

class Coordinates {
  final String? latitude;
  final String? longitude;

  Coordinates({
    this.latitude,
    this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Owner {
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
  final String? fcmToken;
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
  final Account? account;
  final dynamic storage;

  Owner({
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
    this.account,
    this.storage,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        phone: json["phone"],
        identificationNumber: json["identification_number"],
        identificationType: json["identification_type"],
        identificationImage: json["identification_image"] ?? [],
        dateOfBirth: json["date_of_birth"],
        gender: json["gender"],
        profileImage: json["profile_image"],
        fcmToken: json["fcm_token"],
        isPhoneVerified: json["is_phone_verified"],
        isEmailVerified: json["is_email_verified"],
        phoneVerifiedAt: json["phone_verified_at"],
        emailVerifiedAt: json["email_verified_at"],
        isActive: json["is_active"],
        userType: json["user_type"],
        rememberToken: json["remember_token"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        walletBalance: json["wallet_balance"],
        loyaltyPoint: json["loyalty_point"],
        refCode: json["ref_code"],
        referredBy: json["referred_by"],
        loginHitCount: json["login_hit_count"],
        isTempBlocked: json["is_temp_blocked"],
        tempBlockTime: json["temp_block_time"],
        currentLanguageKey: json["current_language_key"],
        profileImageFullPath: json["profile_image_full_path"],
        identificationImageFullPath:
            json["identification_image_full_path"] ?? [],
        account:
            json["account"] == null ? null : Account.fromJson(json["account"]),
        storage: json["storage"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "phone": phone,
        "identification_number": identificationNumber,
        "identification_type": identificationType,
        "identification_image": identificationImage ?? [],
        "date_of_birth": dateOfBirth,
        "gender": gender,
        "profile_image": profileImage,
        "fcm_token": fcmToken,
        "is_phone_verified": isPhoneVerified,
        "is_email_verified": isEmailVerified,
        "phone_verified_at": phoneVerifiedAt,
        "email_verified_at": emailVerifiedAt,
        "is_active": isActive,
        "user_type": userType,
        "remember_token": rememberToken,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "wallet_balance": walletBalance,
        "loyalty_point": loyaltyPoint,
        "ref_code": refCode,
        "referred_by": referredBy,
        "login_hit_count": loginHitCount,
        "is_temp_blocked": isTempBlocked,
        "temp_block_time": tempBlockTime,
        "current_language_key": currentLanguageKey,
        "profile_image_full_path": profileImageFullPath,
        "identification_image_full_path": identificationImageFullPath ?? [],
        "account": account?.toJson(),
        "storage": storage,
      };
}

class Account {
  final String? id;
  final String? userId;
  final double? balancePending;
  final double? receivedBalance;
  final double? accountPayable;
  final double? accountReceivable;
  final double? totalWithdrawn;
  final String? totalExpense;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Account({
    this.id,
    this.userId,
    this.balancePending,
    this.receivedBalance,
    this.accountPayable,
    this.accountReceivable,
    this.totalWithdrawn,
    this.totalExpense,
    this.createdAt,
    this.updatedAt,
  });

  factory Account.fromJson(Map<String, dynamic> json) => Account(
        id: json["id"],
        userId: json["user_id"],
        balancePending: (json["balance_pending"] != null)
            ? double.tryParse(json["balance_pending"].toString())
            : null,
        receivedBalance: (json["received_balance"] != null)
            ? double.tryParse(json["received_balance"].toString())
            : null,
        accountPayable: (json["account_payable"] != null)
            ? double.tryParse(json["account_payable"].toString())
            : null,
        accountReceivable: (json["account_receivable"] != null)
            ? double.tryParse(json["account_receivable"].toString())
            : null,
        totalWithdrawn: (json["total_withdrawn"] != null)
            ? double.tryParse(json["total_withdrawn"].toString())
            : null,
        totalExpense: json["total_expense"]?.toString(),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "balance_pending": balancePending,
        "received_balance": receivedBalance,
        "account_payable": accountPayable,
        "account_receivable": accountReceivable,
        "total_withdrawn": totalWithdrawn,
        "total_expense": totalExpense,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Rating {
  final int? ratingCount;
  final int? reviewCount;
  final double? averageRating;
  final List<dynamic>? ratingGroupCount;

  Rating({
    this.ratingCount,
    this.reviewCount,
    this.averageRating,
    this.ratingGroupCount,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        ratingCount: (json['rating_count'])?.toInt(),
        reviewCount: (json["review_count"])?.toInt(),
        averageRating: (json['average_rating'])?.toDouble(),
        ratingGroupCount: json["rating_group_count"] ?? [],
      );

  Map<String, dynamic> toJson() => {
        "rating_count": ratingCount,
        "review_count": reviewCount,
        "average_rating": averageRating,
        "rating_group_count": ratingGroupCount ?? [],
      };
}

class Reviews {
  final int? currentPage;
  final List<dynamic>? data;
  final String? firstPageUrl;
  final dynamic from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final dynamic to;
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

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        currentPage: json["current_page"],
        data: json["data"] ?? [],
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: json["links"] == null
            ? []
            : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": data ?? [],
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": links?.map((x) => x.toJson()).toList() ?? [],
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Link {
  final String? url;
  final String? label;
  final bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
