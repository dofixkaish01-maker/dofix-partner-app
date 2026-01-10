// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReviewResponse {
  @JsonKey(name: 'response_code')
  String get responseCode;
  String get message;
  ReviewContent? get content;

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewResponseCopyWith<ReviewResponse> get copyWith =>
      _$ReviewResponseCopyWithImpl<ReviewResponse>(
          this as ReviewResponse, _$identity);

  /// Serializes this ReviewResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewResponse &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, responseCode, message, content);

  @override
  String toString() {
    return 'ReviewResponse(responseCode: $responseCode, message: $message, content: $content)';
  }
}

/// @nodoc
abstract mixin class $ReviewResponseCopyWith<$Res> {
  factory $ReviewResponseCopyWith(
          ReviewResponse value, $Res Function(ReviewResponse) _then) =
      _$ReviewResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'response_code') String responseCode,
      String message,
      ReviewContent? content});

  $ReviewContentCopyWith<$Res>? get content;
}

/// @nodoc
class _$ReviewResponseCopyWithImpl<$Res>
    implements $ReviewResponseCopyWith<$Res> {
  _$ReviewResponseCopyWithImpl(this._self, this._then);

  final ReviewResponse _self;
  final $Res Function(ReviewResponse) _then;

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseCode = null,
    Object? message = null,
    Object? content = freezed,
  }) {
    return _then(_self.copyWith(
      responseCode: null == responseCode
          ? _self.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as ReviewContent?,
    ));
  }

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewContentCopyWith<$Res>? get content {
    if (_self.content == null) {
      return null;
    }

    return $ReviewContentCopyWith<$Res>(_self.content!, (value) {
      return _then(_self.copyWith(content: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewResponse implements ReviewResponse {
  const _ReviewResponse(
      {@JsonKey(name: 'response_code') required this.responseCode,
      required this.message,
      this.content});
  factory _ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);

  @override
  @JsonKey(name: 'response_code')
  final String responseCode;
  @override
  final String message;
  @override
  final ReviewContent? content;

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewResponseCopyWith<_ReviewResponse> get copyWith =>
      __$ReviewResponseCopyWithImpl<_ReviewResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewResponse &&
            (identical(other.responseCode, responseCode) ||
                other.responseCode == responseCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, responseCode, message, content);

  @override
  String toString() {
    return 'ReviewResponse(responseCode: $responseCode, message: $message, content: $content)';
  }
}

/// @nodoc
abstract mixin class _$ReviewResponseCopyWith<$Res>
    implements $ReviewResponseCopyWith<$Res> {
  factory _$ReviewResponseCopyWith(
          _ReviewResponse value, $Res Function(_ReviewResponse) _then) =
      __$ReviewResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'response_code') String responseCode,
      String message,
      ReviewContent? content});

  @override
  $ReviewContentCopyWith<$Res>? get content;
}

/// @nodoc
class __$ReviewResponseCopyWithImpl<$Res>
    implements _$ReviewResponseCopyWith<$Res> {
  __$ReviewResponseCopyWithImpl(this._self, this._then);

  final _ReviewResponse _self;
  final $Res Function(_ReviewResponse) _then;

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? responseCode = null,
    Object? message = null,
    Object? content = freezed,
  }) {
    return _then(_ReviewResponse(
      responseCode: null == responseCode
          ? _self.responseCode
          : responseCode // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      content: freezed == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as ReviewContent?,
    ));
  }

  /// Create a copy of ReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewContentCopyWith<$Res>? get content {
    if (_self.content == null) {
      return null;
    }

    return $ReviewContentCopyWith<$Res>(_self.content!, (value) {
      return _then(_self.copyWith(content: value));
    });
  }
}

/// @nodoc
mixin _$ReviewContent {
  ReviewPagination get reviews;

  /// Create a copy of ReviewContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewContentCopyWith<ReviewContent> get copyWith =>
      _$ReviewContentCopyWithImpl<ReviewContent>(
          this as ReviewContent, _$identity);

  /// Serializes this ReviewContent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewContent &&
            (identical(other.reviews, reviews) || other.reviews == reviews));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reviews);

  @override
  String toString() {
    return 'ReviewContent(reviews: $reviews)';
  }
}

/// @nodoc
abstract mixin class $ReviewContentCopyWith<$Res> {
  factory $ReviewContentCopyWith(
          ReviewContent value, $Res Function(ReviewContent) _then) =
      _$ReviewContentCopyWithImpl;
  @useResult
  $Res call({ReviewPagination reviews});

  $ReviewPaginationCopyWith<$Res> get reviews;
}

/// @nodoc
class _$ReviewContentCopyWithImpl<$Res>
    implements $ReviewContentCopyWith<$Res> {
  _$ReviewContentCopyWithImpl(this._self, this._then);

  final ReviewContent _self;
  final $Res Function(ReviewContent) _then;

  /// Create a copy of ReviewContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviews = null,
  }) {
    return _then(_self.copyWith(
      reviews: null == reviews
          ? _self.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as ReviewPagination,
    ));
  }

  /// Create a copy of ReviewContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewPaginationCopyWith<$Res> get reviews {
    return $ReviewPaginationCopyWith<$Res>(_self.reviews, (value) {
      return _then(_self.copyWith(reviews: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewContent implements ReviewContent {
  const _ReviewContent({required this.reviews});
  factory _ReviewContent.fromJson(Map<String, dynamic> json) =>
      _$ReviewContentFromJson(json);

  @override
  final ReviewPagination reviews;

  /// Create a copy of ReviewContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewContentCopyWith<_ReviewContent> get copyWith =>
      __$ReviewContentCopyWithImpl<_ReviewContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewContentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewContent &&
            (identical(other.reviews, reviews) || other.reviews == reviews));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, reviews);

  @override
  String toString() {
    return 'ReviewContent(reviews: $reviews)';
  }
}

/// @nodoc
abstract mixin class _$ReviewContentCopyWith<$Res>
    implements $ReviewContentCopyWith<$Res> {
  factory _$ReviewContentCopyWith(
          _ReviewContent value, $Res Function(_ReviewContent) _then) =
      __$ReviewContentCopyWithImpl;
  @override
  @useResult
  $Res call({ReviewPagination reviews});

  @override
  $ReviewPaginationCopyWith<$Res> get reviews;
}

/// @nodoc
class __$ReviewContentCopyWithImpl<$Res>
    implements _$ReviewContentCopyWith<$Res> {
  __$ReviewContentCopyWithImpl(this._self, this._then);

  final _ReviewContent _self;
  final $Res Function(_ReviewContent) _then;

  /// Create a copy of ReviewContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? reviews = null,
  }) {
    return _then(_ReviewContent(
      reviews: null == reviews
          ? _self.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as ReviewPagination,
    ));
  }

  /// Create a copy of ReviewContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewPaginationCopyWith<$Res> get reviews {
    return $ReviewPaginationCopyWith<$Res>(_self.reviews, (value) {
      return _then(_self.copyWith(reviews: value));
    });
  }
}

/// @nodoc
mixin _$ReviewPagination {
  @JsonKey(name: 'current_page')
  int get currentPage;
  List<ReviewData> get data;

  /// Create a copy of ReviewPagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewPaginationCopyWith<ReviewPagination> get copyWith =>
      _$ReviewPaginationCopyWithImpl<ReviewPagination>(
          this as ReviewPagination, _$identity);

  /// Serializes this ReviewPagination to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewPagination &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentPage, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'ReviewPagination(currentPage: $currentPage, data: $data)';
  }
}

/// @nodoc
abstract mixin class $ReviewPaginationCopyWith<$Res> {
  factory $ReviewPaginationCopyWith(
          ReviewPagination value, $Res Function(ReviewPagination) _then) =
      _$ReviewPaginationCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage, List<ReviewData> data});
}

/// @nodoc
class _$ReviewPaginationCopyWithImpl<$Res>
    implements $ReviewPaginationCopyWith<$Res> {
  _$ReviewPaginationCopyWithImpl(this._self, this._then);

  final ReviewPagination _self;
  final $Res Function(ReviewPagination) _then;

  /// Create a copy of ReviewPagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? data = null,
  }) {
    return _then(_self.copyWith(
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ReviewData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewPagination implements ReviewPagination {
  const _ReviewPagination(
      {@JsonKey(name: 'current_page') required this.currentPage,
      required final List<ReviewData> data})
      : _data = data;
  factory _ReviewPagination.fromJson(Map<String, dynamic> json) =>
      _$ReviewPaginationFromJson(json);

  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  final List<ReviewData> _data;
  @override
  List<ReviewData> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Create a copy of ReviewPagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewPaginationCopyWith<_ReviewPagination> get copyWith =>
      __$ReviewPaginationCopyWithImpl<_ReviewPagination>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewPaginationToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewPagination &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, currentPage, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'ReviewPagination(currentPage: $currentPage, data: $data)';
  }
}

/// @nodoc
abstract mixin class _$ReviewPaginationCopyWith<$Res>
    implements $ReviewPaginationCopyWith<$Res> {
  factory _$ReviewPaginationCopyWith(
          _ReviewPagination value, $Res Function(_ReviewPagination) _then) =
      __$ReviewPaginationCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage, List<ReviewData> data});
}

/// @nodoc
class __$ReviewPaginationCopyWithImpl<$Res>
    implements _$ReviewPaginationCopyWith<$Res> {
  __$ReviewPaginationCopyWithImpl(this._self, this._then);

  final _ReviewPagination _self;
  final $Res Function(_ReviewPagination) _then;

  /// Create a copy of ReviewPagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currentPage = null,
    Object? data = null,
  }) {
    return _then(_ReviewPagination(
      currentPage: null == currentPage
          ? _self.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ReviewData>,
    ));
  }
}

/// @nodoc
mixin _$ReviewData {
  String get id;
  @JsonKey(name: 'readable_id')
  int get readableId;
  @JsonKey(name: 'booking_id')
  String get bookingId;
  @JsonKey(name: 'service_id')
  String get serviceId;
  @JsonKey(name: 'provider_id')
  String get providerId;
  @JsonKey(name: 'review_rating')
  int get reviewRating;
  @JsonKey(name: 'review_comment')
  String get reviewComment;
  @JsonKey(name: 'review_images')
  List<dynamic> get reviewImages;
  @JsonKey(name: 'booking_date')
  String get bookingDate;
  @JsonKey(name: 'is_active')
  int get isActive;
  @JsonKey(name: 'created_at')
  String get createdAt;
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @JsonKey(name: 'customer_id')
  String get customerId;
  Booking? get booking;
  Provider? get provider;
  Customer? get customer;
  @JsonKey(name: 'review_reply')
  dynamic get reviewReply;
  dynamic get service;

  /// Create a copy of ReviewData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReviewDataCopyWith<ReviewData> get copyWith =>
      _$ReviewDataCopyWithImpl<ReviewData>(this as ReviewData, _$identity);

  /// Serializes this ReviewData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReviewData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.readableId, readableId) ||
                other.readableId == readableId) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.reviewRating, reviewRating) ||
                other.reviewRating == reviewRating) &&
            (identical(other.reviewComment, reviewComment) ||
                other.reviewComment == reviewComment) &&
            const DeepCollectionEquality()
                .equals(other.reviewImages, reviewImages) &&
            (identical(other.bookingDate, bookingDate) ||
                other.bookingDate == bookingDate) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.booking, booking) || other.booking == booking) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            const DeepCollectionEquality()
                .equals(other.reviewReply, reviewReply) &&
            const DeepCollectionEquality().equals(other.service, service));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      readableId,
      bookingId,
      serviceId,
      providerId,
      reviewRating,
      reviewComment,
      const DeepCollectionEquality().hash(reviewImages),
      bookingDate,
      isActive,
      createdAt,
      updatedAt,
      customerId,
      booking,
      provider,
      customer,
      const DeepCollectionEquality().hash(reviewReply),
      const DeepCollectionEquality().hash(service));

  @override
  String toString() {
    return 'ReviewData(id: $id, readableId: $readableId, bookingId: $bookingId, serviceId: $serviceId, providerId: $providerId, reviewRating: $reviewRating, reviewComment: $reviewComment, reviewImages: $reviewImages, bookingDate: $bookingDate, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, customerId: $customerId, booking: $booking, provider: $provider, customer: $customer, reviewReply: $reviewReply, service: $service)';
  }
}

/// @nodoc
abstract mixin class $ReviewDataCopyWith<$Res> {
  factory $ReviewDataCopyWith(
          ReviewData value, $Res Function(ReviewData) _then) =
      _$ReviewDataCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'readable_id') int readableId,
      @JsonKey(name: 'booking_id') String bookingId,
      @JsonKey(name: 'service_id') String serviceId,
      @JsonKey(name: 'provider_id') String providerId,
      @JsonKey(name: 'review_rating') int reviewRating,
      @JsonKey(name: 'review_comment') String reviewComment,
      @JsonKey(name: 'review_images') List<dynamic> reviewImages,
      @JsonKey(name: 'booking_date') String bookingDate,
      @JsonKey(name: 'is_active') int isActive,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'customer_id') String customerId,
      Booking? booking,
      Provider? provider,
      Customer? customer,
      @JsonKey(name: 'review_reply') dynamic reviewReply,
      dynamic service});

  $BookingCopyWith<$Res>? get booking;
  $ProviderCopyWith<$Res>? get provider;
  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class _$ReviewDataCopyWithImpl<$Res> implements $ReviewDataCopyWith<$Res> {
  _$ReviewDataCopyWithImpl(this._self, this._then);

  final ReviewData _self;
  final $Res Function(ReviewData) _then;

  /// Create a copy of ReviewData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? readableId = null,
    Object? bookingId = null,
    Object? serviceId = null,
    Object? providerId = null,
    Object? reviewRating = null,
    Object? reviewComment = null,
    Object? reviewImages = null,
    Object? bookingDate = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? customerId = null,
    Object? booking = freezed,
    Object? provider = freezed,
    Object? customer = freezed,
    Object? reviewReply = freezed,
    Object? service = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      readableId: null == readableId
          ? _self.readableId
          : readableId // ignore: cast_nullable_to_non_nullable
              as int,
      bookingId: null == bookingId
          ? _self.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceId: null == serviceId
          ? _self.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      providerId: null == providerId
          ? _self.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewRating: null == reviewRating
          ? _self.reviewRating
          : reviewRating // ignore: cast_nullable_to_non_nullable
              as int,
      reviewComment: null == reviewComment
          ? _self.reviewComment
          : reviewComment // ignore: cast_nullable_to_non_nullable
              as String,
      reviewImages: null == reviewImages
          ? _self.reviewImages
          : reviewImages // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      bookingDate: null == bookingDate
          ? _self.bookingDate
          : bookingDate // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      booking: freezed == booking
          ? _self.booking
          : booking // ignore: cast_nullable_to_non_nullable
              as Booking?,
      provider: freezed == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider?,
      customer: freezed == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      reviewReply: freezed == reviewReply
          ? _self.reviewReply
          : reviewReply // ignore: cast_nullable_to_non_nullable
              as dynamic,
      service: freezed == service
          ? _self.service
          : service // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  /// Create a copy of ReviewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookingCopyWith<$Res>? get booking {
    if (_self.booking == null) {
      return null;
    }

    return $BookingCopyWith<$Res>(_self.booking!, (value) {
      return _then(_self.copyWith(booking: value));
    });
  }

  /// Create a copy of ReviewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProviderCopyWith<$Res>? get provider {
    if (_self.provider == null) {
      return null;
    }

    return $ProviderCopyWith<$Res>(_self.provider!, (value) {
      return _then(_self.copyWith(provider: value));
    });
  }

  /// Create a copy of ReviewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res>? get customer {
    if (_self.customer == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_self.customer!, (value) {
      return _then(_self.copyWith(customer: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ReviewData implements ReviewData {
  const _ReviewData(
      {required this.id,
      @JsonKey(name: 'readable_id') required this.readableId,
      @JsonKey(name: 'booking_id') required this.bookingId,
      @JsonKey(name: 'service_id') required this.serviceId,
      @JsonKey(name: 'provider_id') required this.providerId,
      @JsonKey(name: 'review_rating') required this.reviewRating,
      @JsonKey(name: 'review_comment') required this.reviewComment,
      @JsonKey(name: 'review_images') required final List<dynamic> reviewImages,
      @JsonKey(name: 'booking_date') required this.bookingDate,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'customer_id') required this.customerId,
      this.booking,
      this.provider,
      this.customer,
      @JsonKey(name: 'review_reply') this.reviewReply,
      this.service})
      : _reviewImages = reviewImages;
  factory _ReviewData.fromJson(Map<String, dynamic> json) =>
      _$ReviewDataFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'readable_id')
  final int readableId;
  @override
  @JsonKey(name: 'booking_id')
  final String bookingId;
  @override
  @JsonKey(name: 'service_id')
  final String serviceId;
  @override
  @JsonKey(name: 'provider_id')
  final String providerId;
  @override
  @JsonKey(name: 'review_rating')
  final int reviewRating;
  @override
  @JsonKey(name: 'review_comment')
  final String reviewComment;
  final List<dynamic> _reviewImages;
  @override
  @JsonKey(name: 'review_images')
  List<dynamic> get reviewImages {
    if (_reviewImages is EqualUnmodifiableListView) return _reviewImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviewImages);
  }

  @override
  @JsonKey(name: 'booking_date')
  final String bookingDate;
  @override
  @JsonKey(name: 'is_active')
  final int isActive;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  final Booking? booking;
  @override
  final Provider? provider;
  @override
  final Customer? customer;
  @override
  @JsonKey(name: 'review_reply')
  final dynamic reviewReply;
  @override
  final dynamic service;

  /// Create a copy of ReviewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReviewDataCopyWith<_ReviewData> get copyWith =>
      __$ReviewDataCopyWithImpl<_ReviewData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReviewDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReviewData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.readableId, readableId) ||
                other.readableId == readableId) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.reviewRating, reviewRating) ||
                other.reviewRating == reviewRating) &&
            (identical(other.reviewComment, reviewComment) ||
                other.reviewComment == reviewComment) &&
            const DeepCollectionEquality()
                .equals(other._reviewImages, _reviewImages) &&
            (identical(other.bookingDate, bookingDate) ||
                other.bookingDate == bookingDate) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.booking, booking) || other.booking == booking) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            const DeepCollectionEquality()
                .equals(other.reviewReply, reviewReply) &&
            const DeepCollectionEquality().equals(other.service, service));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      readableId,
      bookingId,
      serviceId,
      providerId,
      reviewRating,
      reviewComment,
      const DeepCollectionEquality().hash(_reviewImages),
      bookingDate,
      isActive,
      createdAt,
      updatedAt,
      customerId,
      booking,
      provider,
      customer,
      const DeepCollectionEquality().hash(reviewReply),
      const DeepCollectionEquality().hash(service));

  @override
  String toString() {
    return 'ReviewData(id: $id, readableId: $readableId, bookingId: $bookingId, serviceId: $serviceId, providerId: $providerId, reviewRating: $reviewRating, reviewComment: $reviewComment, reviewImages: $reviewImages, bookingDate: $bookingDate, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt, customerId: $customerId, booking: $booking, provider: $provider, customer: $customer, reviewReply: $reviewReply, service: $service)';
  }
}

/// @nodoc
abstract mixin class _$ReviewDataCopyWith<$Res>
    implements $ReviewDataCopyWith<$Res> {
  factory _$ReviewDataCopyWith(
          _ReviewData value, $Res Function(_ReviewData) _then) =
      __$ReviewDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'readable_id') int readableId,
      @JsonKey(name: 'booking_id') String bookingId,
      @JsonKey(name: 'service_id') String serviceId,
      @JsonKey(name: 'provider_id') String providerId,
      @JsonKey(name: 'review_rating') int reviewRating,
      @JsonKey(name: 'review_comment') String reviewComment,
      @JsonKey(name: 'review_images') List<dynamic> reviewImages,
      @JsonKey(name: 'booking_date') String bookingDate,
      @JsonKey(name: 'is_active') int isActive,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'customer_id') String customerId,
      Booking? booking,
      Provider? provider,
      Customer? customer,
      @JsonKey(name: 'review_reply') dynamic reviewReply,
      dynamic service});

  @override
  $BookingCopyWith<$Res>? get booking;
  @override
  $ProviderCopyWith<$Res>? get provider;
  @override
  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class __$ReviewDataCopyWithImpl<$Res> implements _$ReviewDataCopyWith<$Res> {
  __$ReviewDataCopyWithImpl(this._self, this._then);

  final _ReviewData _self;
  final $Res Function(_ReviewData) _then;

  /// Create a copy of ReviewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? readableId = null,
    Object? bookingId = null,
    Object? serviceId = null,
    Object? providerId = null,
    Object? reviewRating = null,
    Object? reviewComment = null,
    Object? reviewImages = null,
    Object? bookingDate = null,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? customerId = null,
    Object? booking = freezed,
    Object? provider = freezed,
    Object? customer = freezed,
    Object? reviewReply = freezed,
    Object? service = freezed,
  }) {
    return _then(_ReviewData(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      readableId: null == readableId
          ? _self.readableId
          : readableId // ignore: cast_nullable_to_non_nullable
              as int,
      bookingId: null == bookingId
          ? _self.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceId: null == serviceId
          ? _self.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      providerId: null == providerId
          ? _self.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      reviewRating: null == reviewRating
          ? _self.reviewRating
          : reviewRating // ignore: cast_nullable_to_non_nullable
              as int,
      reviewComment: null == reviewComment
          ? _self.reviewComment
          : reviewComment // ignore: cast_nullable_to_non_nullable
              as String,
      reviewImages: null == reviewImages
          ? _self._reviewImages
          : reviewImages // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      bookingDate: null == bookingDate
          ? _self.bookingDate
          : bookingDate // ignore: cast_nullable_to_non_nullable
              as String,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      booking: freezed == booking
          ? _self.booking
          : booking // ignore: cast_nullable_to_non_nullable
              as Booking?,
      provider: freezed == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as Provider?,
      customer: freezed == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      reviewReply: freezed == reviewReply
          ? _self.reviewReply
          : reviewReply // ignore: cast_nullable_to_non_nullable
              as dynamic,
      service: freezed == service
          ? _self.service
          : service // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  /// Create a copy of ReviewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookingCopyWith<$Res>? get booking {
    if (_self.booking == null) {
      return null;
    }

    return $BookingCopyWith<$Res>(_self.booking!, (value) {
      return _then(_self.copyWith(booking: value));
    });
  }

  /// Create a copy of ReviewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProviderCopyWith<$Res>? get provider {
    if (_self.provider == null) {
      return null;
    }

    return $ProviderCopyWith<$Res>(_self.provider!, (value) {
      return _then(_self.copyWith(provider: value));
    });
  }

  /// Create a copy of ReviewData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res>? get customer {
    if (_self.customer == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_self.customer!, (value) {
      return _then(_self.copyWith(customer: value));
    });
  }
}

/// @nodoc
mixin _$Booking {
  String get id;
  @JsonKey(name: 'readable_id')
  int get readableId;
  @JsonKey(name: 'customer_id')
  String get customerId;
  @JsonKey(name: 'provider_id')
  String get providerId;
  @JsonKey(name: 'zone_id')
  String get zoneId;
  @JsonKey(name: 'booking_status')
  String get bookingStatus;
  @JsonKey(name: 'is_paid')
  int get isPaid;
  @JsonKey(name: 'payment_method')
  String get paymentMethod;
  @JsonKey(name: 'transaction_id')
  String get transactionId;
  @JsonKey(name: 'total_booking_amount')
  num get totalBookingAmount;
  @JsonKey(name: 'total_tax_amount')
  num get totalTaxAmount;
  @JsonKey(name: 'total_discount_amount')
  num get totalDiscountAmount;
  @JsonKey(name: 'service_schedule')
  String get serviceSchedule;
  @JsonKey(name: 'service_address_id')
  String get serviceAddressId;
  @JsonKey(name: 'created_at')
  String get createdAt;
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @JsonKey(name: 'category_id')
  String get categoryId;
  @JsonKey(name: 'sub_category_id')
  String get subCategoryId;
  @JsonKey(name: 'serviceman_id')
  String? get servicemanId;
  @JsonKey(name: 'total_campaign_discount_amount')
  num get totalCampaignDiscountAmount;
  @JsonKey(name: 'total_coupon_discount_amount')
  num get totalCouponDiscountAmount;
  @JsonKey(name: 'coupon_code')
  String? get couponCode;
  @JsonKey(name: 'is_checked')
  int get isChecked;
  @JsonKey(name: 'service_preference')
  int get servicePreference;
  @JsonKey(name: 'additional_charge')
  num get additionalCharge;
  @JsonKey(name: 'additional_tax_amount')
  num get additionalTaxAmount;
  @JsonKey(name: 'additional_discount_amount')
  num get additionalDiscountAmount;
  @JsonKey(name: 'additional_campaign_discount_amount')
  num get additionalCampaignDiscountAmount;
  @JsonKey(name: 'removed_coupon_amount')
  String get removedCouponAmount;
  @JsonKey(name: 'reach_image')
  String? get reachImage;
  @JsonKey(name: 'evidence_photos')
  dynamic get evidencePhotos;
  @JsonKey(name: 'booking_otp')
  String get bookingOtp;
  @JsonKey(name: 'is_guest')
  int get isGuest;
  @JsonKey(name: 'is_verified')
  int get isVerified;
  @JsonKey(name: 'extra_fee')
  num get extraFee;
  @JsonKey(name: 'total_referral_discount_amount')
  num get totalReferralDiscountAmount;
  @JsonKey(name: 'is_repeated')
  int get isRepeated;
  @JsonKey(name: 'assigned_by')
  dynamic get assignedBy;
  @JsonKey(name: 'evidence_photos_full_path')
  List<dynamic> get evidencePhotosFullPath;
  List<BookingDetail> get detail;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookingCopyWith<Booking> get copyWith =>
      _$BookingCopyWithImpl<Booking>(this as Booking, _$identity);

  /// Serializes this Booking to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Booking &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.readableId, readableId) ||
                other.readableId == readableId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.zoneId, zoneId) || other.zoneId == zoneId) &&
            (identical(other.bookingStatus, bookingStatus) ||
                other.bookingStatus == bookingStatus) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.totalBookingAmount, totalBookingAmount) ||
                other.totalBookingAmount == totalBookingAmount) &&
            (identical(other.totalTaxAmount, totalTaxAmount) ||
                other.totalTaxAmount == totalTaxAmount) &&
            (identical(other.totalDiscountAmount, totalDiscountAmount) ||
                other.totalDiscountAmount == totalDiscountAmount) &&
            (identical(other.serviceSchedule, serviceSchedule) ||
                other.serviceSchedule == serviceSchedule) &&
            (identical(other.serviceAddressId, serviceAddressId) ||
                other.serviceAddressId == serviceAddressId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.subCategoryId, subCategoryId) ||
                other.subCategoryId == subCategoryId) &&
            (identical(other.servicemanId, servicemanId) ||
                other.servicemanId == servicemanId) &&
            (identical(other.totalCampaignDiscountAmount, totalCampaignDiscountAmount) ||
                other.totalCampaignDiscountAmount ==
                    totalCampaignDiscountAmount) &&
            (identical(other.totalCouponDiscountAmount, totalCouponDiscountAmount) ||
                other.totalCouponDiscountAmount == totalCouponDiscountAmount) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.servicePreference, servicePreference) ||
                other.servicePreference == servicePreference) &&
            (identical(other.additionalCharge, additionalCharge) ||
                other.additionalCharge == additionalCharge) &&
            (identical(other.additionalTaxAmount, additionalTaxAmount) ||
                other.additionalTaxAmount == additionalTaxAmount) &&
            (identical(other.additionalDiscountAmount, additionalDiscountAmount) ||
                other.additionalDiscountAmount == additionalDiscountAmount) &&
            (identical(other.additionalCampaignDiscountAmount, additionalCampaignDiscountAmount) ||
                other.additionalCampaignDiscountAmount ==
                    additionalCampaignDiscountAmount) &&
            (identical(other.removedCouponAmount, removedCouponAmount) ||
                other.removedCouponAmount == removedCouponAmount) &&
            (identical(other.reachImage, reachImage) ||
                other.reachImage == reachImage) &&
            const DeepCollectionEquality()
                .equals(other.evidencePhotos, evidencePhotos) &&
            (identical(other.bookingOtp, bookingOtp) ||
                other.bookingOtp == bookingOtp) &&
            (identical(other.isGuest, isGuest) || other.isGuest == isGuest) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.extraFee, extraFee) ||
                other.extraFee == extraFee) &&
            (identical(other.totalReferralDiscountAmount, totalReferralDiscountAmount) ||
                other.totalReferralDiscountAmount ==
                    totalReferralDiscountAmount) &&
            (identical(other.isRepeated, isRepeated) || other.isRepeated == isRepeated) &&
            const DeepCollectionEquality().equals(other.assignedBy, assignedBy) &&
            const DeepCollectionEquality().equals(other.evidencePhotosFullPath, evidencePhotosFullPath) &&
            const DeepCollectionEquality().equals(other.detail, detail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        readableId,
        customerId,
        providerId,
        zoneId,
        bookingStatus,
        isPaid,
        paymentMethod,
        transactionId,
        totalBookingAmount,
        totalTaxAmount,
        totalDiscountAmount,
        serviceSchedule,
        serviceAddressId,
        createdAt,
        updatedAt,
        categoryId,
        subCategoryId,
        servicemanId,
        totalCampaignDiscountAmount,
        totalCouponDiscountAmount,
        couponCode,
        isChecked,
        servicePreference,
        additionalCharge,
        additionalTaxAmount,
        additionalDiscountAmount,
        additionalCampaignDiscountAmount,
        removedCouponAmount,
        reachImage,
        const DeepCollectionEquality().hash(evidencePhotos),
        bookingOtp,
        isGuest,
        isVerified,
        extraFee,
        totalReferralDiscountAmount,
        isRepeated,
        const DeepCollectionEquality().hash(assignedBy),
        const DeepCollectionEquality().hash(evidencePhotosFullPath),
        const DeepCollectionEquality().hash(detail)
      ]);

  @override
  String toString() {
    return 'Booking(id: $id, readableId: $readableId, customerId: $customerId, providerId: $providerId, zoneId: $zoneId, bookingStatus: $bookingStatus, isPaid: $isPaid, paymentMethod: $paymentMethod, transactionId: $transactionId, totalBookingAmount: $totalBookingAmount, totalTaxAmount: $totalTaxAmount, totalDiscountAmount: $totalDiscountAmount, serviceSchedule: $serviceSchedule, serviceAddressId: $serviceAddressId, createdAt: $createdAt, updatedAt: $updatedAt, categoryId: $categoryId, subCategoryId: $subCategoryId, servicemanId: $servicemanId, totalCampaignDiscountAmount: $totalCampaignDiscountAmount, totalCouponDiscountAmount: $totalCouponDiscountAmount, couponCode: $couponCode, isChecked: $isChecked, servicePreference: $servicePreference, additionalCharge: $additionalCharge, additionalTaxAmount: $additionalTaxAmount, additionalDiscountAmount: $additionalDiscountAmount, additionalCampaignDiscountAmount: $additionalCampaignDiscountAmount, removedCouponAmount: $removedCouponAmount, reachImage: $reachImage, evidencePhotos: $evidencePhotos, bookingOtp: $bookingOtp, isGuest: $isGuest, isVerified: $isVerified, extraFee: $extraFee, totalReferralDiscountAmount: $totalReferralDiscountAmount, isRepeated: $isRepeated, assignedBy: $assignedBy, evidencePhotosFullPath: $evidencePhotosFullPath, detail: $detail)';
  }
}

/// @nodoc
abstract mixin class $BookingCopyWith<$Res> {
  factory $BookingCopyWith(Booking value, $Res Function(Booking) _then) =
      _$BookingCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'readable_id') int readableId,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'provider_id') String providerId,
      @JsonKey(name: 'zone_id') String zoneId,
      @JsonKey(name: 'booking_status') String bookingStatus,
      @JsonKey(name: 'is_paid') int isPaid,
      @JsonKey(name: 'payment_method') String paymentMethod,
      @JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'total_booking_amount') num totalBookingAmount,
      @JsonKey(name: 'total_tax_amount') num totalTaxAmount,
      @JsonKey(name: 'total_discount_amount') num totalDiscountAmount,
      @JsonKey(name: 'service_schedule') String serviceSchedule,
      @JsonKey(name: 'service_address_id') String serviceAddressId,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'sub_category_id') String subCategoryId,
      @JsonKey(name: 'serviceman_id') String? servicemanId,
      @JsonKey(name: 'total_campaign_discount_amount')
      num totalCampaignDiscountAmount,
      @JsonKey(name: 'total_coupon_discount_amount')
      num totalCouponDiscountAmount,
      @JsonKey(name: 'coupon_code') String? couponCode,
      @JsonKey(name: 'is_checked') int isChecked,
      @JsonKey(name: 'service_preference') int servicePreference,
      @JsonKey(name: 'additional_charge') num additionalCharge,
      @JsonKey(name: 'additional_tax_amount') num additionalTaxAmount,
      @JsonKey(name: 'additional_discount_amount') num additionalDiscountAmount,
      @JsonKey(name: 'additional_campaign_discount_amount')
      num additionalCampaignDiscountAmount,
      @JsonKey(name: 'removed_coupon_amount') String removedCouponAmount,
      @JsonKey(name: 'reach_image') String? reachImage,
      @JsonKey(name: 'evidence_photos') dynamic evidencePhotos,
      @JsonKey(name: 'booking_otp') String bookingOtp,
      @JsonKey(name: 'is_guest') int isGuest,
      @JsonKey(name: 'is_verified') int isVerified,
      @JsonKey(name: 'extra_fee') num extraFee,
      @JsonKey(name: 'total_referral_discount_amount')
      num totalReferralDiscountAmount,
      @JsonKey(name: 'is_repeated') int isRepeated,
      @JsonKey(name: 'assigned_by') dynamic assignedBy,
      @JsonKey(name: 'evidence_photos_full_path')
      List<dynamic> evidencePhotosFullPath,
      List<BookingDetail> detail});
}

/// @nodoc
class _$BookingCopyWithImpl<$Res> implements $BookingCopyWith<$Res> {
  _$BookingCopyWithImpl(this._self, this._then);

  final Booking _self;
  final $Res Function(Booking) _then;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? readableId = null,
    Object? customerId = null,
    Object? providerId = null,
    Object? zoneId = null,
    Object? bookingStatus = null,
    Object? isPaid = null,
    Object? paymentMethod = null,
    Object? transactionId = null,
    Object? totalBookingAmount = null,
    Object? totalTaxAmount = null,
    Object? totalDiscountAmount = null,
    Object? serviceSchedule = null,
    Object? serviceAddressId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? categoryId = null,
    Object? subCategoryId = null,
    Object? servicemanId = freezed,
    Object? totalCampaignDiscountAmount = null,
    Object? totalCouponDiscountAmount = null,
    Object? couponCode = freezed,
    Object? isChecked = null,
    Object? servicePreference = null,
    Object? additionalCharge = null,
    Object? additionalTaxAmount = null,
    Object? additionalDiscountAmount = null,
    Object? additionalCampaignDiscountAmount = null,
    Object? removedCouponAmount = null,
    Object? reachImage = freezed,
    Object? evidencePhotos = freezed,
    Object? bookingOtp = null,
    Object? isGuest = null,
    Object? isVerified = null,
    Object? extraFee = null,
    Object? totalReferralDiscountAmount = null,
    Object? isRepeated = null,
    Object? assignedBy = freezed,
    Object? evidencePhotosFullPath = null,
    Object? detail = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      readableId: null == readableId
          ? _self.readableId
          : readableId // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      providerId: null == providerId
          ? _self.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      zoneId: null == zoneId
          ? _self.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String,
      bookingStatus: null == bookingStatus
          ? _self.bookingStatus
          : bookingStatus // ignore: cast_nullable_to_non_nullable
              as String,
      isPaid: null == isPaid
          ? _self.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _self.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      totalBookingAmount: null == totalBookingAmount
          ? _self.totalBookingAmount
          : totalBookingAmount // ignore: cast_nullable_to_non_nullable
              as num,
      totalTaxAmount: null == totalTaxAmount
          ? _self.totalTaxAmount
          : totalTaxAmount // ignore: cast_nullable_to_non_nullable
              as num,
      totalDiscountAmount: null == totalDiscountAmount
          ? _self.totalDiscountAmount
          : totalDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
      serviceSchedule: null == serviceSchedule
          ? _self.serviceSchedule
          : serviceSchedule // ignore: cast_nullable_to_non_nullable
              as String,
      serviceAddressId: null == serviceAddressId
          ? _self.serviceAddressId
          : serviceAddressId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      subCategoryId: null == subCategoryId
          ? _self.subCategoryId
          : subCategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      servicemanId: freezed == servicemanId
          ? _self.servicemanId
          : servicemanId // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCampaignDiscountAmount: null == totalCampaignDiscountAmount
          ? _self.totalCampaignDiscountAmount
          : totalCampaignDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
      totalCouponDiscountAmount: null == totalCouponDiscountAmount
          ? _self.totalCouponDiscountAmount
          : totalCouponDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
      couponCode: freezed == couponCode
          ? _self.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isChecked: null == isChecked
          ? _self.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as int,
      servicePreference: null == servicePreference
          ? _self.servicePreference
          : servicePreference // ignore: cast_nullable_to_non_nullable
              as int,
      additionalCharge: null == additionalCharge
          ? _self.additionalCharge
          : additionalCharge // ignore: cast_nullable_to_non_nullable
              as num,
      additionalTaxAmount: null == additionalTaxAmount
          ? _self.additionalTaxAmount
          : additionalTaxAmount // ignore: cast_nullable_to_non_nullable
              as num,
      additionalDiscountAmount: null == additionalDiscountAmount
          ? _self.additionalDiscountAmount
          : additionalDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
      additionalCampaignDiscountAmount: null == additionalCampaignDiscountAmount
          ? _self.additionalCampaignDiscountAmount
          : additionalCampaignDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
      removedCouponAmount: null == removedCouponAmount
          ? _self.removedCouponAmount
          : removedCouponAmount // ignore: cast_nullable_to_non_nullable
              as String,
      reachImage: freezed == reachImage
          ? _self.reachImage
          : reachImage // ignore: cast_nullable_to_non_nullable
              as String?,
      evidencePhotos: freezed == evidencePhotos
          ? _self.evidencePhotos
          : evidencePhotos // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bookingOtp: null == bookingOtp
          ? _self.bookingOtp
          : bookingOtp // ignore: cast_nullable_to_non_nullable
              as String,
      isGuest: null == isGuest
          ? _self.isGuest
          : isGuest // ignore: cast_nullable_to_non_nullable
              as int,
      isVerified: null == isVerified
          ? _self.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as int,
      extraFee: null == extraFee
          ? _self.extraFee
          : extraFee // ignore: cast_nullable_to_non_nullable
              as num,
      totalReferralDiscountAmount: null == totalReferralDiscountAmount
          ? _self.totalReferralDiscountAmount
          : totalReferralDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
      isRepeated: null == isRepeated
          ? _self.isRepeated
          : isRepeated // ignore: cast_nullable_to_non_nullable
              as int,
      assignedBy: freezed == assignedBy
          ? _self.assignedBy
          : assignedBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
      evidencePhotosFullPath: null == evidencePhotosFullPath
          ? _self.evidencePhotosFullPath
          : evidencePhotosFullPath // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      detail: null == detail
          ? _self.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<BookingDetail>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Booking implements Booking {
  const _Booking(
      {required this.id,
      @JsonKey(name: 'readable_id') required this.readableId,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'provider_id') required this.providerId,
      @JsonKey(name: 'zone_id') required this.zoneId,
      @JsonKey(name: 'booking_status') required this.bookingStatus,
      @JsonKey(name: 'is_paid') required this.isPaid,
      @JsonKey(name: 'payment_method') required this.paymentMethod,
      @JsonKey(name: 'transaction_id') required this.transactionId,
      @JsonKey(name: 'total_booking_amount') required this.totalBookingAmount,
      @JsonKey(name: 'total_tax_amount') required this.totalTaxAmount,
      @JsonKey(name: 'total_discount_amount') required this.totalDiscountAmount,
      @JsonKey(name: 'service_schedule') required this.serviceSchedule,
      @JsonKey(name: 'service_address_id') required this.serviceAddressId,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'category_id') required this.categoryId,
      @JsonKey(name: 'sub_category_id') required this.subCategoryId,
      @JsonKey(name: 'serviceman_id') this.servicemanId,
      @JsonKey(name: 'total_campaign_discount_amount')
      required this.totalCampaignDiscountAmount,
      @JsonKey(name: 'total_coupon_discount_amount')
      required this.totalCouponDiscountAmount,
      @JsonKey(name: 'coupon_code') this.couponCode,
      @JsonKey(name: 'is_checked') required this.isChecked,
      @JsonKey(name: 'service_preference') required this.servicePreference,
      @JsonKey(name: 'additional_charge') required this.additionalCharge,
      @JsonKey(name: 'additional_tax_amount') required this.additionalTaxAmount,
      @JsonKey(name: 'additional_discount_amount')
      required this.additionalDiscountAmount,
      @JsonKey(name: 'additional_campaign_discount_amount')
      required this.additionalCampaignDiscountAmount,
      @JsonKey(name: 'removed_coupon_amount') required this.removedCouponAmount,
      @JsonKey(name: 'reach_image') this.reachImage,
      @JsonKey(name: 'evidence_photos') this.evidencePhotos,
      @JsonKey(name: 'booking_otp') required this.bookingOtp,
      @JsonKey(name: 'is_guest') required this.isGuest,
      @JsonKey(name: 'is_verified') required this.isVerified,
      @JsonKey(name: 'extra_fee') required this.extraFee,
      @JsonKey(name: 'total_referral_discount_amount')
      required this.totalReferralDiscountAmount,
      @JsonKey(name: 'is_repeated') required this.isRepeated,
      @JsonKey(name: 'assigned_by') this.assignedBy,
      @JsonKey(name: 'evidence_photos_full_path')
      required final List<dynamic> evidencePhotosFullPath,
      required final List<BookingDetail> detail})
      : _evidencePhotosFullPath = evidencePhotosFullPath,
        _detail = detail;
  factory _Booking.fromJson(Map<String, dynamic> json) =>
      _$BookingFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'readable_id')
  final int readableId;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'provider_id')
  final String providerId;
  @override
  @JsonKey(name: 'zone_id')
  final String zoneId;
  @override
  @JsonKey(name: 'booking_status')
  final String bookingStatus;
  @override
  @JsonKey(name: 'is_paid')
  final int isPaid;
  @override
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @override
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @override
  @JsonKey(name: 'total_booking_amount')
  final num totalBookingAmount;
  @override
  @JsonKey(name: 'total_tax_amount')
  final num totalTaxAmount;
  @override
  @JsonKey(name: 'total_discount_amount')
  final num totalDiscountAmount;
  @override
  @JsonKey(name: 'service_schedule')
  final String serviceSchedule;
  @override
  @JsonKey(name: 'service_address_id')
  final String serviceAddressId;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'category_id')
  final String categoryId;
  @override
  @JsonKey(name: 'sub_category_id')
  final String subCategoryId;
  @override
  @JsonKey(name: 'serviceman_id')
  final String? servicemanId;
  @override
  @JsonKey(name: 'total_campaign_discount_amount')
  final num totalCampaignDiscountAmount;
  @override
  @JsonKey(name: 'total_coupon_discount_amount')
  final num totalCouponDiscountAmount;
  @override
  @JsonKey(name: 'coupon_code')
  final String? couponCode;
  @override
  @JsonKey(name: 'is_checked')
  final int isChecked;
  @override
  @JsonKey(name: 'service_preference')
  final int servicePreference;
  @override
  @JsonKey(name: 'additional_charge')
  final num additionalCharge;
  @override
  @JsonKey(name: 'additional_tax_amount')
  final num additionalTaxAmount;
  @override
  @JsonKey(name: 'additional_discount_amount')
  final num additionalDiscountAmount;
  @override
  @JsonKey(name: 'additional_campaign_discount_amount')
  final num additionalCampaignDiscountAmount;
  @override
  @JsonKey(name: 'removed_coupon_amount')
  final String removedCouponAmount;
  @override
  @JsonKey(name: 'reach_image')
  final String? reachImage;
  @override
  @JsonKey(name: 'evidence_photos')
  final dynamic evidencePhotos;
  @override
  @JsonKey(name: 'booking_otp')
  final String bookingOtp;
  @override
  @JsonKey(name: 'is_guest')
  final int isGuest;
  @override
  @JsonKey(name: 'is_verified')
  final int isVerified;
  @override
  @JsonKey(name: 'extra_fee')
  final num extraFee;
  @override
  @JsonKey(name: 'total_referral_discount_amount')
  final num totalReferralDiscountAmount;
  @override
  @JsonKey(name: 'is_repeated')
  final int isRepeated;
  @override
  @JsonKey(name: 'assigned_by')
  final dynamic assignedBy;
  final List<dynamic> _evidencePhotosFullPath;
  @override
  @JsonKey(name: 'evidence_photos_full_path')
  List<dynamic> get evidencePhotosFullPath {
    if (_evidencePhotosFullPath is EqualUnmodifiableListView)
      return _evidencePhotosFullPath;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evidencePhotosFullPath);
  }

  final List<BookingDetail> _detail;
  @override
  List<BookingDetail> get detail {
    if (_detail is EqualUnmodifiableListView) return _detail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_detail);
  }

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BookingCopyWith<_Booking> get copyWith =>
      __$BookingCopyWithImpl<_Booking>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BookingToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Booking &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.readableId, readableId) ||
                other.readableId == readableId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.providerId, providerId) ||
                other.providerId == providerId) &&
            (identical(other.zoneId, zoneId) || other.zoneId == zoneId) &&
            (identical(other.bookingStatus, bookingStatus) ||
                other.bookingStatus == bookingStatus) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.totalBookingAmount, totalBookingAmount) ||
                other.totalBookingAmount == totalBookingAmount) &&
            (identical(other.totalTaxAmount, totalTaxAmount) ||
                other.totalTaxAmount == totalTaxAmount) &&
            (identical(other.totalDiscountAmount, totalDiscountAmount) ||
                other.totalDiscountAmount == totalDiscountAmount) &&
            (identical(other.serviceSchedule, serviceSchedule) ||
                other.serviceSchedule == serviceSchedule) &&
            (identical(other.serviceAddressId, serviceAddressId) ||
                other.serviceAddressId == serviceAddressId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.subCategoryId, subCategoryId) ||
                other.subCategoryId == subCategoryId) &&
            (identical(other.servicemanId, servicemanId) ||
                other.servicemanId == servicemanId) &&
            (identical(other.totalCampaignDiscountAmount, totalCampaignDiscountAmount) ||
                other.totalCampaignDiscountAmount ==
                    totalCampaignDiscountAmount) &&
            (identical(other.totalCouponDiscountAmount, totalCouponDiscountAmount) ||
                other.totalCouponDiscountAmount == totalCouponDiscountAmount) &&
            (identical(other.couponCode, couponCode) ||
                other.couponCode == couponCode) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked) &&
            (identical(other.servicePreference, servicePreference) ||
                other.servicePreference == servicePreference) &&
            (identical(other.additionalCharge, additionalCharge) ||
                other.additionalCharge == additionalCharge) &&
            (identical(other.additionalTaxAmount, additionalTaxAmount) ||
                other.additionalTaxAmount == additionalTaxAmount) &&
            (identical(other.additionalDiscountAmount, additionalDiscountAmount) ||
                other.additionalDiscountAmount == additionalDiscountAmount) &&
            (identical(other.additionalCampaignDiscountAmount, additionalCampaignDiscountAmount) ||
                other.additionalCampaignDiscountAmount ==
                    additionalCampaignDiscountAmount) &&
            (identical(other.removedCouponAmount, removedCouponAmount) ||
                other.removedCouponAmount == removedCouponAmount) &&
            (identical(other.reachImage, reachImage) ||
                other.reachImage == reachImage) &&
            const DeepCollectionEquality()
                .equals(other.evidencePhotos, evidencePhotos) &&
            (identical(other.bookingOtp, bookingOtp) ||
                other.bookingOtp == bookingOtp) &&
            (identical(other.isGuest, isGuest) || other.isGuest == isGuest) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.extraFee, extraFee) ||
                other.extraFee == extraFee) &&
            (identical(other.totalReferralDiscountAmount, totalReferralDiscountAmount) ||
                other.totalReferralDiscountAmount ==
                    totalReferralDiscountAmount) &&
            (identical(other.isRepeated, isRepeated) || other.isRepeated == isRepeated) &&
            const DeepCollectionEquality().equals(other.assignedBy, assignedBy) &&
            const DeepCollectionEquality().equals(other._evidencePhotosFullPath, _evidencePhotosFullPath) &&
            const DeepCollectionEquality().equals(other._detail, _detail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        readableId,
        customerId,
        providerId,
        zoneId,
        bookingStatus,
        isPaid,
        paymentMethod,
        transactionId,
        totalBookingAmount,
        totalTaxAmount,
        totalDiscountAmount,
        serviceSchedule,
        serviceAddressId,
        createdAt,
        updatedAt,
        categoryId,
        subCategoryId,
        servicemanId,
        totalCampaignDiscountAmount,
        totalCouponDiscountAmount,
        couponCode,
        isChecked,
        servicePreference,
        additionalCharge,
        additionalTaxAmount,
        additionalDiscountAmount,
        additionalCampaignDiscountAmount,
        removedCouponAmount,
        reachImage,
        const DeepCollectionEquality().hash(evidencePhotos),
        bookingOtp,
        isGuest,
        isVerified,
        extraFee,
        totalReferralDiscountAmount,
        isRepeated,
        const DeepCollectionEquality().hash(assignedBy),
        const DeepCollectionEquality().hash(_evidencePhotosFullPath),
        const DeepCollectionEquality().hash(_detail)
      ]);

  @override
  String toString() {
    return 'Booking(id: $id, readableId: $readableId, customerId: $customerId, providerId: $providerId, zoneId: $zoneId, bookingStatus: $bookingStatus, isPaid: $isPaid, paymentMethod: $paymentMethod, transactionId: $transactionId, totalBookingAmount: $totalBookingAmount, totalTaxAmount: $totalTaxAmount, totalDiscountAmount: $totalDiscountAmount, serviceSchedule: $serviceSchedule, serviceAddressId: $serviceAddressId, createdAt: $createdAt, updatedAt: $updatedAt, categoryId: $categoryId, subCategoryId: $subCategoryId, servicemanId: $servicemanId, totalCampaignDiscountAmount: $totalCampaignDiscountAmount, totalCouponDiscountAmount: $totalCouponDiscountAmount, couponCode: $couponCode, isChecked: $isChecked, servicePreference: $servicePreference, additionalCharge: $additionalCharge, additionalTaxAmount: $additionalTaxAmount, additionalDiscountAmount: $additionalDiscountAmount, additionalCampaignDiscountAmount: $additionalCampaignDiscountAmount, removedCouponAmount: $removedCouponAmount, reachImage: $reachImage, evidencePhotos: $evidencePhotos, bookingOtp: $bookingOtp, isGuest: $isGuest, isVerified: $isVerified, extraFee: $extraFee, totalReferralDiscountAmount: $totalReferralDiscountAmount, isRepeated: $isRepeated, assignedBy: $assignedBy, evidencePhotosFullPath: $evidencePhotosFullPath, detail: $detail)';
  }
}

/// @nodoc
abstract mixin class _$BookingCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$BookingCopyWith(_Booking value, $Res Function(_Booking) _then) =
      __$BookingCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'readable_id') int readableId,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'provider_id') String providerId,
      @JsonKey(name: 'zone_id') String zoneId,
      @JsonKey(name: 'booking_status') String bookingStatus,
      @JsonKey(name: 'is_paid') int isPaid,
      @JsonKey(name: 'payment_method') String paymentMethod,
      @JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'total_booking_amount') num totalBookingAmount,
      @JsonKey(name: 'total_tax_amount') num totalTaxAmount,
      @JsonKey(name: 'total_discount_amount') num totalDiscountAmount,
      @JsonKey(name: 'service_schedule') String serviceSchedule,
      @JsonKey(name: 'service_address_id') String serviceAddressId,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'category_id') String categoryId,
      @JsonKey(name: 'sub_category_id') String subCategoryId,
      @JsonKey(name: 'serviceman_id') String? servicemanId,
      @JsonKey(name: 'total_campaign_discount_amount')
      num totalCampaignDiscountAmount,
      @JsonKey(name: 'total_coupon_discount_amount')
      num totalCouponDiscountAmount,
      @JsonKey(name: 'coupon_code') String? couponCode,
      @JsonKey(name: 'is_checked') int isChecked,
      @JsonKey(name: 'service_preference') int servicePreference,
      @JsonKey(name: 'additional_charge') num additionalCharge,
      @JsonKey(name: 'additional_tax_amount') num additionalTaxAmount,
      @JsonKey(name: 'additional_discount_amount') num additionalDiscountAmount,
      @JsonKey(name: 'additional_campaign_discount_amount')
      num additionalCampaignDiscountAmount,
      @JsonKey(name: 'removed_coupon_amount') String removedCouponAmount,
      @JsonKey(name: 'reach_image') String? reachImage,
      @JsonKey(name: 'evidence_photos') dynamic evidencePhotos,
      @JsonKey(name: 'booking_otp') String bookingOtp,
      @JsonKey(name: 'is_guest') int isGuest,
      @JsonKey(name: 'is_verified') int isVerified,
      @JsonKey(name: 'extra_fee') num extraFee,
      @JsonKey(name: 'total_referral_discount_amount')
      num totalReferralDiscountAmount,
      @JsonKey(name: 'is_repeated') int isRepeated,
      @JsonKey(name: 'assigned_by') dynamic assignedBy,
      @JsonKey(name: 'evidence_photos_full_path')
      List<dynamic> evidencePhotosFullPath,
      List<BookingDetail> detail});
}

/// @nodoc
class __$BookingCopyWithImpl<$Res> implements _$BookingCopyWith<$Res> {
  __$BookingCopyWithImpl(this._self, this._then);

  final _Booking _self;
  final $Res Function(_Booking) _then;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? readableId = null,
    Object? customerId = null,
    Object? providerId = null,
    Object? zoneId = null,
    Object? bookingStatus = null,
    Object? isPaid = null,
    Object? paymentMethod = null,
    Object? transactionId = null,
    Object? totalBookingAmount = null,
    Object? totalTaxAmount = null,
    Object? totalDiscountAmount = null,
    Object? serviceSchedule = null,
    Object? serviceAddressId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? categoryId = null,
    Object? subCategoryId = null,
    Object? servicemanId = freezed,
    Object? totalCampaignDiscountAmount = null,
    Object? totalCouponDiscountAmount = null,
    Object? couponCode = freezed,
    Object? isChecked = null,
    Object? servicePreference = null,
    Object? additionalCharge = null,
    Object? additionalTaxAmount = null,
    Object? additionalDiscountAmount = null,
    Object? additionalCampaignDiscountAmount = null,
    Object? removedCouponAmount = null,
    Object? reachImage = freezed,
    Object? evidencePhotos = freezed,
    Object? bookingOtp = null,
    Object? isGuest = null,
    Object? isVerified = null,
    Object? extraFee = null,
    Object? totalReferralDiscountAmount = null,
    Object? isRepeated = null,
    Object? assignedBy = freezed,
    Object? evidencePhotosFullPath = null,
    Object? detail = null,
  }) {
    return _then(_Booking(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      readableId: null == readableId
          ? _self.readableId
          : readableId // ignore: cast_nullable_to_non_nullable
              as int,
      customerId: null == customerId
          ? _self.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      providerId: null == providerId
          ? _self.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String,
      zoneId: null == zoneId
          ? _self.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String,
      bookingStatus: null == bookingStatus
          ? _self.bookingStatus
          : bookingStatus // ignore: cast_nullable_to_non_nullable
              as String,
      isPaid: null == isPaid
          ? _self.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _self.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      totalBookingAmount: null == totalBookingAmount
          ? _self.totalBookingAmount
          : totalBookingAmount // ignore: cast_nullable_to_non_nullable
              as num,
      totalTaxAmount: null == totalTaxAmount
          ? _self.totalTaxAmount
          : totalTaxAmount // ignore: cast_nullable_to_non_nullable
              as num,
      totalDiscountAmount: null == totalDiscountAmount
          ? _self.totalDiscountAmount
          : totalDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
      serviceSchedule: null == serviceSchedule
          ? _self.serviceSchedule
          : serviceSchedule // ignore: cast_nullable_to_non_nullable
              as String,
      serviceAddressId: null == serviceAddressId
          ? _self.serviceAddressId
          : serviceAddressId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
      subCategoryId: null == subCategoryId
          ? _self.subCategoryId
          : subCategoryId // ignore: cast_nullable_to_non_nullable
              as String,
      servicemanId: freezed == servicemanId
          ? _self.servicemanId
          : servicemanId // ignore: cast_nullable_to_non_nullable
              as String?,
      totalCampaignDiscountAmount: null == totalCampaignDiscountAmount
          ? _self.totalCampaignDiscountAmount
          : totalCampaignDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
      totalCouponDiscountAmount: null == totalCouponDiscountAmount
          ? _self.totalCouponDiscountAmount
          : totalCouponDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
      couponCode: freezed == couponCode
          ? _self.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String?,
      isChecked: null == isChecked
          ? _self.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as int,
      servicePreference: null == servicePreference
          ? _self.servicePreference
          : servicePreference // ignore: cast_nullable_to_non_nullable
              as int,
      additionalCharge: null == additionalCharge
          ? _self.additionalCharge
          : additionalCharge // ignore: cast_nullable_to_non_nullable
              as num,
      additionalTaxAmount: null == additionalTaxAmount
          ? _self.additionalTaxAmount
          : additionalTaxAmount // ignore: cast_nullable_to_non_nullable
              as num,
      additionalDiscountAmount: null == additionalDiscountAmount
          ? _self.additionalDiscountAmount
          : additionalDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
      additionalCampaignDiscountAmount: null == additionalCampaignDiscountAmount
          ? _self.additionalCampaignDiscountAmount
          : additionalCampaignDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
      removedCouponAmount: null == removedCouponAmount
          ? _self.removedCouponAmount
          : removedCouponAmount // ignore: cast_nullable_to_non_nullable
              as String,
      reachImage: freezed == reachImage
          ? _self.reachImage
          : reachImage // ignore: cast_nullable_to_non_nullable
              as String?,
      evidencePhotos: freezed == evidencePhotos
          ? _self.evidencePhotos
          : evidencePhotos // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bookingOtp: null == bookingOtp
          ? _self.bookingOtp
          : bookingOtp // ignore: cast_nullable_to_non_nullable
              as String,
      isGuest: null == isGuest
          ? _self.isGuest
          : isGuest // ignore: cast_nullable_to_non_nullable
              as int,
      isVerified: null == isVerified
          ? _self.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as int,
      extraFee: null == extraFee
          ? _self.extraFee
          : extraFee // ignore: cast_nullable_to_non_nullable
              as num,
      totalReferralDiscountAmount: null == totalReferralDiscountAmount
          ? _self.totalReferralDiscountAmount
          : totalReferralDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
      isRepeated: null == isRepeated
          ? _self.isRepeated
          : isRepeated // ignore: cast_nullable_to_non_nullable
              as int,
      assignedBy: freezed == assignedBy
          ? _self.assignedBy
          : assignedBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
      evidencePhotosFullPath: null == evidencePhotosFullPath
          ? _self._evidencePhotosFullPath
          : evidencePhotosFullPath // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      detail: null == detail
          ? _self._detail
          : detail // ignore: cast_nullable_to_non_nullable
              as List<BookingDetail>,
    ));
  }
}

/// @nodoc
mixin _$BookingDetail {
  int get id;
  @JsonKey(name: 'booking_id')
  String get bookingId;
  @JsonKey(name: 'service_id')
  String get serviceId;
  @JsonKey(name: 'service_name')
  String get serviceName;
  @JsonKey(name: 'variant_key')
  String get variantKey;
  @JsonKey(name: 'service_cost')
  num get serviceCost;
  int get quantity;
  @JsonKey(name: 'discount_amount')
  num get discountAmount;
  @JsonKey(name: 'tax_amount')
  num get taxAmount;
  @JsonKey(name: 'total_cost')
  num get totalCost;
  @JsonKey(name: 'created_at')
  String get createdAt;
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @JsonKey(name: 'campaign_discount_amount')
  num get campaignDiscountAmount;
  @JsonKey(name: 'overall_coupon_discount_amount')
  num get overallCouponDiscountAmount;

  /// Create a copy of BookingDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookingDetailCopyWith<BookingDetail> get copyWith =>
      _$BookingDetailCopyWithImpl<BookingDetail>(
          this as BookingDetail, _$identity);

  /// Serializes this BookingDetail to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookingDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.variantKey, variantKey) ||
                other.variantKey == variantKey) &&
            (identical(other.serviceCost, serviceCost) ||
                other.serviceCost == serviceCost) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.campaignDiscountAmount, campaignDiscountAmount) ||
                other.campaignDiscountAmount == campaignDiscountAmount) &&
            (identical(other.overallCouponDiscountAmount,
                    overallCouponDiscountAmount) ||
                other.overallCouponDiscountAmount ==
                    overallCouponDiscountAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      bookingId,
      serviceId,
      serviceName,
      variantKey,
      serviceCost,
      quantity,
      discountAmount,
      taxAmount,
      totalCost,
      createdAt,
      updatedAt,
      campaignDiscountAmount,
      overallCouponDiscountAmount);

  @override
  String toString() {
    return 'BookingDetail(id: $id, bookingId: $bookingId, serviceId: $serviceId, serviceName: $serviceName, variantKey: $variantKey, serviceCost: $serviceCost, quantity: $quantity, discountAmount: $discountAmount, taxAmount: $taxAmount, totalCost: $totalCost, createdAt: $createdAt, updatedAt: $updatedAt, campaignDiscountAmount: $campaignDiscountAmount, overallCouponDiscountAmount: $overallCouponDiscountAmount)';
  }
}

/// @nodoc
abstract mixin class $BookingDetailCopyWith<$Res> {
  factory $BookingDetailCopyWith(
          BookingDetail value, $Res Function(BookingDetail) _then) =
      _$BookingDetailCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'booking_id') String bookingId,
      @JsonKey(name: 'service_id') String serviceId,
      @JsonKey(name: 'service_name') String serviceName,
      @JsonKey(name: 'variant_key') String variantKey,
      @JsonKey(name: 'service_cost') num serviceCost,
      int quantity,
      @JsonKey(name: 'discount_amount') num discountAmount,
      @JsonKey(name: 'tax_amount') num taxAmount,
      @JsonKey(name: 'total_cost') num totalCost,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'campaign_discount_amount') num campaignDiscountAmount,
      @JsonKey(name: 'overall_coupon_discount_amount')
      num overallCouponDiscountAmount});
}

/// @nodoc
class _$BookingDetailCopyWithImpl<$Res>
    implements $BookingDetailCopyWith<$Res> {
  _$BookingDetailCopyWithImpl(this._self, this._then);

  final BookingDetail _self;
  final $Res Function(BookingDetail) _then;

  /// Create a copy of BookingDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bookingId = null,
    Object? serviceId = null,
    Object? serviceName = null,
    Object? variantKey = null,
    Object? serviceCost = null,
    Object? quantity = null,
    Object? discountAmount = null,
    Object? taxAmount = null,
    Object? totalCost = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? campaignDiscountAmount = null,
    Object? overallCouponDiscountAmount = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bookingId: null == bookingId
          ? _self.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceId: null == serviceId
          ? _self.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _self.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      variantKey: null == variantKey
          ? _self.variantKey
          : variantKey // ignore: cast_nullable_to_non_nullable
              as String,
      serviceCost: null == serviceCost
          ? _self.serviceCost
          : serviceCost // ignore: cast_nullable_to_non_nullable
              as num,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      discountAmount: null == discountAmount
          ? _self.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as num,
      taxAmount: null == taxAmount
          ? _self.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as num,
      totalCost: null == totalCost
          ? _self.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as num,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      campaignDiscountAmount: null == campaignDiscountAmount
          ? _self.campaignDiscountAmount
          : campaignDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
      overallCouponDiscountAmount: null == overallCouponDiscountAmount
          ? _self.overallCouponDiscountAmount
          : overallCouponDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BookingDetail implements BookingDetail {
  const _BookingDetail(
      {required this.id,
      @JsonKey(name: 'booking_id') required this.bookingId,
      @JsonKey(name: 'service_id') required this.serviceId,
      @JsonKey(name: 'service_name') required this.serviceName,
      @JsonKey(name: 'variant_key') required this.variantKey,
      @JsonKey(name: 'service_cost') required this.serviceCost,
      required this.quantity,
      @JsonKey(name: 'discount_amount') required this.discountAmount,
      @JsonKey(name: 'tax_amount') required this.taxAmount,
      @JsonKey(name: 'total_cost') required this.totalCost,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'campaign_discount_amount')
      required this.campaignDiscountAmount,
      @JsonKey(name: 'overall_coupon_discount_amount')
      required this.overallCouponDiscountAmount});
  factory _BookingDetail.fromJson(Map<String, dynamic> json) =>
      _$BookingDetailFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'booking_id')
  final String bookingId;
  @override
  @JsonKey(name: 'service_id')
  final String serviceId;
  @override
  @JsonKey(name: 'service_name')
  final String serviceName;
  @override
  @JsonKey(name: 'variant_key')
  final String variantKey;
  @override
  @JsonKey(name: 'service_cost')
  final num serviceCost;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'discount_amount')
  final num discountAmount;
  @override
  @JsonKey(name: 'tax_amount')
  final num taxAmount;
  @override
  @JsonKey(name: 'total_cost')
  final num totalCost;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'campaign_discount_amount')
  final num campaignDiscountAmount;
  @override
  @JsonKey(name: 'overall_coupon_discount_amount')
  final num overallCouponDiscountAmount;

  /// Create a copy of BookingDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BookingDetailCopyWith<_BookingDetail> get copyWith =>
      __$BookingDetailCopyWithImpl<_BookingDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BookingDetailToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BookingDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.serviceId, serviceId) ||
                other.serviceId == serviceId) &&
            (identical(other.serviceName, serviceName) ||
                other.serviceName == serviceName) &&
            (identical(other.variantKey, variantKey) ||
                other.variantKey == variantKey) &&
            (identical(other.serviceCost, serviceCost) ||
                other.serviceCost == serviceCost) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.campaignDiscountAmount, campaignDiscountAmount) ||
                other.campaignDiscountAmount == campaignDiscountAmount) &&
            (identical(other.overallCouponDiscountAmount,
                    overallCouponDiscountAmount) ||
                other.overallCouponDiscountAmount ==
                    overallCouponDiscountAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      bookingId,
      serviceId,
      serviceName,
      variantKey,
      serviceCost,
      quantity,
      discountAmount,
      taxAmount,
      totalCost,
      createdAt,
      updatedAt,
      campaignDiscountAmount,
      overallCouponDiscountAmount);

  @override
  String toString() {
    return 'BookingDetail(id: $id, bookingId: $bookingId, serviceId: $serviceId, serviceName: $serviceName, variantKey: $variantKey, serviceCost: $serviceCost, quantity: $quantity, discountAmount: $discountAmount, taxAmount: $taxAmount, totalCost: $totalCost, createdAt: $createdAt, updatedAt: $updatedAt, campaignDiscountAmount: $campaignDiscountAmount, overallCouponDiscountAmount: $overallCouponDiscountAmount)';
  }
}

/// @nodoc
abstract mixin class _$BookingDetailCopyWith<$Res>
    implements $BookingDetailCopyWith<$Res> {
  factory _$BookingDetailCopyWith(
          _BookingDetail value, $Res Function(_BookingDetail) _then) =
      __$BookingDetailCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'booking_id') String bookingId,
      @JsonKey(name: 'service_id') String serviceId,
      @JsonKey(name: 'service_name') String serviceName,
      @JsonKey(name: 'variant_key') String variantKey,
      @JsonKey(name: 'service_cost') num serviceCost,
      int quantity,
      @JsonKey(name: 'discount_amount') num discountAmount,
      @JsonKey(name: 'tax_amount') num taxAmount,
      @JsonKey(name: 'total_cost') num totalCost,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'campaign_discount_amount') num campaignDiscountAmount,
      @JsonKey(name: 'overall_coupon_discount_amount')
      num overallCouponDiscountAmount});
}

/// @nodoc
class __$BookingDetailCopyWithImpl<$Res>
    implements _$BookingDetailCopyWith<$Res> {
  __$BookingDetailCopyWithImpl(this._self, this._then);

  final _BookingDetail _self;
  final $Res Function(_BookingDetail) _then;

  /// Create a copy of BookingDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? bookingId = null,
    Object? serviceId = null,
    Object? serviceName = null,
    Object? variantKey = null,
    Object? serviceCost = null,
    Object? quantity = null,
    Object? discountAmount = null,
    Object? taxAmount = null,
    Object? totalCost = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? campaignDiscountAmount = null,
    Object? overallCouponDiscountAmount = null,
  }) {
    return _then(_BookingDetail(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      bookingId: null == bookingId
          ? _self.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceId: null == serviceId
          ? _self.serviceId
          : serviceId // ignore: cast_nullable_to_non_nullable
              as String,
      serviceName: null == serviceName
          ? _self.serviceName
          : serviceName // ignore: cast_nullable_to_non_nullable
              as String,
      variantKey: null == variantKey
          ? _self.variantKey
          : variantKey // ignore: cast_nullable_to_non_nullable
              as String,
      serviceCost: null == serviceCost
          ? _self.serviceCost
          : serviceCost // ignore: cast_nullable_to_non_nullable
              as num,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      discountAmount: null == discountAmount
          ? _self.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as num,
      taxAmount: null == taxAmount
          ? _self.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as num,
      totalCost: null == totalCost
          ? _self.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as num,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      campaignDiscountAmount: null == campaignDiscountAmount
          ? _self.campaignDiscountAmount
          : campaignDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
      overallCouponDiscountAmount: null == overallCouponDiscountAmount
          ? _self.overallCouponDiscountAmount
          : overallCouponDiscountAmount // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
mixin _$Provider {
  String get id;
  @JsonKey(name: 'user_id')
  String get userId;
  @JsonKey(name: 'company_name')
  String get companyName;
  @JsonKey(name: 'full_name')
  String get fullName;
  @JsonKey(name: 'company_address')
  String get companyAddress;
  @JsonKey(name: 'contact_number')
  String get contactNumber;
  @JsonKey(name: 'alt_contact_number')
  String get altContactNumber;
  String get email;
  @JsonKey(name: 'zone_id')
  String get zoneId;
  Coordinates get coordinates;
  @JsonKey(name: 'adhar_number')
  String get adharNumber;
  @JsonKey(name: 'adhar_img')
  String get adharImg;
  @JsonKey(name: 'pan_number')
  String get panNumber;
  @JsonKey(name: 'pan_img')
  String get panImg;
  @JsonKey(name: 'dl_number')
  String get dlNumber;
  @JsonKey(name: 'dl_img')
  String get dlImg;
  @JsonKey(name: 'profile_img')
  String get profileImg;
  @JsonKey(name: 'service_availability')
  int get serviceAvailability;
  @JsonKey(name: 'is_approved')
  int get isApproved;
  @JsonKey(name: 'is_active')
  int get isActive;
  @JsonKey(name: 'is_suspended')
  int get isSuspended;
  @JsonKey(name: 'rating_count')
  int? get ratingCount;
  @JsonKey(name: 'avg_rating')
  double get avgRating;
  @JsonKey(name: 'bank_docs')
  String get bankDocs;
  @JsonKey(name: 'deleted_at')
  dynamic get deletedAt;
  @JsonKey(name: 'created_at')
  String get createdAt;
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @JsonKey(name: 'logo_full_path')
  dynamic get logoFullPath;

  /// Create a copy of Provider
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProviderCopyWith<Provider> get copyWith =>
      _$ProviderCopyWithImpl<Provider>(this as Provider, _$identity);

  /// Serializes this Provider to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Provider &&
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
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other.logoFullPath, logoFullPath));
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
        const DeepCollectionEquality().hash(deletedAt),
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(logoFullPath)
      ]);

  @override
  String toString() {
    return 'Provider(id: $id, userId: $userId, companyName: $companyName, fullName: $fullName, companyAddress: $companyAddress, contactNumber: $contactNumber, altContactNumber: $altContactNumber, email: $email, zoneId: $zoneId, coordinates: $coordinates, adharNumber: $adharNumber, adharImg: $adharImg, panNumber: $panNumber, panImg: $panImg, dlNumber: $dlNumber, dlImg: $dlImg, profileImg: $profileImg, serviceAvailability: $serviceAvailability, isApproved: $isApproved, isActive: $isActive, isSuspended: $isSuspended, ratingCount: $ratingCount, avgRating: $avgRating, bankDocs: $bankDocs, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, logoFullPath: $logoFullPath)';
  }
}

/// @nodoc
abstract mixin class $ProviderCopyWith<$Res> {
  factory $ProviderCopyWith(Provider value, $Res Function(Provider) _then) =
      _$ProviderCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'company_name') String companyName,
      @JsonKey(name: 'full_name') String fullName,
      @JsonKey(name: 'company_address') String companyAddress,
      @JsonKey(name: 'contact_number') String contactNumber,
      @JsonKey(name: 'alt_contact_number') String altContactNumber,
      String email,
      @JsonKey(name: 'zone_id') String zoneId,
      Coordinates coordinates,
      @JsonKey(name: 'adhar_number') String adharNumber,
      @JsonKey(name: 'adhar_img') String adharImg,
      @JsonKey(name: 'pan_number') String panNumber,
      @JsonKey(name: 'pan_img') String panImg,
      @JsonKey(name: 'dl_number') String dlNumber,
      @JsonKey(name: 'dl_img') String dlImg,
      @JsonKey(name: 'profile_img') String profileImg,
      @JsonKey(name: 'service_availability') int serviceAvailability,
      @JsonKey(name: 'is_approved') int isApproved,
      @JsonKey(name: 'is_active') int isActive,
      @JsonKey(name: 'is_suspended') int isSuspended,
      @JsonKey(name: 'rating_count') int? ratingCount,
      @JsonKey(name: 'avg_rating') double avgRating,
      @JsonKey(name: 'bank_docs') String bankDocs,
      @JsonKey(name: 'deleted_at') dynamic deletedAt,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'logo_full_path') dynamic logoFullPath});

  $CoordinatesCopyWith<$Res> get coordinates;
}

/// @nodoc
class _$ProviderCopyWithImpl<$Res> implements $ProviderCopyWith<$Res> {
  _$ProviderCopyWithImpl(this._self, this._then);

  final Provider _self;
  final $Res Function(Provider) _then;

  /// Create a copy of Provider
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? companyName = null,
    Object? fullName = null,
    Object? companyAddress = null,
    Object? contactNumber = null,
    Object? altContactNumber = null,
    Object? email = null,
    Object? zoneId = null,
    Object? coordinates = null,
    Object? adharNumber = null,
    Object? adharImg = null,
    Object? panNumber = null,
    Object? panImg = null,
    Object? dlNumber = null,
    Object? dlImg = null,
    Object? profileImg = null,
    Object? serviceAvailability = null,
    Object? isApproved = null,
    Object? isActive = null,
    Object? isSuspended = null,
    Object? ratingCount = freezed,
    Object? avgRating = null,
    Object? bankDocs = null,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? logoFullPath = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      companyAddress: null == companyAddress
          ? _self.companyAddress
          : companyAddress // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _self.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      altContactNumber: null == altContactNumber
          ? _self.altContactNumber
          : altContactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      zoneId: null == zoneId
          ? _self.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _self.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Coordinates,
      adharNumber: null == adharNumber
          ? _self.adharNumber
          : adharNumber // ignore: cast_nullable_to_non_nullable
              as String,
      adharImg: null == adharImg
          ? _self.adharImg
          : adharImg // ignore: cast_nullable_to_non_nullable
              as String,
      panNumber: null == panNumber
          ? _self.panNumber
          : panNumber // ignore: cast_nullable_to_non_nullable
              as String,
      panImg: null == panImg
          ? _self.panImg
          : panImg // ignore: cast_nullable_to_non_nullable
              as String,
      dlNumber: null == dlNumber
          ? _self.dlNumber
          : dlNumber // ignore: cast_nullable_to_non_nullable
              as String,
      dlImg: null == dlImg
          ? _self.dlImg
          : dlImg // ignore: cast_nullable_to_non_nullable
              as String,
      profileImg: null == profileImg
          ? _self.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String,
      serviceAvailability: null == serviceAvailability
          ? _self.serviceAvailability
          : serviceAvailability // ignore: cast_nullable_to_non_nullable
              as int,
      isApproved: null == isApproved
          ? _self.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
      isSuspended: null == isSuspended
          ? _self.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as int,
      ratingCount: freezed == ratingCount
          ? _self.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      avgRating: null == avgRating
          ? _self.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as double,
      bankDocs: null == bankDocs
          ? _self.bankDocs
          : bankDocs // ignore: cast_nullable_to_non_nullable
              as String,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      logoFullPath: freezed == logoFullPath
          ? _self.logoFullPath
          : logoFullPath // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  /// Create a copy of Provider
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoordinatesCopyWith<$Res> get coordinates {
    return $CoordinatesCopyWith<$Res>(_self.coordinates, (value) {
      return _then(_self.copyWith(coordinates: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Provider implements Provider {
  const _Provider(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'company_name') required this.companyName,
      @JsonKey(name: 'full_name') required this.fullName,
      @JsonKey(name: 'company_address') required this.companyAddress,
      @JsonKey(name: 'contact_number') required this.contactNumber,
      @JsonKey(name: 'alt_contact_number') required this.altContactNumber,
      required this.email,
      @JsonKey(name: 'zone_id') required this.zoneId,
      required this.coordinates,
      @JsonKey(name: 'adhar_number') required this.adharNumber,
      @JsonKey(name: 'adhar_img') required this.adharImg,
      @JsonKey(name: 'pan_number') required this.panNumber,
      @JsonKey(name: 'pan_img') required this.panImg,
      @JsonKey(name: 'dl_number') required this.dlNumber,
      @JsonKey(name: 'dl_img') required this.dlImg,
      @JsonKey(name: 'profile_img') required this.profileImg,
      @JsonKey(name: 'service_availability') required this.serviceAvailability,
      @JsonKey(name: 'is_approved') required this.isApproved,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'is_suspended') required this.isSuspended,
      @JsonKey(name: 'rating_count') this.ratingCount = 0,
      @JsonKey(name: 'avg_rating') required this.avgRating,
      @JsonKey(name: 'bank_docs') required this.bankDocs,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'logo_full_path') this.logoFullPath});
  factory _Provider.fromJson(Map<String, dynamic> json) =>
      _$ProviderFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'company_name')
  final String companyName;
  @override
  @JsonKey(name: 'full_name')
  final String fullName;
  @override
  @JsonKey(name: 'company_address')
  final String companyAddress;
  @override
  @JsonKey(name: 'contact_number')
  final String contactNumber;
  @override
  @JsonKey(name: 'alt_contact_number')
  final String altContactNumber;
  @override
  final String email;
  @override
  @JsonKey(name: 'zone_id')
  final String zoneId;
  @override
  final Coordinates coordinates;
  @override
  @JsonKey(name: 'adhar_number')
  final String adharNumber;
  @override
  @JsonKey(name: 'adhar_img')
  final String adharImg;
  @override
  @JsonKey(name: 'pan_number')
  final String panNumber;
  @override
  @JsonKey(name: 'pan_img')
  final String panImg;
  @override
  @JsonKey(name: 'dl_number')
  final String dlNumber;
  @override
  @JsonKey(name: 'dl_img')
  final String dlImg;
  @override
  @JsonKey(name: 'profile_img')
  final String profileImg;
  @override
  @JsonKey(name: 'service_availability')
  final int serviceAvailability;
  @override
  @JsonKey(name: 'is_approved')
  final int isApproved;
  @override
  @JsonKey(name: 'is_active')
  final int isActive;
  @override
  @JsonKey(name: 'is_suspended')
  final int isSuspended;
  @override
  @JsonKey(name: 'rating_count')
  final int? ratingCount;
  @override
  @JsonKey(name: 'avg_rating')
  final double avgRating;
  @override
  @JsonKey(name: 'bank_docs')
  final String bankDocs;
  @override
  @JsonKey(name: 'deleted_at')
  final dynamic deletedAt;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'logo_full_path')
  final dynamic logoFullPath;

  /// Create a copy of Provider
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProviderCopyWith<_Provider> get copyWith =>
      __$ProviderCopyWithImpl<_Provider>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProviderToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Provider &&
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
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other.logoFullPath, logoFullPath));
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
        const DeepCollectionEquality().hash(deletedAt),
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(logoFullPath)
      ]);

  @override
  String toString() {
    return 'Provider(id: $id, userId: $userId, companyName: $companyName, fullName: $fullName, companyAddress: $companyAddress, contactNumber: $contactNumber, altContactNumber: $altContactNumber, email: $email, zoneId: $zoneId, coordinates: $coordinates, adharNumber: $adharNumber, adharImg: $adharImg, panNumber: $panNumber, panImg: $panImg, dlNumber: $dlNumber, dlImg: $dlImg, profileImg: $profileImg, serviceAvailability: $serviceAvailability, isApproved: $isApproved, isActive: $isActive, isSuspended: $isSuspended, ratingCount: $ratingCount, avgRating: $avgRating, bankDocs: $bankDocs, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, logoFullPath: $logoFullPath)';
  }
}

/// @nodoc
abstract mixin class _$ProviderCopyWith<$Res>
    implements $ProviderCopyWith<$Res> {
  factory _$ProviderCopyWith(_Provider value, $Res Function(_Provider) _then) =
      __$ProviderCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'company_name') String companyName,
      @JsonKey(name: 'full_name') String fullName,
      @JsonKey(name: 'company_address') String companyAddress,
      @JsonKey(name: 'contact_number') String contactNumber,
      @JsonKey(name: 'alt_contact_number') String altContactNumber,
      String email,
      @JsonKey(name: 'zone_id') String zoneId,
      Coordinates coordinates,
      @JsonKey(name: 'adhar_number') String adharNumber,
      @JsonKey(name: 'adhar_img') String adharImg,
      @JsonKey(name: 'pan_number') String panNumber,
      @JsonKey(name: 'pan_img') String panImg,
      @JsonKey(name: 'dl_number') String dlNumber,
      @JsonKey(name: 'dl_img') String dlImg,
      @JsonKey(name: 'profile_img') String profileImg,
      @JsonKey(name: 'service_availability') int serviceAvailability,
      @JsonKey(name: 'is_approved') int isApproved,
      @JsonKey(name: 'is_active') int isActive,
      @JsonKey(name: 'is_suspended') int isSuspended,
      @JsonKey(name: 'rating_count') int? ratingCount,
      @JsonKey(name: 'avg_rating') double avgRating,
      @JsonKey(name: 'bank_docs') String bankDocs,
      @JsonKey(name: 'deleted_at') dynamic deletedAt,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'logo_full_path') dynamic logoFullPath});

  @override
  $CoordinatesCopyWith<$Res> get coordinates;
}

/// @nodoc
class __$ProviderCopyWithImpl<$Res> implements _$ProviderCopyWith<$Res> {
  __$ProviderCopyWithImpl(this._self, this._then);

  final _Provider _self;
  final $Res Function(_Provider) _then;

  /// Create a copy of Provider
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? companyName = null,
    Object? fullName = null,
    Object? companyAddress = null,
    Object? contactNumber = null,
    Object? altContactNumber = null,
    Object? email = null,
    Object? zoneId = null,
    Object? coordinates = null,
    Object? adharNumber = null,
    Object? adharImg = null,
    Object? panNumber = null,
    Object? panImg = null,
    Object? dlNumber = null,
    Object? dlImg = null,
    Object? profileImg = null,
    Object? serviceAvailability = null,
    Object? isApproved = null,
    Object? isActive = null,
    Object? isSuspended = null,
    Object? ratingCount = freezed,
    Object? avgRating = null,
    Object? bankDocs = null,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? logoFullPath = freezed,
  }) {
    return _then(_Provider(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _self.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      companyAddress: null == companyAddress
          ? _self.companyAddress
          : companyAddress // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _self.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      altContactNumber: null == altContactNumber
          ? _self.altContactNumber
          : altContactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      zoneId: null == zoneId
          ? _self.zoneId
          : zoneId // ignore: cast_nullable_to_non_nullable
              as String,
      coordinates: null == coordinates
          ? _self.coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as Coordinates,
      adharNumber: null == adharNumber
          ? _self.adharNumber
          : adharNumber // ignore: cast_nullable_to_non_nullable
              as String,
      adharImg: null == adharImg
          ? _self.adharImg
          : adharImg // ignore: cast_nullable_to_non_nullable
              as String,
      panNumber: null == panNumber
          ? _self.panNumber
          : panNumber // ignore: cast_nullable_to_non_nullable
              as String,
      panImg: null == panImg
          ? _self.panImg
          : panImg // ignore: cast_nullable_to_non_nullable
              as String,
      dlNumber: null == dlNumber
          ? _self.dlNumber
          : dlNumber // ignore: cast_nullable_to_non_nullable
              as String,
      dlImg: null == dlImg
          ? _self.dlImg
          : dlImg // ignore: cast_nullable_to_non_nullable
              as String,
      profileImg: null == profileImg
          ? _self.profileImg
          : profileImg // ignore: cast_nullable_to_non_nullable
              as String,
      serviceAvailability: null == serviceAvailability
          ? _self.serviceAvailability
          : serviceAvailability // ignore: cast_nullable_to_non_nullable
              as int,
      isApproved: null == isApproved
          ? _self.isApproved
          : isApproved // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
      isSuspended: null == isSuspended
          ? _self.isSuspended
          : isSuspended // ignore: cast_nullable_to_non_nullable
              as int,
      ratingCount: freezed == ratingCount
          ? _self.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      avgRating: null == avgRating
          ? _self.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as double,
      bankDocs: null == bankDocs
          ? _self.bankDocs
          : bankDocs // ignore: cast_nullable_to_non_nullable
              as String,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      logoFullPath: freezed == logoFullPath
          ? _self.logoFullPath
          : logoFullPath // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }

  /// Create a copy of Provider
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CoordinatesCopyWith<$Res> get coordinates {
    return $CoordinatesCopyWith<$Res>(_self.coordinates, (value) {
      return _then(_self.copyWith(coordinates: value));
    });
  }
}

/// @nodoc
mixin _$Coordinates {
  String get latitude;
  String get longitude;

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
  $Res call({String latitude, String longitude});
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
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_self.copyWith(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Coordinates implements Coordinates {
  const _Coordinates({required this.latitude, required this.longitude});
  factory _Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  @override
  final String latitude;
  @override
  final String longitude;

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
  $Res call({String latitude, String longitude});
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
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_Coordinates(
      latitude: null == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$Customer {
  String get id;
  @JsonKey(name: 'first_name')
  String get firstName;
  @JsonKey(name: 'last_name')
  String get lastName;
  String get email;
  String get phone;
  @JsonKey(name: 'identification_number')
  dynamic get identificationNumber;
  @JsonKey(name: 'identification_type')
  String get identificationType;
  @JsonKey(name: 'identification_image')
  List<dynamic> get identificationImage;
  @JsonKey(name: 'date_of_birth')
  dynamic get dateOfBirth;
  String get gender;
  @JsonKey(name: 'profile_image')
  String get profileImage;
  @JsonKey(name: 'fcm_token')
  String? get fcmToken;
  @JsonKey(name: 'is_phone_verified')
  int get isPhoneVerified;
  @JsonKey(name: 'is_email_verified')
  int get isEmailVerified;
  @JsonKey(name: 'phone_verified_at')
  dynamic get phoneVerifiedAt;
  @JsonKey(name: 'email_verified_at')
  dynamic get emailVerifiedAt;
  @JsonKey(name: 'is_active')
  int get isActive;
  @JsonKey(name: 'user_type')
  String get userType;
  @JsonKey(name: 'remember_token')
  dynamic get rememberToken;
  @JsonKey(name: 'deleted_at')
  dynamic get deletedAt;
  @JsonKey(name: 'created_at')
  String get createdAt;
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @JsonKey(name: 'wallet_balance')
  int get walletBalance;
  @JsonKey(name: 'loyalty_point')
  int get loyaltyPoint;
  @JsonKey(name: 'ref_code')
  String get refCode;
  @JsonKey(name: 'referred_by')
  dynamic get referredBy;
  @JsonKey(name: 'login_hit_count')
  int get loginHitCount;
  @JsonKey(name: 'is_temp_blocked')
  int get isTempBlocked;
  @JsonKey(name: 'temp_block_time')
  dynamic get tempBlockTime;
  @JsonKey(name: 'current_language_key')
  String get currentLanguageKey;
  @JsonKey(name: 'profile_image_full_path')
  dynamic get profileImageFullPath;
  @JsonKey(name: 'identification_image_full_path')
  List<dynamic> get identificationImageFullPath;
  dynamic get storage;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<Customer> get copyWith =>
      _$CustomerCopyWithImpl<Customer>(this as Customer, _$identity);

  /// Serializes this Customer to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Customer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality()
                .equals(other.identificationNumber, identificationNumber) &&
            (identical(other.identificationType, identificationType) ||
                other.identificationType == identificationType) &&
            const DeepCollectionEquality()
                .equals(other.identificationImage, identificationImage) &&
            const DeepCollectionEquality()
                .equals(other.dateOfBirth, dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.isPhoneVerified, isPhoneVerified) ||
                other.isPhoneVerified == isPhoneVerified) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            const DeepCollectionEquality()
                .equals(other.phoneVerifiedAt, phoneVerifiedAt) &&
            const DeepCollectionEquality()
                .equals(other.emailVerifiedAt, emailVerifiedAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            const DeepCollectionEquality()
                .equals(other.rememberToken, rememberToken) &&
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.walletBalance, walletBalance) ||
                other.walletBalance == walletBalance) &&
            (identical(other.loyaltyPoint, loyaltyPoint) ||
                other.loyaltyPoint == loyaltyPoint) &&
            (identical(other.refCode, refCode) || other.refCode == refCode) &&
            const DeepCollectionEquality()
                .equals(other.referredBy, referredBy) &&
            (identical(other.loginHitCount, loginHitCount) ||
                other.loginHitCount == loginHitCount) &&
            (identical(other.isTempBlocked, isTempBlocked) ||
                other.isTempBlocked == isTempBlocked) &&
            const DeepCollectionEquality()
                .equals(other.tempBlockTime, tempBlockTime) &&
            (identical(other.currentLanguageKey, currentLanguageKey) ||
                other.currentLanguageKey == currentLanguageKey) &&
            const DeepCollectionEquality()
                .equals(other.profileImageFullPath, profileImageFullPath) &&
            const DeepCollectionEquality().equals(
                other.identificationImageFullPath,
                identificationImageFullPath) &&
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
        const DeepCollectionEquality().hash(identificationNumber),
        identificationType,
        const DeepCollectionEquality().hash(identificationImage),
        const DeepCollectionEquality().hash(dateOfBirth),
        gender,
        profileImage,
        fcmToken,
        isPhoneVerified,
        isEmailVerified,
        const DeepCollectionEquality().hash(phoneVerifiedAt),
        const DeepCollectionEquality().hash(emailVerifiedAt),
        isActive,
        userType,
        const DeepCollectionEquality().hash(rememberToken),
        const DeepCollectionEquality().hash(deletedAt),
        createdAt,
        updatedAt,
        walletBalance,
        loyaltyPoint,
        refCode,
        const DeepCollectionEquality().hash(referredBy),
        loginHitCount,
        isTempBlocked,
        const DeepCollectionEquality().hash(tempBlockTime),
        currentLanguageKey,
        const DeepCollectionEquality().hash(profileImageFullPath),
        const DeepCollectionEquality().hash(identificationImageFullPath),
        const DeepCollectionEquality().hash(storage)
      ]);

  @override
  String toString() {
    return 'Customer(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, identificationNumber: $identificationNumber, identificationType: $identificationType, identificationImage: $identificationImage, dateOfBirth: $dateOfBirth, gender: $gender, profileImage: $profileImage, fcmToken: $fcmToken, isPhoneVerified: $isPhoneVerified, isEmailVerified: $isEmailVerified, phoneVerifiedAt: $phoneVerifiedAt, emailVerifiedAt: $emailVerifiedAt, isActive: $isActive, userType: $userType, rememberToken: $rememberToken, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, walletBalance: $walletBalance, loyaltyPoint: $loyaltyPoint, refCode: $refCode, referredBy: $referredBy, loginHitCount: $loginHitCount, isTempBlocked: $isTempBlocked, tempBlockTime: $tempBlockTime, currentLanguageKey: $currentLanguageKey, profileImageFullPath: $profileImageFullPath, identificationImageFullPath: $identificationImageFullPath, storage: $storage)';
  }
}

/// @nodoc
abstract mixin class $CustomerCopyWith<$Res> {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) _then) =
      _$CustomerCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      String phone,
      @JsonKey(name: 'identification_number') dynamic identificationNumber,
      @JsonKey(name: 'identification_type') String identificationType,
      @JsonKey(name: 'identification_image') List<dynamic> identificationImage,
      @JsonKey(name: 'date_of_birth') dynamic dateOfBirth,
      String gender,
      @JsonKey(name: 'profile_image') String profileImage,
      @JsonKey(name: 'fcm_token') String? fcmToken,
      @JsonKey(name: 'is_phone_verified') int isPhoneVerified,
      @JsonKey(name: 'is_email_verified') int isEmailVerified,
      @JsonKey(name: 'phone_verified_at') dynamic phoneVerifiedAt,
      @JsonKey(name: 'email_verified_at') dynamic emailVerifiedAt,
      @JsonKey(name: 'is_active') int isActive,
      @JsonKey(name: 'user_type') String userType,
      @JsonKey(name: 'remember_token') dynamic rememberToken,
      @JsonKey(name: 'deleted_at') dynamic deletedAt,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'wallet_balance') int walletBalance,
      @JsonKey(name: 'loyalty_point') int loyaltyPoint,
      @JsonKey(name: 'ref_code') String refCode,
      @JsonKey(name: 'referred_by') dynamic referredBy,
      @JsonKey(name: 'login_hit_count') int loginHitCount,
      @JsonKey(name: 'is_temp_blocked') int isTempBlocked,
      @JsonKey(name: 'temp_block_time') dynamic tempBlockTime,
      @JsonKey(name: 'current_language_key') String currentLanguageKey,
      @JsonKey(name: 'profile_image_full_path') dynamic profileImageFullPath,
      @JsonKey(name: 'identification_image_full_path')
      List<dynamic> identificationImageFullPath,
      dynamic storage});
}

/// @nodoc
class _$CustomerCopyWithImpl<$Res> implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._self, this._then);

  final Customer _self;
  final $Res Function(Customer) _then;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phone = null,
    Object? identificationNumber = freezed,
    Object? identificationType = null,
    Object? identificationImage = null,
    Object? dateOfBirth = freezed,
    Object? gender = null,
    Object? profileImage = null,
    Object? fcmToken = freezed,
    Object? isPhoneVerified = null,
    Object? isEmailVerified = null,
    Object? phoneVerifiedAt = freezed,
    Object? emailVerifiedAt = freezed,
    Object? isActive = null,
    Object? userType = null,
    Object? rememberToken = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? walletBalance = null,
    Object? loyaltyPoint = null,
    Object? refCode = null,
    Object? referredBy = freezed,
    Object? loginHitCount = null,
    Object? isTempBlocked = null,
    Object? tempBlockTime = freezed,
    Object? currentLanguageKey = null,
    Object? profileImageFullPath = freezed,
    Object? identificationImageFullPath = null,
    Object? storage = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      identificationNumber: freezed == identificationNumber
          ? _self.identificationNumber
          : identificationNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      identificationType: null == identificationType
          ? _self.identificationType
          : identificationType // ignore: cast_nullable_to_non_nullable
              as String,
      identificationImage: null == identificationImage
          ? _self.identificationImage
          : identificationImage // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _self.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: freezed == fcmToken
          ? _self.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      isPhoneVerified: null == isPhoneVerified
          ? _self.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as int,
      isEmailVerified: null == isEmailVerified
          ? _self.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as int,
      phoneVerifiedAt: freezed == phoneVerifiedAt
          ? _self.phoneVerifiedAt
          : phoneVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _self.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
      userType: null == userType
          ? _self.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
      rememberToken: freezed == rememberToken
          ? _self.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      walletBalance: null == walletBalance
          ? _self.walletBalance
          : walletBalance // ignore: cast_nullable_to_non_nullable
              as int,
      loyaltyPoint: null == loyaltyPoint
          ? _self.loyaltyPoint
          : loyaltyPoint // ignore: cast_nullable_to_non_nullable
              as int,
      refCode: null == refCode
          ? _self.refCode
          : refCode // ignore: cast_nullable_to_non_nullable
              as String,
      referredBy: freezed == referredBy
          ? _self.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
      loginHitCount: null == loginHitCount
          ? _self.loginHitCount
          : loginHitCount // ignore: cast_nullable_to_non_nullable
              as int,
      isTempBlocked: null == isTempBlocked
          ? _self.isTempBlocked
          : isTempBlocked // ignore: cast_nullable_to_non_nullable
              as int,
      tempBlockTime: freezed == tempBlockTime
          ? _self.tempBlockTime
          : tempBlockTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      currentLanguageKey: null == currentLanguageKey
          ? _self.currentLanguageKey
          : currentLanguageKey // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageFullPath: freezed == profileImageFullPath
          ? _self.profileImageFullPath
          : profileImageFullPath // ignore: cast_nullable_to_non_nullable
              as dynamic,
      identificationImageFullPath: null == identificationImageFullPath
          ? _self.identificationImageFullPath
          : identificationImageFullPath // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      storage: freezed == storage
          ? _self.storage
          : storage // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Customer implements Customer {
  const _Customer(
      {required this.id,
      @JsonKey(name: 'first_name') required this.firstName,
      @JsonKey(name: 'last_name') required this.lastName,
      required this.email,
      required this.phone,
      @JsonKey(name: 'identification_number') this.identificationNumber,
      @JsonKey(name: 'identification_type') required this.identificationType,
      @JsonKey(name: 'identification_image')
      required final List<dynamic> identificationImage,
      @JsonKey(name: 'date_of_birth') this.dateOfBirth,
      required this.gender,
      @JsonKey(name: 'profile_image') required this.profileImage,
      @JsonKey(name: 'fcm_token') this.fcmToken,
      @JsonKey(name: 'is_phone_verified') required this.isPhoneVerified,
      @JsonKey(name: 'is_email_verified') required this.isEmailVerified,
      @JsonKey(name: 'phone_verified_at') this.phoneVerifiedAt,
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'user_type') required this.userType,
      @JsonKey(name: 'remember_token') this.rememberToken,
      @JsonKey(name: 'deleted_at') this.deletedAt,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'wallet_balance') required this.walletBalance,
      @JsonKey(name: 'loyalty_point') required this.loyaltyPoint,
      @JsonKey(name: 'ref_code') required this.refCode,
      @JsonKey(name: 'referred_by') this.referredBy,
      @JsonKey(name: 'login_hit_count') required this.loginHitCount,
      @JsonKey(name: 'is_temp_blocked') required this.isTempBlocked,
      @JsonKey(name: 'temp_block_time') this.tempBlockTime,
      @JsonKey(name: 'current_language_key') required this.currentLanguageKey,
      @JsonKey(name: 'profile_image_full_path') this.profileImageFullPath,
      @JsonKey(name: 'identification_image_full_path')
      required final List<dynamic> identificationImageFullPath,
      this.storage})
      : _identificationImage = identificationImage,
        _identificationImageFullPath = identificationImageFullPath;
  factory _Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'first_name')
  final String firstName;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String email;
  @override
  final String phone;
  @override
  @JsonKey(name: 'identification_number')
  final dynamic identificationNumber;
  @override
  @JsonKey(name: 'identification_type')
  final String identificationType;
  final List<dynamic> _identificationImage;
  @override
  @JsonKey(name: 'identification_image')
  List<dynamic> get identificationImage {
    if (_identificationImage is EqualUnmodifiableListView)
      return _identificationImage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_identificationImage);
  }

  @override
  @JsonKey(name: 'date_of_birth')
  final dynamic dateOfBirth;
  @override
  final String gender;
  @override
  @JsonKey(name: 'profile_image')
  final String profileImage;
  @override
  @JsonKey(name: 'fcm_token')
  final String? fcmToken;
  @override
  @JsonKey(name: 'is_phone_verified')
  final int isPhoneVerified;
  @override
  @JsonKey(name: 'is_email_verified')
  final int isEmailVerified;
  @override
  @JsonKey(name: 'phone_verified_at')
  final dynamic phoneVerifiedAt;
  @override
  @JsonKey(name: 'email_verified_at')
  final dynamic emailVerifiedAt;
  @override
  @JsonKey(name: 'is_active')
  final int isActive;
  @override
  @JsonKey(name: 'user_type')
  final String userType;
  @override
  @JsonKey(name: 'remember_token')
  final dynamic rememberToken;
  @override
  @JsonKey(name: 'deleted_at')
  final dynamic deletedAt;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'wallet_balance')
  final int walletBalance;
  @override
  @JsonKey(name: 'loyalty_point')
  final int loyaltyPoint;
  @override
  @JsonKey(name: 'ref_code')
  final String refCode;
  @override
  @JsonKey(name: 'referred_by')
  final dynamic referredBy;
  @override
  @JsonKey(name: 'login_hit_count')
  final int loginHitCount;
  @override
  @JsonKey(name: 'is_temp_blocked')
  final int isTempBlocked;
  @override
  @JsonKey(name: 'temp_block_time')
  final dynamic tempBlockTime;
  @override
  @JsonKey(name: 'current_language_key')
  final String currentLanguageKey;
  @override
  @JsonKey(name: 'profile_image_full_path')
  final dynamic profileImageFullPath;
  final List<dynamic> _identificationImageFullPath;
  @override
  @JsonKey(name: 'identification_image_full_path')
  List<dynamic> get identificationImageFullPath {
    if (_identificationImageFullPath is EqualUnmodifiableListView)
      return _identificationImageFullPath;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_identificationImageFullPath);
  }

  @override
  final dynamic storage;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerCopyWith<_Customer> get copyWith =>
      __$CustomerCopyWithImpl<_Customer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Customer &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            const DeepCollectionEquality()
                .equals(other.identificationNumber, identificationNumber) &&
            (identical(other.identificationType, identificationType) ||
                other.identificationType == identificationType) &&
            const DeepCollectionEquality()
                .equals(other._identificationImage, _identificationImage) &&
            const DeepCollectionEquality()
                .equals(other.dateOfBirth, dateOfBirth) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.isPhoneVerified, isPhoneVerified) ||
                other.isPhoneVerified == isPhoneVerified) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                other.isEmailVerified == isEmailVerified) &&
            const DeepCollectionEquality()
                .equals(other.phoneVerifiedAt, phoneVerifiedAt) &&
            const DeepCollectionEquality()
                .equals(other.emailVerifiedAt, emailVerifiedAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            const DeepCollectionEquality()
                .equals(other.rememberToken, rememberToken) &&
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.walletBalance, walletBalance) ||
                other.walletBalance == walletBalance) &&
            (identical(other.loyaltyPoint, loyaltyPoint) ||
                other.loyaltyPoint == loyaltyPoint) &&
            (identical(other.refCode, refCode) || other.refCode == refCode) &&
            const DeepCollectionEquality()
                .equals(other.referredBy, referredBy) &&
            (identical(other.loginHitCount, loginHitCount) ||
                other.loginHitCount == loginHitCount) &&
            (identical(other.isTempBlocked, isTempBlocked) ||
                other.isTempBlocked == isTempBlocked) &&
            const DeepCollectionEquality()
                .equals(other.tempBlockTime, tempBlockTime) &&
            (identical(other.currentLanguageKey, currentLanguageKey) ||
                other.currentLanguageKey == currentLanguageKey) &&
            const DeepCollectionEquality()
                .equals(other.profileImageFullPath, profileImageFullPath) &&
            const DeepCollectionEquality().equals(
                other._identificationImageFullPath,
                _identificationImageFullPath) &&
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
        const DeepCollectionEquality().hash(identificationNumber),
        identificationType,
        const DeepCollectionEquality().hash(_identificationImage),
        const DeepCollectionEquality().hash(dateOfBirth),
        gender,
        profileImage,
        fcmToken,
        isPhoneVerified,
        isEmailVerified,
        const DeepCollectionEquality().hash(phoneVerifiedAt),
        const DeepCollectionEquality().hash(emailVerifiedAt),
        isActive,
        userType,
        const DeepCollectionEquality().hash(rememberToken),
        const DeepCollectionEquality().hash(deletedAt),
        createdAt,
        updatedAt,
        walletBalance,
        loyaltyPoint,
        refCode,
        const DeepCollectionEquality().hash(referredBy),
        loginHitCount,
        isTempBlocked,
        const DeepCollectionEquality().hash(tempBlockTime),
        currentLanguageKey,
        const DeepCollectionEquality().hash(profileImageFullPath),
        const DeepCollectionEquality().hash(_identificationImageFullPath),
        const DeepCollectionEquality().hash(storage)
      ]);

  @override
  String toString() {
    return 'Customer(id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, identificationNumber: $identificationNumber, identificationType: $identificationType, identificationImage: $identificationImage, dateOfBirth: $dateOfBirth, gender: $gender, profileImage: $profileImage, fcmToken: $fcmToken, isPhoneVerified: $isPhoneVerified, isEmailVerified: $isEmailVerified, phoneVerifiedAt: $phoneVerifiedAt, emailVerifiedAt: $emailVerifiedAt, isActive: $isActive, userType: $userType, rememberToken: $rememberToken, deletedAt: $deletedAt, createdAt: $createdAt, updatedAt: $updatedAt, walletBalance: $walletBalance, loyaltyPoint: $loyaltyPoint, refCode: $refCode, referredBy: $referredBy, loginHitCount: $loginHitCount, isTempBlocked: $isTempBlocked, tempBlockTime: $tempBlockTime, currentLanguageKey: $currentLanguageKey, profileImageFullPath: $profileImageFullPath, identificationImageFullPath: $identificationImageFullPath, storage: $storage)';
  }
}

/// @nodoc
abstract mixin class _$CustomerCopyWith<$Res>
    implements $CustomerCopyWith<$Res> {
  factory _$CustomerCopyWith(_Customer value, $Res Function(_Customer) _then) =
      __$CustomerCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'first_name') String firstName,
      @JsonKey(name: 'last_name') String lastName,
      String email,
      String phone,
      @JsonKey(name: 'identification_number') dynamic identificationNumber,
      @JsonKey(name: 'identification_type') String identificationType,
      @JsonKey(name: 'identification_image') List<dynamic> identificationImage,
      @JsonKey(name: 'date_of_birth') dynamic dateOfBirth,
      String gender,
      @JsonKey(name: 'profile_image') String profileImage,
      @JsonKey(name: 'fcm_token') String? fcmToken,
      @JsonKey(name: 'is_phone_verified') int isPhoneVerified,
      @JsonKey(name: 'is_email_verified') int isEmailVerified,
      @JsonKey(name: 'phone_verified_at') dynamic phoneVerifiedAt,
      @JsonKey(name: 'email_verified_at') dynamic emailVerifiedAt,
      @JsonKey(name: 'is_active') int isActive,
      @JsonKey(name: 'user_type') String userType,
      @JsonKey(name: 'remember_token') dynamic rememberToken,
      @JsonKey(name: 'deleted_at') dynamic deletedAt,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'wallet_balance') int walletBalance,
      @JsonKey(name: 'loyalty_point') int loyaltyPoint,
      @JsonKey(name: 'ref_code') String refCode,
      @JsonKey(name: 'referred_by') dynamic referredBy,
      @JsonKey(name: 'login_hit_count') int loginHitCount,
      @JsonKey(name: 'is_temp_blocked') int isTempBlocked,
      @JsonKey(name: 'temp_block_time') dynamic tempBlockTime,
      @JsonKey(name: 'current_language_key') String currentLanguageKey,
      @JsonKey(name: 'profile_image_full_path') dynamic profileImageFullPath,
      @JsonKey(name: 'identification_image_full_path')
      List<dynamic> identificationImageFullPath,
      dynamic storage});
}

/// @nodoc
class __$CustomerCopyWithImpl<$Res> implements _$CustomerCopyWith<$Res> {
  __$CustomerCopyWithImpl(this._self, this._then);

  final _Customer _self;
  final $Res Function(_Customer) _then;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? phone = null,
    Object? identificationNumber = freezed,
    Object? identificationType = null,
    Object? identificationImage = null,
    Object? dateOfBirth = freezed,
    Object? gender = null,
    Object? profileImage = null,
    Object? fcmToken = freezed,
    Object? isPhoneVerified = null,
    Object? isEmailVerified = null,
    Object? phoneVerifiedAt = freezed,
    Object? emailVerifiedAt = freezed,
    Object? isActive = null,
    Object? userType = null,
    Object? rememberToken = freezed,
    Object? deletedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? walletBalance = null,
    Object? loyaltyPoint = null,
    Object? refCode = null,
    Object? referredBy = freezed,
    Object? loginHitCount = null,
    Object? isTempBlocked = null,
    Object? tempBlockTime = freezed,
    Object? currentLanguageKey = null,
    Object? profileImageFullPath = freezed,
    Object? identificationImageFullPath = null,
    Object? storage = freezed,
  }) {
    return _then(_Customer(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      identificationNumber: freezed == identificationNumber
          ? _self.identificationNumber
          : identificationNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      identificationType: null == identificationType
          ? _self.identificationType
          : identificationType // ignore: cast_nullable_to_non_nullable
              as String,
      identificationImage: null == identificationImage
          ? _self._identificationImage
          : identificationImage // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      profileImage: null == profileImage
          ? _self.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String,
      fcmToken: freezed == fcmToken
          ? _self.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      isPhoneVerified: null == isPhoneVerified
          ? _self.isPhoneVerified
          : isPhoneVerified // ignore: cast_nullable_to_non_nullable
              as int,
      isEmailVerified: null == isEmailVerified
          ? _self.isEmailVerified
          : isEmailVerified // ignore: cast_nullable_to_non_nullable
              as int,
      phoneVerifiedAt: freezed == phoneVerifiedAt
          ? _self.phoneVerifiedAt
          : phoneVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _self.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isActive: null == isActive
          ? _self.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as int,
      userType: null == userType
          ? _self.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
      rememberToken: freezed == rememberToken
          ? _self.rememberToken
          : rememberToken // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      walletBalance: null == walletBalance
          ? _self.walletBalance
          : walletBalance // ignore: cast_nullable_to_non_nullable
              as int,
      loyaltyPoint: null == loyaltyPoint
          ? _self.loyaltyPoint
          : loyaltyPoint // ignore: cast_nullable_to_non_nullable
              as int,
      refCode: null == refCode
          ? _self.refCode
          : refCode // ignore: cast_nullable_to_non_nullable
              as String,
      referredBy: freezed == referredBy
          ? _self.referredBy
          : referredBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
      loginHitCount: null == loginHitCount
          ? _self.loginHitCount
          : loginHitCount // ignore: cast_nullable_to_non_nullable
              as int,
      isTempBlocked: null == isTempBlocked
          ? _self.isTempBlocked
          : isTempBlocked // ignore: cast_nullable_to_non_nullable
              as int,
      tempBlockTime: freezed == tempBlockTime
          ? _self.tempBlockTime
          : tempBlockTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      currentLanguageKey: null == currentLanguageKey
          ? _self.currentLanguageKey
          : currentLanguageKey // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageFullPath: freezed == profileImageFullPath
          ? _self.profileImageFullPath
          : profileImageFullPath // ignore: cast_nullable_to_non_nullable
              as dynamic,
      identificationImageFullPath: null == identificationImageFullPath
          ? _self._identificationImageFullPath
          : identificationImageFullPath // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      storage: freezed == storage
          ? _self.storage
          : storage // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

// dart format on
