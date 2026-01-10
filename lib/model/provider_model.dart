import 'package:dofix_technichian/model/review_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'provider_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ProviderModel {
  final String? responseCode;
  final String? message;
  final Provider? content;

  ProviderModel({
    this.responseCode,
    this.message,
    this.content,
  });

  factory ProviderModel.fromJson(Map<String, dynamic> json) =>
      _$ProviderModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProviderModelToJson(this);
}

// @JsonSerializable(explicitToJson: true)
// class ProviderContent {
//   final String? id;
//   final String? userId;
//   final String? companyName;
//   final String? fullName;
//   final String? companyAddress;
//   final String? contactNumber;
//   final String? altContactNumber;
//   final String? email;
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
//   @JsonKey(name: "avg_rating")  int? avgRating;
//   final String? bankDocs;
//   final String? deletedAt;
//   final String? createdAt;
//   final String? updatedAt;
//   final String? logoFullPath;
//   final Owner? owner;
//   final Zone? zone;
//
//   ProviderContent({
//     this.id,
//     this.userId,
//     this.companyName,
//     this.fullName,
//     this.companyAddress,
//     this.contactNumber,
//     this.altContactNumber,
//     this.email,
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
//     this.owner,
//     this.zone,
//   });
//
//   factory ProviderContent.fromJson(Map<String, dynamic> json) =>
//       _$ProviderContentFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ProviderContentToJson(this);
// }

//
// @JsonSerializable()
// class Coordinates {
//   final String? latitude;
//   final String? longitude;
//
//   Coordinates({
//     this.latitude,
//     this.longitude,
//   });
//
//   factory Coordinates.fromJson(Map<String, dynamic> json) =>
//       _$CoordinatesFromJson(json);
//
//   Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
// }
//
// @JsonSerializable()
// class Owner {
//   final String? id;
//   final String? firstName;
//   final String? lastName;
//   final String? email;
//   final String? phone;
//   final String? identificationNumber;
//   final String? identificationType;
//   final List<dynamic>? identificationImage;
//   final String? dateOfBirth;
//   final String? gender;
//   final String? profileImage;
//   final String? fcmToken;
//   final int? isPhoneVerified;
//   final int? isEmailVerified;
//   final String? phoneVerifiedAt;
//   final String? emailVerifiedAt;
//   final int? isActive;
//   final String? userType;
//   final String? rememberToken;
//   final String? deletedAt;
//   final String? createdAt;
//   final String? updatedAt;
//   final int? walletBalance;
//   final int? loyaltyPoint;
//   final String? refCode;
//   final String? referredBy;
//   final int? loginHitCount;
//   final int? isTempBlocked;
//   final String? tempBlockTime;
//   final String? currentLanguageKey;
//   final String? profileImageFullPath;
//   final List<dynamic>? identificationImageFullPath;
//   final String? storage;
//
//   Owner({
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
//   factory Owner.fromJson(Map<String, dynamic> json) =>
//       _$OwnerFromJson(json);
//
//   Map<String, dynamic> toJson() => _$OwnerToJson(this);
// }
//
// @JsonSerializable(explicitToJson: true)
// class Zone {
//   final String? id;
//   final String? name;
//   final ZoneCoordinates? coordinates;
//   final int? isActive;
//   final String? createdAt;
//   final String? updatedAt;
//   final List<dynamic>? translations;
//
//   Zone({
//     this.id,
//     this.name,
//     this.coordinates,
//     this.isActive,
//     this.createdAt,
//     this.updatedAt,
//     this.translations,
//   });
//
//   factory Zone.fromJson(Map<String, dynamic> json) =>
//       _$ZoneFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ZoneToJson(this);
// }
//
// @JsonSerializable()
// class ZoneCoordinates {
//   final String? type;
//   final List<List<List<double>>>? coordinates;
//
//   ZoneCoordinates({
//     this.type,
//     this.coordinates,
//   });
//
//   factory ZoneCoordinates.fromJson(Map<String, dynamic> json) =>
//       _$ZoneCoordinatesFromJson(json);
//
//   Map<String, dynamic> toJson() => _$ZoneCoordinatesToJson(this);
// }
