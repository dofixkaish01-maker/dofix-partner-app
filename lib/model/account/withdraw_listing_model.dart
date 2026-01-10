class WithdrawListingModel {
  final String? responseCode;
  final String? message;
  final Content? content;
  final List<dynamic>? errors;

  WithdrawListingModel({
    this.responseCode,
    this.message,
    this.content,
    this.errors,
  });

  factory WithdrawListingModel.fromJson(Map<String, dynamic> json) {
    return WithdrawListingModel(
      responseCode: json['response_code'],
      message: json['message'],
      content:
          json['content'] != null ? Content.fromJson(json['content']) : null,
      errors: json['errors'],
    );
  }
}

class Content {
  final WithdrawRequests? withdrawRequests;
  final int? totalCollectedCash;

  Content({
    this.withdrawRequests,
    this.totalCollectedCash,
  });

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      withdrawRequests: json['withdraw_requests'] != null
          ? WithdrawRequests.fromJson(json['withdraw_requests'])
          : null,
      totalCollectedCash: json['total_collected_cash'],
    );
  }
}

class WithdrawRequests {
  final int? currentPage;
  final List<Datum>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  WithdrawRequests({
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

  factory WithdrawRequests.fromJson(Map<String, dynamic> json) {
    return WithdrawRequests(
      currentPage: json['current_page'],
      data: json['data'] != null
          ? List<Datum>.from(json['data'].map((x) => Datum.fromJson(x)))
          : null,
      firstPageUrl: json['first_page_url'],
      from: json['from'],
      lastPage: json['last_page'],
      lastPageUrl: json['last_page_url'],
      links: json['links'] != null
          ? List<Link>.from(json['links'].map((x) => Link.fromJson(x)))
          : null,
      nextPageUrl: json['next_page_url'],
      path: json['path'],
      perPage: json['per_page'],
      prevPageUrl: json['prev_page_url'],
      to: json['to'],
      total: json['total'],
    );
  }
}

class Datum {
  final String? id;
  final String? userId;
  final String? requestUpdatedBy;
  final int? amount;
  final String? requestStatus;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? isPaid;
  final dynamic note;
  final dynamic adminNote;
  final String? withdrawalMethodId;
  final WithdrawalMethodFields? withdrawalMethodFields;
  final RequestUpdater? user;
  final RequestUpdater? requestUpdater;

  Datum({
    this.id,
    this.userId,
    this.requestUpdatedBy,
    this.amount,
    this.requestStatus,
    this.createdAt,
    this.updatedAt,
    this.isPaid,
    this.note,
    this.adminNote,
    this.withdrawalMethodId,
    this.withdrawalMethodFields,
    this.user,
    this.requestUpdater,
  });

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      id: json['id'],
      userId: json['user_id'],
      requestUpdatedBy: json['request_updated_by'],
      amount: json['amount'],
      requestStatus: json['request_status'],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
      isPaid: json['is_paid'],
      note: json['note'],
      adminNote: json['admin_note'],
      withdrawalMethodId: json['withdrawal_method_id'],
      withdrawalMethodFields: json['withdrawal_method_fields'] != null
          ? WithdrawalMethodFields.fromJson(json['withdrawal_method_fields'])
          : null,
      user: json['user'] != null ? RequestUpdater.fromJson(json['user']) : null,
      requestUpdater: json['request_updater'] != null
          ? RequestUpdater.fromJson(json['request_updater'])
          : null,
    );
  }
}

class RequestUpdater {
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

  RequestUpdater({
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

  factory RequestUpdater.fromJson(Map<String, dynamic> json) {
    return RequestUpdater(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      identificationNumber: json['identification_number'],
      identificationType: json['identification_type'],
      identificationImage: json['identification_image'],
      dateOfBirth: json['date_of_birth'],
      gender: json['gender'],
      profileImage: json['profile_image'],
      fcmToken: json['fcm_token'],
      isPhoneVerified: json['is_phone_verified'],
      isEmailVerified: json['is_email_verified'],
      phoneVerifiedAt: json['phone_verified_at'],
      emailVerifiedAt: json['email_verified_at'],
      isActive: json['is_active'],
      userType: json['user_type'],
      rememberToken: json['remember_token'],
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
      walletBalance: json['wallet_balance'],
      loyaltyPoint: json['loyalty_point'],
      refCode: json['ref_code'],
      referredBy: json['referred_by'],
      loginHitCount: json['login_hit_count'],
      isTempBlocked: json['is_temp_blocked'],
      tempBlockTime: json['temp_block_time'],
      currentLanguageKey: json['current_language_key'],
      profileImageFullPath: json['profile_image_full_path'],
      identificationImageFullPath: json['identification_image_full_path'],
      account:
          json['account'] != null ? Account.fromJson(json['account']) : null,
      storage: json['storage'],
    );
  }
}

class Account {
  final String? id;
  final String? userId;
  final double? balancePending;
  final double? receivedBalance;
  final double? accountPayable;
  final double? accountReceivable;
  final double? totalWithdrawn;
  final double? totalExpense;
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

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      userId: json['user_id'],
      balancePending: (json['balance_pending'] != null)
          ? double.tryParse(json['balance_pending'].toString())
          : null,
      receivedBalance: (json['received_balance'] != null)
          ? double.tryParse(json['received_balance'].toString())
          : null,
      accountPayable: (json['account_payable'] != null)
          ? double.tryParse(json['account_payable'].toString())
          : null,
      accountReceivable: (json['account_receivable'] != null)
          ? double.tryParse(json['account_receivable'].toString())
          : null,
      totalWithdrawn: (json['total_withdrawn'] != null)
          ? double.tryParse(json['total_withdrawn'].toString())
          : null,
      totalExpense: (json['total_expense'] != null)
          ? double.tryParse(json['total_expense'].toString())
          : null,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
    );
  }
}

class WithdrawalMethodFields {
  final String? inputType;
  final String? inputName;
  final String? placeholder;
  final int? isRequired;

  WithdrawalMethodFields({
    this.inputType,
    this.inputName,
    this.placeholder,
    this.isRequired,
  });

  factory WithdrawalMethodFields.fromJson(Map<String, dynamic> json) {
    return WithdrawalMethodFields(
      inputType: json['input_type'],
      inputName: json['input_name'],
      placeholder: json['placeholder'],
      isRequired: json['is_required'],
    );
  }
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

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      url: json['url'],
      label: json['label'],
      active: json['active'],
    );
  }
}
