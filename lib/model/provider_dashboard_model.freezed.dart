// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'provider_dashboard_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProviderDashboardModel {
  @JsonKey(name: 'response_code')
  String? get responseCode;
  String? get message;
  Content? get content;
  List<dynamic>? get errors;

  /// Create a copy of ProviderDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProviderDashboardModelCopyWith<ProviderDashboardModel> get copyWith =>
      _$ProviderDashboardModelCopyWithImpl<ProviderDashboardModel>(
          this as ProviderDashboardModel, _$identity);

  /// Serializes this ProviderDashboardModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProviderDashboardModel &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other.errors, errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, responseCode, message, content,
      const DeepCollectionEquality().hash(errors));

  @override
  String toString() {
    return 'ProviderDashboardModel(responseCode: $responseCode, message: $message, content: $content, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class $ProviderDashboardModelCopyWith<$Res> {
  factory $ProviderDashboardModelCopyWith(ProviderDashboardModel value,
          $Res Function(ProviderDashboardModel) _then) =
      _$ProviderDashboardModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'response_code') String? responseCode,
      String? message,
      Content? content,
      List<dynamic>? errors});

  $ContentCopyWith<$Res>? get content;
}

/// @nodoc
class _$ProviderDashboardModelCopyWithImpl<$Res>
    implements $ProviderDashboardModelCopyWith<$Res> {
  _$ProviderDashboardModelCopyWithImpl(this._self, this._then);

  final ProviderDashboardModel _self;
  final $Res Function(ProviderDashboardModel) _then;

  /// Create a copy of ProviderDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? content = freezed,
    Object? errors = freezed,
  }) {
    return _then(_self.copyWith(
      responseCode: freezed == responseCode
          ? _self.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
      errors: freezed == errors
          ? _self.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }

  /// Create a copy of ProviderDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentCopyWith<$Res>? get content {
    if (_self.content == null) {
      return null;
    }

    return $ContentCopyWith<$Res>(_self.content!, (value) {
      return _then(_self.copyWith(content: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ProviderDashboardModel implements ProviderDashboardModel {
  const _ProviderDashboardModel(
      {@JsonKey(name: 'response_code') this.responseCode,
      this.message,
      this.content,
      final List<dynamic>? errors})
      : _errors = errors;
  factory _ProviderDashboardModel.fromJson(Map<String, dynamic> json) =>
      _$ProviderDashboardModelFromJson(json);

  @override
  @JsonKey(name: 'response_code')
  final String? responseCode;
  @override
  final String? message;
  @override
  final Content? content;
  final List<dynamic>? _errors;
  @override
  List<dynamic>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of ProviderDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProviderDashboardModelCopyWith<_ProviderDashboardModel> get copyWith =>
      __$ProviderDashboardModelCopyWithImpl<_ProviderDashboardModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProviderDashboardModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProviderDashboardModel &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._errors, _errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, responseCode, message, content,
      const DeepCollectionEquality().hash(_errors));

  @override
  String toString() {
    return 'ProviderDashboardModel(responseCode: $responseCode, message: $message, content: $content, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class _$ProviderDashboardModelCopyWith<$Res>
    implements $ProviderDashboardModelCopyWith<$Res> {
  factory _$ProviderDashboardModelCopyWith(_ProviderDashboardModel value,
          $Res Function(_ProviderDashboardModel) _then) =
      __$ProviderDashboardModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'response_code') String? responseCode,
      String? message,
      Content? content,
      List<dynamic>? errors});

  @override
  $ContentCopyWith<$Res>? get content;
}

/// @nodoc
class __$ProviderDashboardModelCopyWithImpl<$Res>
    implements _$ProviderDashboardModelCopyWith<$Res> {
  __$ProviderDashboardModelCopyWithImpl(this._self, this._then);

  final _ProviderDashboardModel _self;
  final $Res Function(_ProviderDashboardModel) _then;

  /// Create a copy of ProviderDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? content = freezed,
    Object? errors = freezed,
  }) {
    return _then(_ProviderDashboardModel(
      responseCode: freezed == responseCode
          ? _self.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String?,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as Content?,
      errors: freezed == errors
          ? _self._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }

  /// Create a copy of ProviderDashboardModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentCopyWith<$Res>? get content {
    if (_self.content == null) {
      return null;
    }

    return $ContentCopyWith<$Res>(_self.content!, (value) {
      return _then(_self.copyWith(content: value));
    });
  }
}

/// @nodoc
mixin _$Content {
  @JsonKey(name: 'provider_info')
  ProviderInfo? get providerInfo;
  @JsonKey(name: 'booking_overview')
  List<BookingOverview>? get bookingOverview;
  @JsonKey(name: 'promotional_cost_percentage')
  PromotionalCostPercentage? get promotionalCostPercentage;
  @JsonKey(name: 'subscription_info')
  SubscriptionInfo? get subscriptionInfo;

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentCopyWith<Content> get copyWith =>
      _$ContentCopyWithImpl<Content>(this as Content, _$identity);

  /// Serializes this Content to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Content &&
            (identical(other.providerInfo, providerInfo) ||
                other.providerInfo == providerInfo) &&
            const DeepCollectionEquality()
                .equals(other.bookingOverview, bookingOverview) &&
            (identical(other.promotionalCostPercentage,
                    promotionalCostPercentage) ||
                other.promotionalCostPercentage == promotionalCostPercentage) &&
            (identical(other.subscriptionInfo, subscriptionInfo) ||
                other.subscriptionInfo == subscriptionInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      providerInfo,
      const DeepCollectionEquality().hash(bookingOverview),
      promotionalCostPercentage,
      subscriptionInfo);

  @override
  String toString() {
    return 'Content(providerInfo: $providerInfo, bookingOverview: $bookingOverview, promotionalCostPercentage: $promotionalCostPercentage, subscriptionInfo: $subscriptionInfo)';
  }
}

/// @nodoc
abstract mixin class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) _then) =
      _$ContentCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'provider_info') ProviderInfo? providerInfo,
      @JsonKey(name: 'booking_overview') List<BookingOverview>? bookingOverview,
      @JsonKey(name: 'promotional_cost_percentage')
      PromotionalCostPercentage? promotionalCostPercentage,
      @JsonKey(name: 'subscription_info') SubscriptionInfo? subscriptionInfo});

  $ProviderInfoCopyWith<$Res>? get providerInfo;
  $PromotionalCostPercentageCopyWith<$Res>? get promotionalCostPercentage;
  $SubscriptionInfoCopyWith<$Res>? get subscriptionInfo;
}

/// @nodoc
class _$ContentCopyWithImpl<$Res> implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(this._self, this._then);

  final Content _self;
  final $Res Function(Content) _then;

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? providerInfo = freezed,
    Object? bookingOverview = freezed,
    Object? promotionalCostPercentage = freezed,
    Object? subscriptionInfo = freezed,
  }) {
    return _then(_self.copyWith(
      providerInfo: freezed == providerInfo
          ? _self.providerInfo
          : providerInfo // ignore: cast_nullable_to_non_nullable
              as ProviderInfo?,
      bookingOverview: freezed == bookingOverview
          ? _self.bookingOverview
          : bookingOverview // ignore: cast_nullable_to_non_nullable
              as List<BookingOverview>?,
      promotionalCostPercentage: freezed == promotionalCostPercentage
          ? _self.promotionalCostPercentage
          : promotionalCostPercentage // ignore: cast_nullable_to_non_nullable
              as PromotionalCostPercentage?,
      subscriptionInfo: freezed == subscriptionInfo
          ? _self.subscriptionInfo
          : subscriptionInfo // ignore: cast_nullable_to_non_nullable
              as SubscriptionInfo?,
    ));
  }

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProviderInfoCopyWith<$Res>? get providerInfo {
    if (_self.providerInfo == null) {
      return null;
    }

    return $ProviderInfoCopyWith<$Res>(_self.providerInfo!, (value) {
      return _then(_self.copyWith(providerInfo: value));
    });
  }

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromotionalCostPercentageCopyWith<$Res>? get promotionalCostPercentage {
    if (_self.promotionalCostPercentage == null) {
      return null;
    }

    return $PromotionalCostPercentageCopyWith<$Res>(
        _self.promotionalCostPercentage!, (value) {
      return _then(_self.copyWith(promotionalCostPercentage: value));
    });
  }

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriptionInfoCopyWith<$Res>? get subscriptionInfo {
    if (_self.subscriptionInfo == null) {
      return null;
    }

    return $SubscriptionInfoCopyWith<$Res>(_self.subscriptionInfo!, (value) {
      return _then(_self.copyWith(subscriptionInfo: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Content implements Content {
  const _Content(
      {@JsonKey(name: 'provider_info') this.providerInfo,
      @JsonKey(name: 'booking_overview')
      final List<BookingOverview>? bookingOverview,
      @JsonKey(name: 'promotional_cost_percentage')
      this.promotionalCostPercentage,
      @JsonKey(name: 'subscription_info') this.subscriptionInfo})
      : _bookingOverview = bookingOverview;
  factory _Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);

  @override
  @JsonKey(name: 'provider_info')
  final ProviderInfo? providerInfo;
  final List<BookingOverview>? _bookingOverview;
  @override
  @JsonKey(name: 'booking_overview')
  List<BookingOverview>? get bookingOverview {
    final value = _bookingOverview;
    if (value == null) return null;
    if (_bookingOverview is EqualUnmodifiableListView) return _bookingOverview;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'promotional_cost_percentage')
  final PromotionalCostPercentage? promotionalCostPercentage;
  @override
  @JsonKey(name: 'subscription_info')
  final SubscriptionInfo? subscriptionInfo;

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContentCopyWith<_Content> get copyWith =>
      __$ContentCopyWithImpl<_Content>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ContentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Content &&
            (identical(other.providerInfo, providerInfo) ||
                other.providerInfo == providerInfo) &&
            const DeepCollectionEquality()
                .equals(other._bookingOverview, _bookingOverview) &&
            (identical(other.promotionalCostPercentage,
                    promotionalCostPercentage) ||
                other.promotionalCostPercentage == promotionalCostPercentage) &&
            (identical(other.subscriptionInfo, subscriptionInfo) ||
                other.subscriptionInfo == subscriptionInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      providerInfo,
      const DeepCollectionEquality().hash(_bookingOverview),
      promotionalCostPercentage,
      subscriptionInfo);

  @override
  String toString() {
    return 'Content(providerInfo: $providerInfo, bookingOverview: $bookingOverview, promotionalCostPercentage: $promotionalCostPercentage, subscriptionInfo: $subscriptionInfo)';
  }
}

/// @nodoc
abstract mixin class _$ContentCopyWith<$Res> implements $ContentCopyWith<$Res> {
  factory _$ContentCopyWith(_Content value, $Res Function(_Content) _then) =
      __$ContentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'provider_info') ProviderInfo? providerInfo,
      @JsonKey(name: 'booking_overview') List<BookingOverview>? bookingOverview,
      @JsonKey(name: 'promotional_cost_percentage')
      PromotionalCostPercentage? promotionalCostPercentage,
      @JsonKey(name: 'subscription_info') SubscriptionInfo? subscriptionInfo});

  @override
  $ProviderInfoCopyWith<$Res>? get providerInfo;
  @override
  $PromotionalCostPercentageCopyWith<$Res>? get promotionalCostPercentage;
  @override
  $SubscriptionInfoCopyWith<$Res>? get subscriptionInfo;
}

/// @nodoc
class __$ContentCopyWithImpl<$Res> implements _$ContentCopyWith<$Res> {
  __$ContentCopyWithImpl(this._self, this._then);

  final _Content _self;
  final $Res Function(_Content) _then;

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? providerInfo = freezed,
    Object? bookingOverview = freezed,
    Object? promotionalCostPercentage = freezed,
    Object? subscriptionInfo = freezed,
  }) {
    return _then(_Content(
      providerInfo: freezed == providerInfo
          ? _self.providerInfo
          : providerInfo // ignore: cast_nullable_to_non_nullable
              as ProviderInfo?,
      bookingOverview: freezed == bookingOverview
          ? _self._bookingOverview
          : bookingOverview // ignore: cast_nullable_to_non_nullable
              as List<BookingOverview>?,
      promotionalCostPercentage: freezed == promotionalCostPercentage
          ? _self.promotionalCostPercentage
          : promotionalCostPercentage // ignore: cast_nullable_to_non_nullable
              as PromotionalCostPercentage?,
      subscriptionInfo: freezed == subscriptionInfo
          ? _self.subscriptionInfo
          : subscriptionInfo // ignore: cast_nullable_to_non_nullable
              as SubscriptionInfo?,
    ));
  }

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProviderInfoCopyWith<$Res>? get providerInfo {
    if (_self.providerInfo == null) {
      return null;
    }

    return $ProviderInfoCopyWith<$Res>(_self.providerInfo!, (value) {
      return _then(_self.copyWith(providerInfo: value));
    });
  }

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PromotionalCostPercentageCopyWith<$Res>? get promotionalCostPercentage {
    if (_self.promotionalCostPercentage == null) {
      return null;
    }

    return $PromotionalCostPercentageCopyWith<$Res>(
        _self.promotionalCostPercentage!, (value) {
      return _then(_self.copyWith(promotionalCostPercentage: value));
    });
  }

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriptionInfoCopyWith<$Res>? get subscriptionInfo {
    if (_self.subscriptionInfo == null) {
      return null;
    }

    return $SubscriptionInfoCopyWith<$Res>(_self.subscriptionInfo!, (value) {
      return _then(_self.copyWith(subscriptionInfo: value));
    });
  }
}

/// @nodoc
mixin _$ProviderInfo {
  String? get id;
  @JsonKey(name: 'user_id')
  String? get userId;
  @JsonKey(name: 'company_name')
  String? get companyName;
  @JsonKey(name: 'full_name')
  String? get fullName;
  @JsonKey(name: 'company_address')
  String? get companyAddress;
  @JsonKey(name: 'contact_number')
  String? get contactNumber;
  @JsonKey(name: 'alt_contact_number')
  String? get altContactNumber;
  String? get email;
  @JsonKey(name: 'zone_id')
  String? get zoneId;
  Coordinates? get coordinates;
  @JsonKey(name: 'adhar_number')
  String? get adharNumber;
  @JsonKey(name: 'adhar_img')
  String? get adharImg;
  @JsonKey(name: 'pan_number')
  String? get panNumber;
  @JsonKey(name: 'pan_img')
  String? get panImg;
  @JsonKey(name: 'dl_number')
  String? get dlNumber;
  @JsonKey(name: 'dl_img')
  String? get dlImg;
  @JsonKey(name: 'profile_img')
  String? get profileImg;
  @JsonKey(name: 'service_availability')
  int? get serviceAvailability;
  @JsonKey(name: 'is_approved')
  int? get isApproved;
  @JsonKey(name: 'is_active')
  int? get isActive;
  @JsonKey(name: 'is_suspended')
  int? get isSuspended;
  @JsonKey(name: 'rating_count')
  int? get ratingCount;
  @JsonKey(name: 'avg_rating')
  int? get avgRating;
  @JsonKey(name: 'bank_docs')
  String? get bankDocs;
  @JsonKey(name: 'deleted_at')
  String? get deletedAt;
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @JsonKey(name: 'cash_limit_status')
  String? get cashLimitStatus;
  @JsonKey(name: 'logo_full_path')
  String? get logoFullPath;
  Owner? get owner;

  /// Create a copy of ProviderInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProviderInfoCopyWith<ProviderInfo> get copyWith =>
      _$ProviderInfoCopyWithImpl<ProviderInfo>(
          this as ProviderInfo, _$identity);

  /// Serializes this ProviderInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProviderInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.companyAddress, companyAddress) ||
                other.companyAddress == companyAddress) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.altContactNumber, altContactNumber) ||
                other.altContactNumber == altContactNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.zoneId, zoneId) || other.zoneId == zoneId) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            (identical(other.adharNumber, adharNumber) ||
                other.adharNumber == adharNumber) &&
            (identical(other.adharImg, adharImg) ||
                other.adharImg == adharImg) &&
            (identical(other.panNumber, panNumber) ||
                other.panNumber == panNumber) &&
            (identical(other.panImg, panImg) || other.panImg == panImg) &&
            (identical(other.dlNumber, dlNumber) ||
                other.dlNumber == dlNumber) &&
            (identical(other.dlImg, dlImg) || other.dlImg == dlImg) &&
            (identical(other.profileImg, profileImg) ||
                other.profileImg == profileImg) &&
            (identical(other.serviceAvailability, serviceAvailability) ||
                other.serviceAvailability == serviceAvailability) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isSuspended, isSuspended) ||
                other.isSuspended == isSuspended) &&
            (identical(other.ratingCount, ratingCount) ||
                other.ratingCount == ratingCount) &&
            (identical(other.avgRating, avgRating) ||
                other.avgRating == avgRating) &&
            (identical(other.bankDocs, bankDocs) ||
                other.bankDocs == bankDocs) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.cashLimitStatus, cashLimitStatus) ||
                other.cashLimitStatus == cashLimitStatus) &&
            (identical(other.logoFullPath, logoFullPath) ||
                other.logoFullPath == logoFullPath) &&
            (identical(other.owner, owner) || other.owner == owner));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        companyName,
        fullName,
        companyAddress,
        contactNumber,
        altContactNumber,
        email,
        zoneId,
        coordinates,
        adharNumber,
        adharImg,
        panNumber,
        panImg,
        dlNumber,
        dlImg,
        profileImg,
        serviceAvailability,
        isApproved,
        isActive,
        isSuspended,
        ratingCount,
        avgRating,
        bankDocs,
        deletedAt,
        createdAt,
        updatedAt,
        cashLimitStatus,
        logoFullPath,
        owner
      ]);

  @override
  String toString() {
    return 'ProviderInfo(id: $id, userId: $userId, companyName: $companyName, fullName: $fullName, companyAddress: $companyAddress, contactNumber: $contactNumber, altContactNumber: $altContactNumber, email: $email, zoneId: $zoneId, coordinates: $coordinates, adharNumber: $adharNumber, adharImg: $adharImg, panNumber: $panNumber, panImg: $panImg, dlNumber: $dlNumber, dlImg: $dlImg, profileImg: $profileImg, serviceAvailability: $serviceAvailability, isApproved: $isApproved, isActive: $isActive, isSuspended: $isSuspended, ratingCount: $ratingCount, avgRating: $avgRating, bankDocs: $bankDocs, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, cashLimitStatus: $cashLimitStatus, logoFullPath: $logoFullPath, owner: $owner)';
  }
}

/// @nodoc
abstract mixin class $ProviderInfoCopyWith<$Res> {
  factory $ProviderInfoCopyWith(
          ProviderInfo value, $Res Function(ProviderInfo) _then) =
      _$ProviderInfoCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'company_name') String? companyName,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'company_address') String? companyAddress,
      @JsonKey(name: 'contact_number') String? contactNumber,
      @JsonKey(name: 'alt_contact_number') String? altContactNumber,
      String? email,
      @JsonKey(name: 'zone_id') String? zoneId,
      Coordinates? coordinates,
      @JsonKey(name: 'adhar_number') String? adharNumber,
      @JsonKey(name: 'adhar_img') String? adharImg,
      @JsonKey(name: 'pan_number') String? panNumber,
      @JsonKey(name: 'pan_img') String? panImg,
      @JsonKey(name: 'dl_number') String? dlNumber,
      @JsonKey(name: 'dl_img') String? dlImg,
      @JsonKey(name: 'profile_img') String? profileImg,
      @JsonKey(name: 'service_availability') int? serviceAvailability,
      @JsonKey(name: 'is_approved') int? isApproved,
      @JsonKey(name: 'is_active') int? isActive,
      @JsonKey(name: 'is_suspended') int? isSuspended,
      @JsonKey(name: 'rating_count') int? ratingCount,
      @JsonKey(name: 'avg_rating') int? avgRating,
      @JsonKey(name: 'bank_docs') String? bankDocs,
      @JsonKey(name: 'deleted_at') String? deletedAt,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'cash_limit_status') String? cashLimitStatus,
      @JsonKey(name: 'logo_full_path') String? logoFullPath,
      Owner? owner});

  $CoordinatesCopyWith<$Res>? get coordinates;
  $OwnerCopyWith<$Res>? get owner;
}

/// @nodoc
class _$ProviderInfoCopyWithImpl<$Res> implements $ProviderInfoCopyWith<$Res> {
  _$ProviderInfoCopyWithImpl(this._self, this._then);

  final ProviderInfo _self;
  final $Res Function(ProviderInfo) _then;

  /// Create a copy of ProviderInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? companyName = freezed,
    Object? fullName = freezed,
    Object? companyAddress = freezed,
    Object? contactNumber = freezed,
    Object? altContactNumber = freezed,
    Object? email = freezed,
    Object? zoneId = freezed,
    Object? coordinates = freezed,
    Object? adharNumber = freezed,
    Object? adharImg = freezed,
    Object? panNumber = freezed,
    Object? panImg = freezed,
    Object? dlNumber = freezed,
    Object? dlImg = freezed,
    Object? profileImg = freezed,
    Object? serviceAvailability = freezed,
    Object? isApproved = freezed,
    Object? isActive = freezed,
    Object? isSuspended = freezed,
    Object? ratingCount = freezed,
    Object? avgRating = freezed,
    Object? bankDocs = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? cashLimitStatus = freezed,
    Object? logoFullPath = freezed,
    Object? owner = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyAddress: freezed == companyAddress
          ? _self.companyAddress
          : companyAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      contactNumber: freezed == contactNumber
          ? _self.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      altContactNumber: freezed == altContactNumber
          ? _self.altContactNumber
          : altContactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      zoneId: freezed == zoneId
          ? _self.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: freezed == coordinates
          ? _self.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Coordinates?,
      adharNumber: freezed == adharNumber
          ? _self.adharNumber
          : adharNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      adharImg: freezed == adharImg
          ? _self.adharImg
          : adharImg // ignore: cast_nullable_to_non_nullable
              as String?,
      panNumber: freezed == panNumber
          ? _self.panNumber
          : panNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      panImg: freezed == panImg
          ? _self.panImg
          : panImg // ignore: cast_nullable_to_non_nullable
              as String?,
      dlNumber: freezed == dlNumber
          ? _self.dlNumber
          : dlNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dlImg: freezed == dlImg
          ? _self.dlImg
          : dlImg // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImg: freezed == profileImg
          ? _self.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceAvailability: freezed == serviceAvailability
          ? _self.serviceAvailability
          : serviceAvailability // ignore: cast_nullable_to_non_nullable
              as int?,
      isApproved: freezed == isApproved
          ? _self.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      isSuspended: freezed == isSuspended
          ? _self.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingCount: freezed == ratingCount
          ? _self.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      avgRating: freezed == avgRating
          ? _self.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as int?,
      bankDocs: freezed == bankDocs
          ? _self.bankDocs
          : bankDocs // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      cashLimitStatus: freezed == cashLimitStatus
          ? _self.cashLimitStatus
          : cashLimitStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      logoFullPath: freezed == logoFullPath
          ? _self.logoFullPath
          : logoFullPath // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner?,
    ));
  }

  /// Create a copy of ProviderInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoordinatesCopyWith<$Res>? get coordinates {
    if (_self.coordinates == null) {
      return null;
    }

    return $CoordinatesCopyWith<$Res>(_self.coordinates!, (value) {
      return _then(_self.copyWith(coordinates: value));
    });
  }

  /// Create a copy of ProviderInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OwnerCopyWith<$Res>? get owner {
    if (_self.owner == null) {
      return null;
    }

    return $OwnerCopyWith<$Res>(_self.owner!, (value) {
      return _then(_self.copyWith(owner: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ProviderInfo implements ProviderInfo {
  const _ProviderInfo(
      {this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'company_name') this.companyName,
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'company_address') this.companyAddress,
      @JsonKey(name: 'contact_number') this.contactNumber,
      @JsonKey(name: 'alt_contact_number') this.altContactNumber,
      this.email,
      @JsonKey(name: 'zone_id') this.zoneId,
      this.coordinates,
      @JsonKey(name: 'adhar_number') this.adharNumber,
      @JsonKey(name: 'adhar_img') this.adharImg,
      @JsonKey(name: 'pan_number') this.panNumber,
      @JsonKey(name: 'pan_img') this.panImg,
      @JsonKey(name: 'dl_number') this.dlNumber,
      @JsonKey(name: 'dl_img') this.dlImg,
      @JsonKey(name: 'profile_img') this.profileImg,
      @JsonKey(name: 'service_availability') this.serviceAvailability,
      @JsonKey(name: 'is_approved') this.isApproved,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'is_suspended') this.isSuspended,
      @JsonKey(name: 'rating_count') this.ratingCount,
      @JsonKey(name: 'avg_rating') this.avgRating,
      @JsonKey(name: 'bank_docs') this.bankDocs,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'cash_limit_status') this.cashLimitStatus,
      @JsonKey(name: 'logo_full_path') this.logoFullPath,
      this.owner});
  factory _ProviderInfo.fromJson(Map<String, dynamic> json) =>
      _$ProviderInfoFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'company_name')
  final String? companyName;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'company_address')
  final String? companyAddress;
  @override
  @JsonKey(name: 'contact_number')
  final String? contactNumber;
  @override
  @JsonKey(name: 'alt_contact_number')
  final String? altContactNumber;
  @override
  final String? email;
  @override
  @JsonKey(name: 'zone_id')
  final String? zoneId;
  @override
  final Coordinates? coordinates;
  @override
  @JsonKey(name: 'adhar_number')
  final String? adharNumber;
  @override
  @JsonKey(name: 'adhar_img')
  final String? adharImg;
  @override
  @JsonKey(name: 'pan_number')
  final String? panNumber;
  @override
  @JsonKey(name: 'pan_img')
  final String? panImg;
  @override
  @JsonKey(name: 'dl_number')
  final String? dlNumber;
  @override
  @JsonKey(name: 'dl_img')
  final String? dlImg;
  @override
  @JsonKey(name: 'profile_img')
  final String? profileImg;
  @override
  @JsonKey(name: 'service_availability')
  final int? serviceAvailability;
  @override
  @JsonKey(name: 'is_approved')
  final int? isApproved;
  @override
  @JsonKey(name: 'is_active')
  final int? isActive;
  @override
  @JsonKey(name: 'is_suspended')
  final int? isSuspended;
  @override
  @JsonKey(name: 'rating_count')
  final int? ratingCount;
  @override
  @JsonKey(name: 'avg_rating')
  final int? avgRating;
  @override
  @JsonKey(name: 'bank_docs')
  final String? bankDocs;
  @override
  @JsonKey(name: 'deleted_at')
  final String? deletedAt;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'cash_limit_status')
  final String? cashLimitStatus;
  @override
  @JsonKey(name: 'logo_full_path')
  final String? logoFullPath;
  @override
  final Owner? owner;

  /// Create a copy of ProviderInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProviderInfoCopyWith<_ProviderInfo> get copyWith =>
      __$ProviderInfoCopyWithImpl<_ProviderInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProviderInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProviderInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.companyAddress, companyAddress) ||
                other.companyAddress == companyAddress) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.altContactNumber, altContactNumber) ||
                other.altContactNumber == altContactNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.zoneId, zoneId) || other.zoneId == zoneId) &&
            (identical(other.coordinates, coordinates) ||
                other.coordinates == coordinates) &&
            (identical(other.adharNumber, adharNumber) ||
                other.adharNumber == adharNumber) &&
            (identical(other.adharImg, adharImg) ||
                other.adharImg == adharImg) &&
            (identical(other.panNumber, panNumber) ||
                other.panNumber == panNumber) &&
            (identical(other.panImg, panImg) || other.panImg == panImg) &&
            (identical(other.dlNumber, dlNumber) ||
                other.dlNumber == dlNumber) &&
            (identical(other.dlImg, dlImg) || other.dlImg == dlImg) &&
            (identical(other.profileImg, profileImg) ||
                other.profileImg == profileImg) &&
            (identical(other.serviceAvailability, serviceAvailability) ||
                other.serviceAvailability == serviceAvailability) &&
            (identical(other.isApproved, isApproved) ||
                other.isApproved == isApproved) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isSuspended, isSuspended) ||
                other.isSuspended == isSuspended) &&
            (identical(other.ratingCount, ratingCount) ||
                other.ratingCount == ratingCount) &&
            (identical(other.avgRating, avgRating) ||
                other.avgRating == avgRating) &&
            (identical(other.bankDocs, bankDocs) ||
                other.bankDocs == bankDocs) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.cashLimitStatus, cashLimitStatus) ||
                other.cashLimitStatus == cashLimitStatus) &&
            (identical(other.logoFullPath, logoFullPath) ||
                other.logoFullPath == logoFullPath) &&
            (identical(other.owner, owner) || other.owner == owner));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        companyName,
        fullName,
        companyAddress,
        contactNumber,
        altContactNumber,
        email,
        zoneId,
        coordinates,
        adharNumber,
        adharImg,
        panNumber,
        panImg,
        dlNumber,
        dlImg,
        profileImg,
        serviceAvailability,
        isApproved,
        isActive,
        isSuspended,
        ratingCount,
        avgRating,
        bankDocs,
        deletedAt,
        createdAt,
        updatedAt,
        cashLimitStatus,
        logoFullPath,
        owner
      ]);

  @override
  String toString() {
    return 'ProviderInfo(id: $id, userId: $userId, companyName: $companyName, fullName: $fullName, companyAddress: $companyAddress, contactNumber: $contactNumber, altContactNumber: $altContactNumber, email: $email, zoneId: $zoneId, coordinates: $coordinates, adharNumber: $adharNumber, adharImg: $adharImg, panNumber: $panNumber, panImg: $panImg, dlNumber: $dlNumber, dlImg: $dlImg, profileImg: $profileImg, serviceAvailability: $serviceAvailability, isApproved: $isApproved, isActive: $isActive, isSuspended: $isSuspended, ratingCount: $ratingCount, avgRating: $avgRating, bankDocs: $bankDocs, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, cashLimitStatus: $cashLimitStatus, logoFullPath: $logoFullPath, owner: $owner)';
  }
}

/// @nodoc
abstract mixin class _$ProviderInfoCopyWith<$Res>
    implements $ProviderInfoCopyWith<$Res> {
  factory _$ProviderInfoCopyWith(
          _ProviderInfo value, $Res Function(_ProviderInfo) _then) =
      __$ProviderInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'company_name') String? companyName,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'company_address') String? companyAddress,
      @JsonKey(name: 'contact_number') String? contactNumber,
      @JsonKey(name: 'alt_contact_number') String? altContactNumber,
      String? email,
      @JsonKey(name: 'zone_id') String? zoneId,
      Coordinates? coordinates,
      @JsonKey(name: 'adhar_number') String? adharNumber,
      @JsonKey(name: 'adhar_img') String? adharImg,
      @JsonKey(name: 'pan_number') String? panNumber,
      @JsonKey(name: 'pan_img') String? panImg,
      @JsonKey(name: 'dl_number') String? dlNumber,
      @JsonKey(name: 'dl_img') String? dlImg,
      @JsonKey(name: 'profile_img') String? profileImg,
      @JsonKey(name: 'service_availability') int? serviceAvailability,
      @JsonKey(name: 'is_approved') int? isApproved,
      @JsonKey(name: 'is_active') int? isActive,
      @JsonKey(name: 'is_suspended') int? isSuspended,
      @JsonKey(name: 'rating_count') int? ratingCount,
      @JsonKey(name: 'avg_rating') int? avgRating,
      @JsonKey(name: 'bank_docs') String? bankDocs,
      @JsonKey(name: 'deleted_at') String? deletedAt,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'cash_limit_status') String? cashLimitStatus,
      @JsonKey(name: 'logo_full_path') String? logoFullPath,
      Owner? owner});

  @override
  $CoordinatesCopyWith<$Res>? get coordinates;
  @override
  $OwnerCopyWith<$Res>? get owner;
}

/// @nodoc
class __$ProviderInfoCopyWithImpl<$Res>
    implements _$ProviderInfoCopyWith<$Res> {
  __$ProviderInfoCopyWithImpl(this._self, this._then);

  final _ProviderInfo _self;
  final $Res Function(_ProviderInfo) _then;

  /// Create a copy of ProviderInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? companyName = freezed,
    Object? fullName = freezed,
    Object? companyAddress = freezed,
    Object? contactNumber = freezed,
    Object? altContactNumber = freezed,
    Object? email = freezed,
    Object? zoneId = freezed,
    Object? coordinates = freezed,
    Object? adharNumber = freezed,
    Object? adharImg = freezed,
    Object? panNumber = freezed,
    Object? panImg = freezed,
    Object? dlNumber = freezed,
    Object? dlImg = freezed,
    Object? profileImg = freezed,
    Object? serviceAvailability = freezed,
    Object? isApproved = freezed,
    Object? isActive = freezed,
    Object? isSuspended = freezed,
    Object? ratingCount = freezed,
    Object? avgRating = freezed,
    Object? bankDocs = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? cashLimitStatus = freezed,
    Object? logoFullPath = freezed,
    Object? owner = freezed,
  }) {
    return _then(_ProviderInfo(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      companyAddress: freezed == companyAddress
          ? _self.companyAddress
          : companyAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      contactNumber: freezed == contactNumber
          ? _self.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      altContactNumber: freezed == altContactNumber
          ? _self.altContactNumber
          : altContactNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      zoneId: freezed == zoneId
          ? _self.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String?,
      coordinates: freezed == coordinates
          ? _self.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Coordinates?,
      adharNumber: freezed == adharNumber
          ? _self.adharNumber
          : adharNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      adharImg: freezed == adharImg
          ? _self.adharImg
          : adharImg // ignore: cast_nullable_to_non_nullable
              as String?,
      panNumber: freezed == panNumber
          ? _self.panNumber
          : panNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      panImg: freezed == panImg
          ? _self.panImg
          : panImg // ignore: cast_nullable_to_non_nullable
              as String?,
      dlNumber: freezed == dlNumber
          ? _self.dlNumber
          : dlNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dlImg: freezed == dlImg
          ? _self.dlImg
          : dlImg // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImg: freezed == profileImg
          ? _self.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String?,
      serviceAvailability: freezed == serviceAvailability
          ? _self.serviceAvailability
          : serviceAvailability // ignore: cast_nullable_to_non_nullable
              as int?,
      isApproved: freezed == isApproved
          ? _self.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      isSuspended: freezed == isSuspended
          ? _self.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingCount: freezed == ratingCount
          ? _self.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      avgRating: freezed == avgRating
          ? _self.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as int?,
      bankDocs: freezed == bankDocs
          ? _self.bankDocs
          : bankDocs // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      cashLimitStatus: freezed == cashLimitStatus
          ? _self.cashLimitStatus
          : cashLimitStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      logoFullPath: freezed == logoFullPath
          ? _self.logoFullPath
          : logoFullPath // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _self.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as Owner?,
    ));
  }

  /// Create a copy of ProviderInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoordinatesCopyWith<$Res>? get coordinates {
    if (_self.coordinates == null) {
      return null;
    }

    return $CoordinatesCopyWith<$Res>(_self.coordinates!, (value) {
      return _then(_self.copyWith(coordinates: value));
    });
  }

  /// Create a copy of ProviderInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OwnerCopyWith<$Res>? get owner {
    if (_self.owner == null) {
      return null;
    }

    return $OwnerCopyWith<$Res>(_self.owner!, (value) {
      return _then(_self.copyWith(owner: value));
    });
  }
}

/// @nodoc
mixin _$Coordinates {
  String? get latitude;
  String? get longitude;

  /// Create a copy of Coordinates
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CoordinatesCopyWith<Coordinates> get copyWith =>
      _$CoordinatesCopyWithImpl<Coordinates>(this as Coordinates, _$identity);

  /// Serializes this Coordinates to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Coordinates &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @override
  String toString() {
    return 'Coordinates(latitude: $latitude, longitude: $longitude)';
  }
}

/// @nodoc
abstract mixin class $CoordinatesCopyWith<$Res> {
  factory $CoordinatesCopyWith(
          Coordinates value, $Res Function(Coordinates) _then) =
      _$CoordinatesCopyWithImpl;
  @useResult
  $Res call({String? latitude, String? longitude});
}

/// @nodoc
class _$CoordinatesCopyWithImpl<$Res> implements $CoordinatesCopyWith<$Res> {
  _$CoordinatesCopyWithImpl(this._self, this._then);

  final Coordinates _self;
  final $Res Function(Coordinates) _then;

  /// Create a copy of Coordinates
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_self.copyWith(
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Coordinates implements Coordinates {
  const _Coordinates({this.latitude, this.longitude});
  factory _Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  @override
  final String? latitude;
  @override
  final String? longitude;

  /// Create a copy of Coordinates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CoordinatesCopyWith<_Coordinates> get copyWith =>
      __$CoordinatesCopyWithImpl<_Coordinates>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CoordinatesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Coordinates &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @override
  String toString() {
    return 'Coordinates(latitude: $latitude, longitude: $longitude)';
  }
}

/// @nodoc
abstract mixin class _$CoordinatesCopyWith<$Res>
    implements $CoordinatesCopyWith<$Res> {
  factory _$CoordinatesCopyWith(
          _Coordinates value, $Res Function(_Coordinates) _then) =
      __$CoordinatesCopyWithImpl;
  @override
  @useResult
  $Res call({String? latitude, String? longitude});
}

/// @nodoc
class __$CoordinatesCopyWithImpl<$Res> implements _$CoordinatesCopyWith<$Res> {
  __$CoordinatesCopyWithImpl(this._self, this._then);

  final _Coordinates _self;
  final $Res Function(_Coordinates) _then;

  /// Create a copy of Coordinates
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_Coordinates(
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$Owner {
  String? get id;
  @JsonKey(name: 'first_name')
  String? get firstName;
  @JsonKey(name: 'last_name')
  String? get lastName;
  String? get email;
  String? get phone;
  @JsonKey(name: 'identification_number')
  String? get identificationNumber;
  @JsonKey(name: 'identification_type')
  String? get identificationType;
  @JsonKey(name: 'identification_image')
  List<dynamic>? get identificationImage;
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth;
  String? get gender;
  @JsonKey(name: 'profile_image')
  String? get profileImage;
  @JsonKey(name: 'fcm_token')
  String? get fcmToken;
  @JsonKey(name: 'is_phone_verified')
  int? get isPhoneVerified;
  @JsonKey(name: 'is_email_verified')
  int? get isEmailVerified;
  @JsonKey(name: 'phone_verified_at')
  String? get phoneVerifiedAt;
  @JsonKey(name: 'email_verified_at')
  String? get emailVerifiedAt;
  @JsonKey(name: 'is_active')
  int? get isActive;
  @JsonKey(name: 'user_type')
  String? get userType;
  @JsonKey(name: 'remember_token')
  String? get rememberToken;
  @JsonKey(name: 'deleted_at')
  String? get deletedAt;
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @JsonKey(name: 'wallet_balance')
  int? get walletBalance;
  @JsonKey(name: 'loyalty_point')
  int? get loyaltyPoint;
  @JsonKey(name: 'ref_code')
  String? get refCode;
  @JsonKey(name: 'referred_by')
  String? get referredBy;
  @JsonKey(name: 'login_hit_count')
  int? get loginHitCount;
  @JsonKey(name: 'is_temp_blocked')
  int? get isTempBlocked;
  @JsonKey(name: 'temp_block_time')
  String? get tempBlockTime;
  @JsonKey(name: 'current_language_key')
  String? get currentLanguageKey;
  @JsonKey(name: 'profile_image_full_path')
  String? get profileImageFullPath;
  @JsonKey(name: 'identification_image_full_path')
  List<dynamic>? get identificationImageFullPath;
  Account? get account;
  dynamic get storage;

  /// Create a copy of Owner
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OwnerCopyWith<Owner> get copyWith =>
      _$OwnerCopyWithImpl<Owner>(this as Owner, _$identity);

  /// Serializes this Owner to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Owner &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.identificationNumber, identificationNumber) ||
                other.identificationNumber == identificationNumber) &&
            (identical(other.identificationType, identificationType) ||
                other.identificationType == identificationType) &&
            const DeepCollectionEquality()
                .equals(other.identificationImage, identificationImage) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.isPhoneVerified, isPhoneVerified) ||
                other.isPhoneVerified == isPhoneVerified) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            (identical(other.phoneVerifiedAt, phoneVerifiedAt) ||
                other.phoneVerifiedAt == phoneVerifiedAt) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.rememberToken, rememberToken) ||
                other.rememberToken == rememberToken) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.walletBalance, walletBalance) ||
                other.walletBalance == walletBalance) &&
            (identical(other.loyaltyPoint, loyaltyPoint) ||
                other.loyaltyPoint == loyaltyPoint) &&
            (identical(other.refCode, refCode) || other.refCode == refCode) &&
            (identical(other.referredBy, referredBy) ||
                other.referredBy == referredBy) &&
            (identical(other.loginHitCount, loginHitCount) ||
                other.loginHitCount == loginHitCount) &&
            (identical(other.isTempBlocked, isTempBlocked) ||
                other.isTempBlocked == isTempBlocked) &&
            (identical(other.tempBlockTime, tempBlockTime) ||
                other.tempBlockTime == tempBlockTime) &&
            (identical(other.currentLanguageKey, currentLanguageKey) ||
                other.currentLanguageKey == currentLanguageKey) &&
            (identical(other.profileImageFullPath, profileImageFullPath) ||
                other.profileImageFullPath == profileImageFullPath) &&
            const DeepCollectionEquality().equals(
                other.identificationImageFullPath,
                identificationImageFullPath) &&
            (identical(other.account, account) || other.account == account) &&
            const DeepCollectionEquality().equals(other.storage, storage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        firstName,
        lastName,
        email,
        phone,
        identificationNumber,
        identificationType,
        const DeepCollectionEquality().hash(identificationImage),
        dateOfBirth,
        gender,
        profileImage,
        fcmToken,
        isPhoneVerified,
        isEmailVerified,
        phoneVerifiedAt,
        emailVerifiedAt,
        isActive,
        userType,
        rememberToken,
        deletedAt,
        createdAt,
        updatedAt,
        walletBalance,
        loyaltyPoint,
        refCode,
        referredBy,
        loginHitCount,
        isTempBlocked,
        tempBlockTime,
        currentLanguageKey,
        profileImageFullPath,
        const DeepCollectionEquality().hash(identificationImageFullPath),
        account,
        const DeepCollectionEquality().hash(storage)
      ]);

  @override
  String toString() {
    return 'Owner(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, identificationNumber: $identificationNumber, identificationType: $identificationType, identificationImage: $identificationImage, dateOfBirth: $dateOfBirth, gender: $gender, profileImage: $profileImage, fcmToken: $fcmToken, isPhoneVerified: $isPhoneVerified, isEmailVerified: $isEmailVerified, phoneVerifiedAt: $phoneVerifiedAt, emailVerifiedAt: $emailVerifiedAt, isActive: $isActive, userType: $userType, rememberToken: $rememberToken, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, walletBalance: $walletBalance, loyaltyPoint: $loyaltyPoint, refCode: $refCode, referredBy: $referredBy, loginHitCount: $loginHitCount, isTempBlocked: $isTempBlocked, tempBlockTime: $tempBlockTime, currentLanguageKey: $currentLanguageKey, profileImageFullPath: $profileImageFullPath, identificationImageFullPath: $identificationImageFullPath, account: $account, storage: $storage)';
  }
}

/// @nodoc
abstract mixin class $OwnerCopyWith<$Res> {
  factory $OwnerCopyWith(Owner value, $Res Function(Owner) _then) =
      _$OwnerCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? email,
      String? phone,
      @JsonKey(name: 'identification_number') String? identificationNumber,
      @JsonKey(name: 'identification_type') String? identificationType,
      @JsonKey(name: 'identification_image') List<dynamic>? identificationImage,
      @JsonKey(name: 'date_of_birth') String? dateOfBirth,
      String? gender,
      @JsonKey(name: 'profile_image') String? profileImage,
      @JsonKey(name: 'fcm_token') String? fcmToken,
      @JsonKey(name: 'is_phone_verified') int? isPhoneVerified,
      @JsonKey(name: 'is_email_verified') int? isEmailVerified,
      @JsonKey(name: 'phone_verified_at') String? phoneVerifiedAt,
      @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
      @JsonKey(name: 'is_active') int? isActive,
      @JsonKey(name: 'user_type') String? userType,
      @JsonKey(name: 'remember_token') String? rememberToken,
      @JsonKey(name: 'deleted_at') String? deletedAt,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'wallet_balance') int? walletBalance,
      @JsonKey(name: 'loyalty_point') int? loyaltyPoint,
      @JsonKey(name: 'ref_code') String? refCode,
      @JsonKey(name: 'referred_by') String? referredBy,
      @JsonKey(name: 'login_hit_count') int? loginHitCount,
      @JsonKey(name: 'is_temp_blocked') int? isTempBlocked,
      @JsonKey(name: 'temp_block_time') String? tempBlockTime,
      @JsonKey(name: 'current_language_key') String? currentLanguageKey,
      @JsonKey(name: 'profile_image_full_path') String? profileImageFullPath,
      @JsonKey(name: 'identification_image_full_path')
      List<dynamic>? identificationImageFullPath,
      Account? account,
      dynamic storage});

  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class _$OwnerCopyWithImpl<$Res> implements $OwnerCopyWith<$Res> {
  _$OwnerCopyWithImpl(this._self, this._then);

  final Owner _self;
  final $Res Function(Owner) _then;

  /// Create a copy of Owner
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? identificationNumber = freezed,
    Object? identificationType = freezed,
    Object? identificationImage = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? profileImage = freezed,
    Object? fcmToken = freezed,
    Object? isPhoneVerified = freezed,
    Object? isEmailVerified = freezed,
    Object? phoneVerifiedAt = freezed,
    Object? emailVerifiedAt = freezed,
    Object? isActive = freezed,
    Object? userType = freezed,
    Object? rememberToken = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? walletBalance = freezed,
    Object? loyaltyPoint = freezed,
    Object? refCode = freezed,
    Object? referredBy = freezed,
    Object? loginHitCount = freezed,
    Object? isTempBlocked = freezed,
    Object? tempBlockTime = freezed,
    Object? currentLanguageKey = freezed,
    Object? profileImageFullPath = freezed,
    Object? identificationImageFullPath = freezed,
    Object? account = freezed,
    Object? storage = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      identificationNumber: freezed == identificationNumber
          ? _self.identificationNumber
          : identificationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      identificationType: freezed == identificationType
          ? _self.identificationType
          : identificationType // ignore: cast_nullable_to_non_nullable
              as String?,
      identificationImage: freezed == identificationImage
          ? _self.identificationImage
          : identificationImage // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _self.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmToken: freezed == fcmToken
          ? _self.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      isPhoneVerified: freezed == isPhoneVerified
          ? _self.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as int?,
      isEmailVerified: freezed == isEmailVerified
          ? _self.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneVerifiedAt: freezed == phoneVerifiedAt
          ? _self.phoneVerifiedAt
          : phoneVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _self.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      userType: freezed == userType
          ? _self.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      rememberToken: freezed == rememberToken
          ? _self.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      walletBalance: freezed == walletBalance
          ? _self.walletBalance
          : walletBalance // ignore: cast_nullable_to_non_nullable
              as int?,
      loyaltyPoint: freezed == loyaltyPoint
          ? _self.loyaltyPoint
          : loyaltyPoint // ignore: cast_nullable_to_non_nullable
              as int?,
      refCode: freezed == refCode
          ? _self.refCode
          : refCode // ignore: cast_nullable_to_non_nullable
              as String?,
      referredBy: freezed == referredBy
          ? _self.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      loginHitCount: freezed == loginHitCount
          ? _self.loginHitCount
          : loginHitCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isTempBlocked: freezed == isTempBlocked
          ? _self.isTempBlocked
          : isTempBlocked // ignore: cast_nullable_to_non_nullable
              as int?,
      tempBlockTime: freezed == tempBlockTime
          ? _self.tempBlockTime
          : tempBlockTime // ignore: cast_nullable_to_non_nullable
              as String?,
      currentLanguageKey: freezed == currentLanguageKey
          ? _self.currentLanguageKey
          : currentLanguageKey // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageFullPath: freezed == profileImageFullPath
          ? _self.profileImageFullPath
          : profileImageFullPath // ignore: cast_nullable_to_non_nullable
              as String?,
      identificationImageFullPath: freezed == identificationImageFullPath
          ? _self.identificationImageFullPath
          : identificationImageFullPath // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      account: freezed == account
          ? _self.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      storage: freezed == storage
          ? _self.storage
          : storage // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  /// Create a copy of Owner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res>? get account {
    if (_self.account == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_self.account!, (value) {
      return _then(_self.copyWith(account: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Owner implements Owner {
  const _Owner(
      {this.id,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      this.email,
      this.phone,
      @JsonKey(name: 'identification_number') this.identificationNumber,
      @JsonKey(name: 'identification_type') this.identificationType,
      @JsonKey(name: 'identification_image')
      final List<dynamic>? identificationImage,
      @JsonKey(name: 'date_of_birth') this.dateOfBirth,
      this.gender,
      @JsonKey(name: 'profile_image') this.profileImage,
      @JsonKey(name: 'fcm_token') this.fcmToken,
      @JsonKey(name: 'is_phone_verified') this.isPhoneVerified,
      @JsonKey(name: 'is_email_verified') this.isEmailVerified,
      @JsonKey(name: 'phone_verified_at') this.phoneVerifiedAt,
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'user_type') this.userType,
      @JsonKey(name: 'remember_token') this.rememberToken,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'wallet_balance') this.walletBalance,
      @JsonKey(name: 'loyalty_point') this.loyaltyPoint,
      @JsonKey(name: 'ref_code') this.refCode,
      @JsonKey(name: 'referred_by') this.referredBy,
      @JsonKey(name: 'login_hit_count') this.loginHitCount,
      @JsonKey(name: 'is_temp_blocked') this.isTempBlocked,
      @JsonKey(name: 'temp_block_time') this.tempBlockTime,
      @JsonKey(name: 'current_language_key') this.currentLanguageKey,
      @JsonKey(name: 'profile_image_full_path') this.profileImageFullPath,
      @JsonKey(name: 'identification_image_full_path')
      final List<dynamic>? identificationImageFullPath,
      this.account,
      this.storage})
      : _identificationImage = identificationImage,
        _identificationImageFullPath = identificationImageFullPath;
  factory _Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'identification_number')
  final String? identificationNumber;
  @override
  @JsonKey(name: 'identification_type')
  final String? identificationType;
  final List<dynamic>? _identificationImage;
  @override
  @JsonKey(name: 'identification_image')
  List<dynamic>? get identificationImage {
    final value = _identificationImage;
    if (value == null) return null;
    if (_identificationImage is EqualUnmodifiableListView)
      return _identificationImage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  @override
  final String? gender;
  @override
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  @override
  @JsonKey(name: 'fcm_token')
  final String? fcmToken;
  @override
  @JsonKey(name: 'is_phone_verified')
  final int? isPhoneVerified;
  @override
  @JsonKey(name: 'is_email_verified')
  final int? isEmailVerified;
  @override
  @JsonKey(name: 'phone_verified_at')
  final String? phoneVerifiedAt;
  @override
  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;
  @override
  @JsonKey(name: 'is_active')
  final int? isActive;
  @override
  @JsonKey(name: 'user_type')
  final String? userType;
  @override
  @JsonKey(name: 'remember_token')
  final String? rememberToken;
  @override
  @JsonKey(name: 'deleted_at')
  final String? deletedAt;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'wallet_balance')
  final int? walletBalance;
  @override
  @JsonKey(name: 'loyalty_point')
  final int? loyaltyPoint;
  @override
  @JsonKey(name: 'ref_code')
  final String? refCode;
  @override
  @JsonKey(name: 'referred_by')
  final String? referredBy;
  @override
  @JsonKey(name: 'login_hit_count')
  final int? loginHitCount;
  @override
  @JsonKey(name: 'is_temp_blocked')
  final int? isTempBlocked;
  @override
  @JsonKey(name: 'temp_block_time')
  final String? tempBlockTime;
  @override
  @JsonKey(name: 'current_language_key')
  final String? currentLanguageKey;
  @override
  @JsonKey(name: 'profile_image_full_path')
  final String? profileImageFullPath;
  final List<dynamic>? _identificationImageFullPath;
  @override
  @JsonKey(name: 'identification_image_full_path')
  List<dynamic>? get identificationImageFullPath {
    final value = _identificationImageFullPath;
    if (value == null) return null;
    if (_identificationImageFullPath is EqualUnmodifiableListView)
      return _identificationImageFullPath;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Account? account;
  @override
  final dynamic storage;

  /// Create a copy of Owner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OwnerCopyWith<_Owner> get copyWith =>
      __$OwnerCopyWithImpl<_Owner>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OwnerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Owner &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.identificationNumber, identificationNumber) ||
                other.identificationNumber == identificationNumber) &&
            (identical(other.identificationType, identificationType) ||
                other.identificationType == identificationType) &&
            const DeepCollectionEquality()
                .equals(other._identificationImage, _identificationImage) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.isPhoneVerified, isPhoneVerified) ||
                other.isPhoneVerified == isPhoneVerified) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            (identical(other.phoneVerifiedAt, phoneVerifiedAt) ||
                other.phoneVerifiedAt == phoneVerifiedAt) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.rememberToken, rememberToken) ||
                other.rememberToken == rememberToken) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.walletBalance, walletBalance) ||
                other.walletBalance == walletBalance) &&
            (identical(other.loyaltyPoint, loyaltyPoint) ||
                other.loyaltyPoint == loyaltyPoint) &&
            (identical(other.refCode, refCode) || other.refCode == refCode) &&
            (identical(other.referredBy, referredBy) ||
                other.referredBy == referredBy) &&
            (identical(other.loginHitCount, loginHitCount) ||
                other.loginHitCount == loginHitCount) &&
            (identical(other.isTempBlocked, isTempBlocked) ||
                other.isTempBlocked == isTempBlocked) &&
            (identical(other.tempBlockTime, tempBlockTime) ||
                other.tempBlockTime == tempBlockTime) &&
            (identical(other.currentLanguageKey, currentLanguageKey) ||
                other.currentLanguageKey == currentLanguageKey) &&
            (identical(other.profileImageFullPath, profileImageFullPath) ||
                other.profileImageFullPath == profileImageFullPath) &&
            const DeepCollectionEquality().equals(
                other._identificationImageFullPath,
                _identificationImageFullPath) &&
            (identical(other.account, account) || other.account == account) &&
            const DeepCollectionEquality().equals(other.storage, storage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        firstName,
        lastName,
        email,
        phone,
        identificationNumber,
        identificationType,
        const DeepCollectionEquality().hash(_identificationImage),
        dateOfBirth,
        gender,
        profileImage,
        fcmToken,
        isPhoneVerified,
        isEmailVerified,
        phoneVerifiedAt,
        emailVerifiedAt,
        isActive,
        userType,
        rememberToken,
        deletedAt,
        createdAt,
        updatedAt,
        walletBalance,
        loyaltyPoint,
        refCode,
        referredBy,
        loginHitCount,
        isTempBlocked,
        tempBlockTime,
        currentLanguageKey,
        profileImageFullPath,
        const DeepCollectionEquality().hash(_identificationImageFullPath),
        account,
        const DeepCollectionEquality().hash(storage)
      ]);

  @override
  String toString() {
    return 'Owner(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, identificationNumber: $identificationNumber, identificationType: $identificationType, identificationImage: $identificationImage, dateOfBirth: $dateOfBirth, gender: $gender, profileImage: $profileImage, fcmToken: $fcmToken, isPhoneVerified: $isPhoneVerified, isEmailVerified: $isEmailVerified, phoneVerifiedAt: $phoneVerifiedAt, emailVerifiedAt: $emailVerifiedAt, isActive: $isActive, userType: $userType, rememberToken: $rememberToken, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, walletBalance: $walletBalance, loyaltyPoint: $loyaltyPoint, refCode: $refCode, referredBy: $referredBy, loginHitCount: $loginHitCount, isTempBlocked: $isTempBlocked, tempBlockTime: $tempBlockTime, currentLanguageKey: $currentLanguageKey, profileImageFullPath: $profileImageFullPath, identificationImageFullPath: $identificationImageFullPath, account: $account, storage: $storage)';
  }
}

/// @nodoc
abstract mixin class _$OwnerCopyWith<$Res> implements $OwnerCopyWith<$Res> {
  factory _$OwnerCopyWith(_Owner value, $Res Function(_Owner) _then) =
      __$OwnerCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? email,
      String? phone,
      @JsonKey(name: 'identification_number') String? identificationNumber,
      @JsonKey(name: 'identification_type') String? identificationType,
      @JsonKey(name: 'identification_image') List<dynamic>? identificationImage,
      @JsonKey(name: 'date_of_birth') String? dateOfBirth,
      String? gender,
      @JsonKey(name: 'profile_image') String? profileImage,
      @JsonKey(name: 'fcm_token') String? fcmToken,
      @JsonKey(name: 'is_phone_verified') int? isPhoneVerified,
      @JsonKey(name: 'is_email_verified') int? isEmailVerified,
      @JsonKey(name: 'phone_verified_at') String? phoneVerifiedAt,
      @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
      @JsonKey(name: 'is_active') int? isActive,
      @JsonKey(name: 'user_type') String? userType,
      @JsonKey(name: 'remember_token') String? rememberToken,
      @JsonKey(name: 'deleted_at') String? deletedAt,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'wallet_balance') int? walletBalance,
      @JsonKey(name: 'loyalty_point') int? loyaltyPoint,
      @JsonKey(name: 'ref_code') String? refCode,
      @JsonKey(name: 'referred_by') String? referredBy,
      @JsonKey(name: 'login_hit_count') int? loginHitCount,
      @JsonKey(name: 'is_temp_blocked') int? isTempBlocked,
      @JsonKey(name: 'temp_block_time') String? tempBlockTime,
      @JsonKey(name: 'current_language_key') String? currentLanguageKey,
      @JsonKey(name: 'profile_image_full_path') String? profileImageFullPath,
      @JsonKey(name: 'identification_image_full_path')
      List<dynamic>? identificationImageFullPath,
      Account? account,
      dynamic storage});

  @override
  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class __$OwnerCopyWithImpl<$Res> implements _$OwnerCopyWith<$Res> {
  __$OwnerCopyWithImpl(this._self, this._then);

  final _Owner _self;
  final $Res Function(_Owner) _then;

  /// Create a copy of Owner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? identificationNumber = freezed,
    Object? identificationType = freezed,
    Object? identificationImage = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? profileImage = freezed,
    Object? fcmToken = freezed,
    Object? isPhoneVerified = freezed,
    Object? isEmailVerified = freezed,
    Object? phoneVerifiedAt = freezed,
    Object? emailVerifiedAt = freezed,
    Object? isActive = freezed,
    Object? userType = freezed,
    Object? rememberToken = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? walletBalance = freezed,
    Object? loyaltyPoint = freezed,
    Object? refCode = freezed,
    Object? referredBy = freezed,
    Object? loginHitCount = freezed,
    Object? isTempBlocked = freezed,
    Object? tempBlockTime = freezed,
    Object? currentLanguageKey = freezed,
    Object? profileImageFullPath = freezed,
    Object? identificationImageFullPath = freezed,
    Object? account = freezed,
    Object? storage = freezed,
  }) {
    return _then(_Owner(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      identificationNumber: freezed == identificationNumber
          ? _self.identificationNumber
          : identificationNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      identificationType: freezed == identificationType
          ? _self.identificationType
          : identificationType // ignore: cast_nullable_to_non_nullable
              as String?,
      identificationImage: freezed == identificationImage
          ? _self._identificationImage
          : identificationImage // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _self.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      fcmToken: freezed == fcmToken
          ? _self.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      isPhoneVerified: freezed == isPhoneVerified
          ? _self.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as int?,
      isEmailVerified: freezed == isEmailVerified
          ? _self.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as int?,
      phoneVerifiedAt: freezed == phoneVerifiedAt
          ? _self.phoneVerifiedAt
          : phoneVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _self.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int?,
      userType: freezed == userType
          ? _self.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      rememberToken: freezed == rememberToken
          ? _self.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      walletBalance: freezed == walletBalance
          ? _self.walletBalance
          : walletBalance // ignore: cast_nullable_to_non_nullable
              as int?,
      loyaltyPoint: freezed == loyaltyPoint
          ? _self.loyaltyPoint
          : loyaltyPoint // ignore: cast_nullable_to_non_nullable
              as int?,
      refCode: freezed == refCode
          ? _self.refCode
          : refCode // ignore: cast_nullable_to_non_nullable
              as String?,
      referredBy: freezed == referredBy
          ? _self.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as String?,
      loginHitCount: freezed == loginHitCount
          ? _self.loginHitCount
          : loginHitCount // ignore: cast_nullable_to_non_nullable
              as int?,
      isTempBlocked: freezed == isTempBlocked
          ? _self.isTempBlocked
          : isTempBlocked // ignore: cast_nullable_to_non_nullable
              as int?,
      tempBlockTime: freezed == tempBlockTime
          ? _self.tempBlockTime
          : tempBlockTime // ignore: cast_nullable_to_non_nullable
              as String?,
      currentLanguageKey: freezed == currentLanguageKey
          ? _self.currentLanguageKey
          : currentLanguageKey // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImageFullPath: freezed == profileImageFullPath
          ? _self.profileImageFullPath
          : profileImageFullPath // ignore: cast_nullable_to_non_nullable
              as String?,
      identificationImageFullPath: freezed == identificationImageFullPath
          ? _self._identificationImageFullPath
          : identificationImageFullPath // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      account: freezed == account
          ? _self.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
      storage: freezed == storage
          ? _self.storage
          : storage // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  /// Create a copy of Owner
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res>? get account {
    if (_self.account == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_self.account!, (value) {
      return _then(_self.copyWith(account: value));
    });
  }
}

/// @nodoc
mixin _$Account {
  String? get id;
  @JsonKey(name: 'user_id')
  String? get userId;
  @JsonKey(name: 'balance_pending')
  int? get balancePending;
  @JsonKey(name: 'received_balance')
  int? get receivedBalance;
  @JsonKey(name: 'account_payable')
  int? get accountPayable;
  @JsonKey(name: 'account_receivable')
  int? get accountReceivable;
  @JsonKey(name: 'total_withdrawn')
  int? get totalWithdrawn;
  @JsonKey(name: 'total_expense')
  String? get totalExpense;
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AccountCopyWith<Account> get copyWith =>
      _$AccountCopyWithImpl<Account>(this as Account, _$identity);

  /// Serializes this Account to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Account &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.balancePending, balancePending) ||
                other.balancePending == balancePending) &&
            (identical(other.receivedBalance, receivedBalance) ||
                other.receivedBalance == receivedBalance) &&
            (identical(other.accountPayable, accountPayable) ||
                other.accountPayable == accountPayable) &&
            (identical(other.accountReceivable, accountReceivable) ||
                other.accountReceivable == accountReceivable) &&
            (identical(other.totalWithdrawn, totalWithdrawn) ||
                other.totalWithdrawn == totalWithdrawn) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      balancePending,
      receivedBalance,
      accountPayable,
      accountReceivable,
      totalWithdrawn,
      totalExpense,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'Account(id: $id, userId: $userId, balancePending: $balancePending, receivedBalance: $receivedBalance, accountPayable: $accountPayable, accountReceivable: $accountReceivable, totalWithdrawn: $totalWithdrawn, totalExpense: $totalExpense, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $AccountCopyWith<$Res> {
  factory $AccountCopyWith(Account value, $Res Function(Account) _then) =
      _$AccountCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'balance_pending') int? balancePending,
      @JsonKey(name: 'received_balance') int? receivedBalance,
      @JsonKey(name: 'account_payable') int? accountPayable,
      @JsonKey(name: 'account_receivable') int? accountReceivable,
      @JsonKey(name: 'total_withdrawn') int? totalWithdrawn,
      @JsonKey(name: 'total_expense') String? totalExpense,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class _$AccountCopyWithImpl<$Res> implements $AccountCopyWith<$Res> {
  _$AccountCopyWithImpl(this._self, this._then);

  final Account _self;
  final $Res Function(Account) _then;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? balancePending = freezed,
    Object? receivedBalance = freezed,
    Object? accountPayable = freezed,
    Object? accountReceivable = freezed,
    Object? totalWithdrawn = freezed,
    Object? totalExpense = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      balancePending: freezed == balancePending
          ? _self.balancePending
          : balancePending // ignore: cast_nullable_to_non_nullable
              as int?,
      receivedBalance: freezed == receivedBalance
          ? _self.receivedBalance
          : receivedBalance // ignore: cast_nullable_to_non_nullable
              as int?,
      accountPayable: freezed == accountPayable
          ? _self.accountPayable
          : accountPayable // ignore: cast_nullable_to_non_nullable
              as int?,
      accountReceivable: freezed == accountReceivable
          ? _self.accountReceivable
          : accountReceivable // ignore: cast_nullable_to_non_nullable
              as int?,
      totalWithdrawn: freezed == totalWithdrawn
          ? _self.totalWithdrawn
          : totalWithdrawn // ignore: cast_nullable_to_non_nullable
              as int?,
      totalExpense: freezed == totalExpense
          ? _self.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Account implements Account {
  const _Account(
      {this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'balance_pending') this.balancePending,
      @JsonKey(name: 'received_balance') this.receivedBalance,
      @JsonKey(name: 'account_payable') this.accountPayable,
      @JsonKey(name: 'account_receivable') this.accountReceivable,
      @JsonKey(name: 'total_withdrawn') this.totalWithdrawn,
      @JsonKey(name: 'total_expense') this.totalExpense,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});
  factory _Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'user_id')
  final String? userId;
  @override
  @JsonKey(name: 'balance_pending')
  final int? balancePending;
  @override
  @JsonKey(name: 'received_balance')
  final int? receivedBalance;
  @override
  @JsonKey(name: 'account_payable')
  final int? accountPayable;
  @override
  @JsonKey(name: 'account_receivable')
  final int? accountReceivable;
  @override
  @JsonKey(name: 'total_withdrawn')
  final int? totalWithdrawn;
  @override
  @JsonKey(name: 'total_expense')
  final String? totalExpense;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AccountCopyWith<_Account> get copyWith =>
      __$AccountCopyWithImpl<_Account>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AccountToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Account &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.balancePending, balancePending) ||
                other.balancePending == balancePending) &&
            (identical(other.receivedBalance, receivedBalance) ||
                other.receivedBalance == receivedBalance) &&
            (identical(other.accountPayable, accountPayable) ||
                other.accountPayable == accountPayable) &&
            (identical(other.accountReceivable, accountReceivable) ||
                other.accountReceivable == accountReceivable) &&
            (identical(other.totalWithdrawn, totalWithdrawn) ||
                other.totalWithdrawn == totalWithdrawn) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      balancePending,
      receivedBalance,
      accountPayable,
      accountReceivable,
      totalWithdrawn,
      totalExpense,
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'Account(id: $id, userId: $userId, balancePending: $balancePending, receivedBalance: $receivedBalance, accountPayable: $accountPayable, accountReceivable: $accountReceivable, totalWithdrawn: $totalWithdrawn, totalExpense: $totalExpense, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$AccountCopyWith<$Res> implements $AccountCopyWith<$Res> {
  factory _$AccountCopyWith(_Account value, $Res Function(_Account) _then) =
      __$AccountCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'user_id') String? userId,
      @JsonKey(name: 'balance_pending') int? balancePending,
      @JsonKey(name: 'received_balance') int? receivedBalance,
      @JsonKey(name: 'account_payable') int? accountPayable,
      @JsonKey(name: 'account_receivable') int? accountReceivable,
      @JsonKey(name: 'total_withdrawn') int? totalWithdrawn,
      @JsonKey(name: 'total_expense') String? totalExpense,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});
}

/// @nodoc
class __$AccountCopyWithImpl<$Res> implements _$AccountCopyWith<$Res> {
  __$AccountCopyWithImpl(this._self, this._then);

  final _Account _self;
  final $Res Function(_Account) _then;

  /// Create a copy of Account
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? balancePending = freezed,
    Object? receivedBalance = freezed,
    Object? accountPayable = freezed,
    Object? accountReceivable = freezed,
    Object? totalWithdrawn = freezed,
    Object? totalExpense = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_Account(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      balancePending: freezed == balancePending
          ? _self.balancePending
          : balancePending // ignore: cast_nullable_to_non_nullable
              as int?,
      receivedBalance: freezed == receivedBalance
          ? _self.receivedBalance
          : receivedBalance // ignore: cast_nullable_to_non_nullable
              as int?,
      accountPayable: freezed == accountPayable
          ? _self.accountPayable
          : accountPayable // ignore: cast_nullable_to_non_nullable
              as int?,
      accountReceivable: freezed == accountReceivable
          ? _self.accountReceivable
          : accountReceivable // ignore: cast_nullable_to_non_nullable
              as int?,
      totalWithdrawn: freezed == totalWithdrawn
          ? _self.totalWithdrawn
          : totalWithdrawn // ignore: cast_nullable_to_non_nullable
              as int?,
      totalExpense: freezed == totalExpense
          ? _self.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$BookingOverview {
  @JsonKey(name: 'booking_status')
  String? get bookingStatus;
  int? get total;

  /// Create a copy of BookingOverview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookingOverviewCopyWith<BookingOverview> get copyWith =>
      _$BookingOverviewCopyWithImpl<BookingOverview>(
          this as BookingOverview, _$identity);

  /// Serializes this BookingOverview to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookingOverview &&
            (identical(other.bookingStatus, bookingStatus) ||
                other.bookingStatus == bookingStatus) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bookingStatus, total);

  @override
  String toString() {
    return 'BookingOverview(bookingStatus: $bookingStatus, total: $total)';
  }
}

/// @nodoc
abstract mixin class $BookingOverviewCopyWith<$Res> {
  factory $BookingOverviewCopyWith(
          BookingOverview value, $Res Function(BookingOverview) _then) =
      _$BookingOverviewCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'booking_status') String? bookingStatus, int? total});
}

/// @nodoc
class _$BookingOverviewCopyWithImpl<$Res>
    implements $BookingOverviewCopyWith<$Res> {
  _$BookingOverviewCopyWithImpl(this._self, this._then);

  final BookingOverview _self;
  final $Res Function(BookingOverview) _then;

  /// Create a copy of BookingOverview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingStatus = freezed,
    Object? total = freezed,
  }) {
    return _then(_self.copyWith(
      bookingStatus: freezed == bookingStatus
          ? _self.bookingStatus
          : bookingStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BookingOverview implements BookingOverview {
  const _BookingOverview(
      {@JsonKey(name: 'booking_status') this.bookingStatus, this.total});
  factory _BookingOverview.fromJson(Map<String, dynamic> json) =>
      _$BookingOverviewFromJson(json);

  @override
  @JsonKey(name: 'booking_status')
  final String? bookingStatus;
  @override
  final int? total;

  /// Create a copy of BookingOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BookingOverviewCopyWith<_BookingOverview> get copyWith =>
      __$BookingOverviewCopyWithImpl<_BookingOverview>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BookingOverviewToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BookingOverview &&
            (identical(other.bookingStatus, bookingStatus) ||
                other.bookingStatus == bookingStatus) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bookingStatus, total);

  @override
  String toString() {
    return 'BookingOverview(bookingStatus: $bookingStatus, total: $total)';
  }
}

/// @nodoc
abstract mixin class _$BookingOverviewCopyWith<$Res>
    implements $BookingOverviewCopyWith<$Res> {
  factory _$BookingOverviewCopyWith(
          _BookingOverview value, $Res Function(_BookingOverview) _then) =
      __$BookingOverviewCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'booking_status') String? bookingStatus, int? total});
}

/// @nodoc
class __$BookingOverviewCopyWithImpl<$Res>
    implements _$BookingOverviewCopyWith<$Res> {
  __$BookingOverviewCopyWithImpl(this._self, this._then);

  final _BookingOverview _self;
  final $Res Function(_BookingOverview) _then;

  /// Create a copy of BookingOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bookingStatus = freezed,
    Object? total = freezed,
  }) {
    return _then(_BookingOverview(
      bookingStatus: freezed == bookingStatus
          ? _self.bookingStatus
          : bookingStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$PromotionalCostPercentage {
  int? get discount;
  int? get campaign;
  int? get coupon;

  /// Create a copy of PromotionalCostPercentage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PromotionalCostPercentageCopyWith<PromotionalCostPercentage> get copyWith =>
      _$PromotionalCostPercentageCopyWithImpl<PromotionalCostPercentage>(
          this as PromotionalCostPercentage, _$identity);

  /// Serializes this PromotionalCostPercentage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PromotionalCostPercentage &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.campaign, campaign) ||
                other.campaign == campaign) &&
            (identical(other.coupon, coupon) || other.coupon == coupon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, discount, campaign, coupon);

  @override
  String toString() {
    return 'PromotionalCostPercentage(discount: $discount, campaign: $campaign, coupon: $coupon)';
  }
}

/// @nodoc
abstract mixin class $PromotionalCostPercentageCopyWith<$Res> {
  factory $PromotionalCostPercentageCopyWith(PromotionalCostPercentage value,
          $Res Function(PromotionalCostPercentage) _then) =
      _$PromotionalCostPercentageCopyWithImpl;
  @useResult
  $Res call({int? discount, int? campaign, int? coupon});
}

/// @nodoc
class _$PromotionalCostPercentageCopyWithImpl<$Res>
    implements $PromotionalCostPercentageCopyWith<$Res> {
  _$PromotionalCostPercentageCopyWithImpl(this._self, this._then);

  final PromotionalCostPercentage _self;
  final $Res Function(PromotionalCostPercentage) _then;

  /// Create a copy of PromotionalCostPercentage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discount = freezed,
    Object? campaign = freezed,
    Object? coupon = freezed,
  }) {
    return _then(_self.copyWith(
      discount: freezed == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      campaign: freezed == campaign
          ? _self.campaign
          : campaign // ignore: cast_nullable_to_non_nullable
              as int?,
      coupon: freezed == coupon
          ? _self.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PromotionalCostPercentage implements PromotionalCostPercentage {
  const _PromotionalCostPercentage({this.discount, this.campaign, this.coupon});
  factory _PromotionalCostPercentage.fromJson(Map<String, dynamic> json) =>
      _$PromotionalCostPercentageFromJson(json);

  @override
  final int? discount;
  @override
  final int? campaign;
  @override
  final int? coupon;

  /// Create a copy of PromotionalCostPercentage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PromotionalCostPercentageCopyWith<_PromotionalCostPercentage>
      get copyWith =>
          __$PromotionalCostPercentageCopyWithImpl<_PromotionalCostPercentage>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PromotionalCostPercentageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PromotionalCostPercentage &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.campaign, campaign) ||
                other.campaign == campaign) &&
            (identical(other.coupon, coupon) || other.coupon == coupon));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, discount, campaign, coupon);

  @override
  String toString() {
    return 'PromotionalCostPercentage(discount: $discount, campaign: $campaign, coupon: $coupon)';
  }
}

/// @nodoc
abstract mixin class _$PromotionalCostPercentageCopyWith<$Res>
    implements $PromotionalCostPercentageCopyWith<$Res> {
  factory _$PromotionalCostPercentageCopyWith(_PromotionalCostPercentage value,
          $Res Function(_PromotionalCostPercentage) _then) =
      __$PromotionalCostPercentageCopyWithImpl;
  @override
  @useResult
  $Res call({int? discount, int? campaign, int? coupon});
}

/// @nodoc
class __$PromotionalCostPercentageCopyWithImpl<$Res>
    implements _$PromotionalCostPercentageCopyWith<$Res> {
  __$PromotionalCostPercentageCopyWithImpl(this._self, this._then);

  final _PromotionalCostPercentage _self;
  final $Res Function(_PromotionalCostPercentage) _then;

  /// Create a copy of PromotionalCostPercentage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? discount = freezed,
    Object? campaign = freezed,
    Object? coupon = freezed,
  }) {
    return _then(_PromotionalCostPercentage(
      discount: freezed == discount
          ? _self.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int?,
      campaign: freezed == campaign
          ? _self.campaign
          : campaign // ignore: cast_nullable_to_non_nullable
              as int?,
      coupon: freezed == coupon
          ? _self.coupon
          : coupon // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$SubscriptionInfo {
  @JsonKey(name: 'total_subscription')
  int? get totalSubscription;
  String? get status;
  @JsonKey(name: 'subscribed_package_details')
  dynamic get subscribedPackageDetails;
  @JsonKey(name: 'renewal_package_details')
  dynamic get renewalPackageDetails;
  @JsonKey(name: 'applicable_vat')
  int? get applicableVat;

  /// Create a copy of SubscriptionInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubscriptionInfoCopyWith<SubscriptionInfo> get copyWith =>
      _$SubscriptionInfoCopyWithImpl<SubscriptionInfo>(
          this as SubscriptionInfo, _$identity);

  /// Serializes this SubscriptionInfo to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubscriptionInfo &&
            (identical(other.totalSubscription, totalSubscription) ||
                other.totalSubscription == totalSubscription) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
                other.subscribedPackageDetails, subscribedPackageDetails) &&
            const DeepCollectionEquality()
                .equals(other.renewalPackageDetails, renewalPackageDetails) &&
            (identical(other.applicableVat, applicableVat) ||
                other.applicableVat == applicableVat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalSubscription,
      status,
      const DeepCollectionEquality().hash(subscribedPackageDetails),
      const DeepCollectionEquality().hash(renewalPackageDetails),
      applicableVat);

  @override
  String toString() {
    return 'SubscriptionInfo(totalSubscription: $totalSubscription, status: $status, subscribedPackageDetails: $subscribedPackageDetails, renewalPackageDetails: $renewalPackageDetails, applicableVat: $applicableVat)';
  }
}

/// @nodoc
abstract mixin class $SubscriptionInfoCopyWith<$Res> {
  factory $SubscriptionInfoCopyWith(
          SubscriptionInfo value, $Res Function(SubscriptionInfo) _then) =
      _$SubscriptionInfoCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_subscription') int? totalSubscription,
      String? status,
      @JsonKey(name: 'subscribed_package_details')
      dynamic subscribedPackageDetails,
      @JsonKey(name: 'renewal_package_details') dynamic renewalPackageDetails,
      @JsonKey(name: 'applicable_vat') int? applicableVat});
}

/// @nodoc
class _$SubscriptionInfoCopyWithImpl<$Res>
    implements $SubscriptionInfoCopyWith<$Res> {
  _$SubscriptionInfoCopyWithImpl(this._self, this._then);

  final SubscriptionInfo _self;
  final $Res Function(SubscriptionInfo) _then;

  /// Create a copy of SubscriptionInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalSubscription = freezed,
    Object? status = freezed,
    Object? subscribedPackageDetails = freezed,
    Object? renewalPackageDetails = freezed,
    Object? applicableVat = freezed,
  }) {
    return _then(_self.copyWith(
      totalSubscription: freezed == totalSubscription
          ? _self.totalSubscription
          : totalSubscription // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      subscribedPackageDetails: freezed == subscribedPackageDetails
          ? _self.subscribedPackageDetails
          : subscribedPackageDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      renewalPackageDetails: freezed == renewalPackageDetails
          ? _self.renewalPackageDetails
          : renewalPackageDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      applicableVat: freezed == applicableVat
          ? _self.applicableVat
          : applicableVat // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SubscriptionInfo implements SubscriptionInfo {
  const _SubscriptionInfo(
      {@JsonKey(name: 'total_subscription') this.totalSubscription,
      this.status,
      @JsonKey(name: 'subscribed_package_details')
      this.subscribedPackageDetails,
      @JsonKey(name: 'renewal_package_details') this.renewalPackageDetails,
      @JsonKey(name: 'applicable_vat') this.applicableVat});
  factory _SubscriptionInfo.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionInfoFromJson(json);

  @override
  @JsonKey(name: 'total_subscription')
  final int? totalSubscription;
  @override
  final String? status;
  @override
  @JsonKey(name: 'subscribed_package_details')
  final dynamic subscribedPackageDetails;
  @override
  @JsonKey(name: 'renewal_package_details')
  final dynamic renewalPackageDetails;
  @override
  @JsonKey(name: 'applicable_vat')
  final int? applicableVat;

  /// Create a copy of SubscriptionInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubscriptionInfoCopyWith<_SubscriptionInfo> get copyWith =>
      __$SubscriptionInfoCopyWithImpl<_SubscriptionInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubscriptionInfoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscriptionInfo &&
            (identical(other.totalSubscription, totalSubscription) ||
                other.totalSubscription == totalSubscription) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(
                other.subscribedPackageDetails, subscribedPackageDetails) &&
            const DeepCollectionEquality()
                .equals(other.renewalPackageDetails, renewalPackageDetails) &&
            (identical(other.applicableVat, applicableVat) ||
                other.applicableVat == applicableVat));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalSubscription,
      status,
      const DeepCollectionEquality().hash(subscribedPackageDetails),
      const DeepCollectionEquality().hash(renewalPackageDetails),
      applicableVat);

  @override
  String toString() {
    return 'SubscriptionInfo(totalSubscription: $totalSubscription, status: $status, subscribedPackageDetails: $subscribedPackageDetails, renewalPackageDetails: $renewalPackageDetails, applicableVat: $applicableVat)';
  }
}

/// @nodoc
abstract mixin class _$SubscriptionInfoCopyWith<$Res>
    implements $SubscriptionInfoCopyWith<$Res> {
  factory _$SubscriptionInfoCopyWith(
          _SubscriptionInfo value, $Res Function(_SubscriptionInfo) _then) =
      __$SubscriptionInfoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_subscription') int? totalSubscription,
      String? status,
      @JsonKey(name: 'subscribed_package_details')
      dynamic subscribedPackageDetails,
      @JsonKey(name: 'renewal_package_details') dynamic renewalPackageDetails,
      @JsonKey(name: 'applicable_vat') int? applicableVat});
}

/// @nodoc
class __$SubscriptionInfoCopyWithImpl<$Res>
    implements _$SubscriptionInfoCopyWith<$Res> {
  __$SubscriptionInfoCopyWithImpl(this._self, this._then);

  final _SubscriptionInfo _self;
  final $Res Function(_SubscriptionInfo) _then;

  /// Create a copy of SubscriptionInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalSubscription = freezed,
    Object? status = freezed,
    Object? subscribedPackageDetails = freezed,
    Object? renewalPackageDetails = freezed,
    Object? applicableVat = freezed,
  }) {
    return _then(_SubscriptionInfo(
      totalSubscription: freezed == totalSubscription
          ? _self.totalSubscription
          : totalSubscription // ignore: cast_nullable_to_non_nullable
              as int?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      subscribedPackageDetails: freezed == subscribedPackageDetails
          ? _self.subscribedPackageDetails
          : subscribedPackageDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      renewalPackageDetails: freezed == renewalPackageDetails
          ? _self.renewalPackageDetails
          : renewalPackageDetails // ignore: cast_nullable_to_non_nullable
              as dynamic,
      applicableVat: freezed == applicableVat
          ? _self.applicableVat
          : applicableVat // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
