import 'dart:convert';

WalletHistoryModel walletHistoryModelFromJson(String str) =>
    WalletHistoryModel.fromJson(json.decode(str));

String walletHistoryModelToJson(WalletHistoryModel data) =>
    json.encode(data.toJson());

class WalletHistoryModel {
  String? responseCode;
  String? message;
  List<Content>? content;
  int? errors;

  WalletHistoryModel({
    this.responseCode,
    this.message,
    this.content,
    this.errors,
  });

  factory WalletHistoryModel.fromJson(Map<String, dynamic> json) =>
      WalletHistoryModel(
        responseCode: json["response_code"],
        message: json["message"],
        content: json["content"] == null
            ? []
            : List<Content>.from(
                json["content"]!.map((x) => Content.fromJson(x))),
        errors: json["errors"],
      );

  Map<String, dynamic> toJson() => {
        "response_code": responseCode,
        "message": message,
        "content": content == null
            ? []
            : List<dynamic>.from(content!.map((x) => x.toJson())),
        "errors": errors,
      };
}

class Content {
  String? id;
  String? refTrxId;
  String? bookingId;
  String? trxType;
  double? debit;
  double? credit;
  double? balance;
  String? fromUserId;
  String? toUserId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fromUserAccount;
  String? toUserAccount;
  dynamic referenceNote;
  int? isGuest;
  dynamic bookingRepeatId;
  Booking? booking;
  UserInfo? fromUser;
  UserInfo? toUser;

  Content({
    this.id,
    this.refTrxId,
    this.bookingId,
    this.trxType,
    this.debit,
    this.credit,
    this.balance,
    this.fromUserId,
    this.toUserId,
    this.createdAt,
    this.updatedAt,
    this.fromUserAccount,
    this.toUserAccount,
    this.referenceNote,
    this.isGuest,
    this.bookingRepeatId,
    this.booking,
    this.fromUser,
    this.toUser,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        refTrxId: json["ref_trx_id"],
        bookingId: json["booking_id"],
        trxType: json["trx_type"],
        debit: json["debit"]?.toDouble(),
        credit: json["credit"]?.toDouble(),
        balance: json["balance"]?.toDouble(),
        fromUserId: json["from_user_id"],
        toUserId: json["to_user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        fromUserAccount: json["from_user_account"],
        toUserAccount: json["to_user_account"],
        referenceNote: json["reference_note"],
        isGuest: json["is_guest"],
        bookingRepeatId: json["booking_repeat_id"],
        booking:
            json["booking"] == null ? null : Booking.fromJson(json["booking"]),
        fromUser: json["from_user"] == null
            ? null
            : UserInfo.fromJson(json["from_user"]),
        toUser:
            json["to_user"] == null ? null : UserInfo.fromJson(json["to_user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ref_trx_id": refTrxId,
        "booking_id": bookingId,
        "trx_type": trxType,
        "debit": debit,
        "credit": credit,
        "balance": balance,
        "from_user_id": fromUserId,
        "to_user_id": toUserId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "from_user_account": fromUserAccount,
        "to_user_account": toUserAccount,
        "reference_note": referenceNote,
        "is_guest": isGuest,
        "booking_repeat_id": bookingRepeatId,
        "booking": booking?.toJson(),
        "from_user": fromUser?.toJson(),
        "to_user": toUser?.toJson(),
      };
}

class Booking {
  String? id;
  int? readableId;
  String? bookingStatus;
  int? isPaid;
  String? paymentMethod;
  double? totalBookingAmount;
  double? totalTaxAmount;
  String? serviceSchedule;
  int? dueAmtStatus;
  List<String>? evidencePhotosFullPath;
  List<String>? preWorkImageFullPath;

  Booking({
    this.id,
    this.readableId,
    this.bookingStatus,
    this.isPaid,
    this.paymentMethod,
    this.totalBookingAmount,
    this.totalTaxAmount,
    this.serviceSchedule,
    this.dueAmtStatus,
    this.evidencePhotosFullPath,
    this.preWorkImageFullPath,
  });

  factory Booking.fromJson(Map<String, dynamic> json) => Booking(
        id: json["id"],
        readableId: json["readable_id"],
        bookingStatus: json["booking_status"],
        isPaid: json["is_paid"],
        paymentMethod: json["payment_method"],
        totalBookingAmount: json["total_booking_amount"]?.toDouble(),
        totalTaxAmount: json["total_tax_amount"]?.toDouble(),
        serviceSchedule: json["service_schedule"],
        dueAmtStatus: json["due_amt_status"],
        evidencePhotosFullPath: json["evidence_photos_full_path"] == null
            ? []
            : List<String>.from(json["evidence_photos_full_path"]),
        preWorkImageFullPath: json["pre_work_image_full_path"] == null
            ? []
            : List<String>.from(json["pre_work_image_full_path"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "readable_id": readableId,
        "booking_status": bookingStatus,
        "is_paid": isPaid,
        "payment_method": paymentMethod,
        "total_booking_amount": totalBookingAmount,
        "total_tax_amount": totalTaxAmount,
        "service_schedule": serviceSchedule,
        "due_amt_status": dueAmtStatus,
        "evidence_photos_full_path": evidencePhotosFullPath ?? [],
        "pre_work_image_full_path": preWorkImageFullPath ?? [],
      };
}

class UserInfo {
  String? id;
  String? firstName;
  String? lastName;
  String? profileImageFullPath;
  List<dynamic>? identificationImageFullPath;

  UserInfo({
    this.id,
    this.firstName,
    this.lastName,
    this.profileImageFullPath,
    this.identificationImageFullPath,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        profileImageFullPath: json["profile_image_full_path"],
        identificationImageFullPath:
            json["identification_image_full_path"] == null
                ? []
                : List<dynamic>.from(json["identification_image_full_path"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "profile_image_full_path": profileImageFullPath,
        "identification_image_full_path": identificationImageFullPath ?? [],
      };
}
