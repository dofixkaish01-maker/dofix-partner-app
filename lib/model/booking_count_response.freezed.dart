// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_count_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BookingCountResponse {
  @JsonKey(name: 'response_code')
  String? get responseCode;
  String? get message;
  BookingContent? get content;
  List<dynamic>? get errors;

  /// Create a copy of BookingCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookingCountResponseCopyWith<BookingCountResponse> get copyWith =>
      _$BookingCountResponseCopyWithImpl<BookingCountResponse>(
          this as BookingCountResponse, _$identity);

  /// Serializes this BookingCountResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookingCountResponse &&
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
    return 'BookingCountResponse(responseCode: $responseCode, message: $message, content: $content, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class $BookingCountResponseCopyWith<$Res> {
  factory $BookingCountResponseCopyWith(BookingCountResponse value,
          $Res Function(BookingCountResponse) _then) =
      _$BookingCountResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'response_code') String? responseCode,
      String? message,
      BookingContent? content,
      List<dynamic>? errors});

  $BookingContentCopyWith<$Res>? get content;
}

/// @nodoc
class _$BookingCountResponseCopyWithImpl<$Res>
    implements $BookingCountResponseCopyWith<$Res> {
  _$BookingCountResponseCopyWithImpl(this._self, this._then);

  final BookingCountResponse _self;
  final $Res Function(BookingCountResponse) _then;

  /// Create a copy of BookingCountResponse
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
              as BookingContent?,
      errors: freezed == errors
          ? _self.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }

  /// Create a copy of BookingCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookingContentCopyWith<$Res>? get content {
    if (_self.content == null) {
      return null;
    }

    return $BookingContentCopyWith<$Res>(_self.content!, (value) {
      return _then(_self.copyWith(content: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _BookingCountResponse implements BookingCountResponse {
  const _BookingCountResponse(
      {@JsonKey(name: 'response_code') this.responseCode,
      this.message,
      this.content,
      final List<dynamic>? errors})
      : _errors = errors;
  factory _BookingCountResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingCountResponseFromJson(json);

  @override
  @JsonKey(name: 'response_code')
  final String? responseCode;
  @override
  final String? message;
  @override
  final BookingContent? content;
  final List<dynamic>? _errors;
  @override
  List<dynamic>? get errors {
    final value = _errors;
    if (value == null) return null;
    if (_errors is EqualUnmodifiableListView) return _errors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of BookingCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BookingCountResponseCopyWith<_BookingCountResponse> get copyWith =>
      __$BookingCountResponseCopyWithImpl<_BookingCountResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BookingCountResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BookingCountResponse &&
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
    return 'BookingCountResponse(responseCode: $responseCode, message: $message, content: $content, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class _$BookingCountResponseCopyWith<$Res>
    implements $BookingCountResponseCopyWith<$Res> {
  factory _$BookingCountResponseCopyWith(_BookingCountResponse value,
          $Res Function(_BookingCountResponse) _then) =
      __$BookingCountResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'response_code') String? responseCode,
      String? message,
      BookingContent? content,
      List<dynamic>? errors});

  @override
  $BookingContentCopyWith<$Res>? get content;
}

/// @nodoc
class __$BookingCountResponseCopyWithImpl<$Res>
    implements _$BookingCountResponseCopyWith<$Res> {
  __$BookingCountResponseCopyWithImpl(this._self, this._then);

  final _BookingCountResponse _self;
  final $Res Function(_BookingCountResponse) _then;

  /// Create a copy of BookingCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? responseCode = freezed,
    Object? message = freezed,
    Object? content = freezed,
    Object? errors = freezed,
  }) {
    return _then(_BookingCountResponse(
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
              as BookingContent?,
      errors: freezed == errors
          ? _self._errors
          : errors // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }

  /// Create a copy of BookingCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookingContentCopyWith<$Res>? get content {
    if (_self.content == null) {
      return null;
    }

    return $BookingContentCopyWith<$Res>(_self.content!, (value) {
      return _then(_self.copyWith(content: value));
    });
  }
}

/// @nodoc
mixin _$BookingContent {
  @JsonKey(name: 'bookings_count')
  BookingsCount? get bookingsCount;

  /// Create a copy of BookingContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookingContentCopyWith<BookingContent> get copyWith =>
      _$BookingContentCopyWithImpl<BookingContent>(
          this as BookingContent, _$identity);

  /// Serializes this BookingContent to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookingContent &&
            (identical(other.bookingsCount, bookingsCount) ||
                other.bookingsCount == bookingsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bookingsCount);

  @override
  String toString() {
    return 'BookingContent(bookingsCount: $bookingsCount)';
  }
}

/// @nodoc
abstract mixin class $BookingContentCopyWith<$Res> {
  factory $BookingContentCopyWith(
          BookingContent value, $Res Function(BookingContent) _then) =
      _$BookingContentCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'bookings_count') BookingsCount? bookingsCount});

  $BookingsCountCopyWith<$Res>? get bookingsCount;
}

/// @nodoc
class _$BookingContentCopyWithImpl<$Res>
    implements $BookingContentCopyWith<$Res> {
  _$BookingContentCopyWithImpl(this._self, this._then);

  final BookingContent _self;
  final $Res Function(BookingContent) _then;

  /// Create a copy of BookingContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingsCount = freezed,
  }) {
    return _then(_self.copyWith(
      bookingsCount: freezed == bookingsCount
          ? _self.bookingsCount
          : bookingsCount // ignore: cast_nullable_to_non_nullable
              as BookingsCount?,
    ));
  }

  /// Create a copy of BookingContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookingsCountCopyWith<$Res>? get bookingsCount {
    if (_self.bookingsCount == null) {
      return null;
    }

    return $BookingsCountCopyWith<$Res>(_self.bookingsCount!, (value) {
      return _then(_self.copyWith(bookingsCount: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _BookingContent implements BookingContent {
  const _BookingContent({@JsonKey(name: 'bookings_count') this.bookingsCount});
  factory _BookingContent.fromJson(Map<String, dynamic> json) =>
      _$BookingContentFromJson(json);

  @override
  @JsonKey(name: 'bookings_count')
  final BookingsCount? bookingsCount;

  /// Create a copy of BookingContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BookingContentCopyWith<_BookingContent> get copyWith =>
      __$BookingContentCopyWithImpl<_BookingContent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BookingContentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BookingContent &&
            (identical(other.bookingsCount, bookingsCount) ||
                other.bookingsCount == bookingsCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bookingsCount);

  @override
  String toString() {
    return 'BookingContent(bookingsCount: $bookingsCount)';
  }
}

/// @nodoc
abstract mixin class _$BookingContentCopyWith<$Res>
    implements $BookingContentCopyWith<$Res> {
  factory _$BookingContentCopyWith(
          _BookingContent value, $Res Function(_BookingContent) _then) =
      __$BookingContentCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'bookings_count') BookingsCount? bookingsCount});

  @override
  $BookingsCountCopyWith<$Res>? get bookingsCount;
}

/// @nodoc
class __$BookingContentCopyWithImpl<$Res>
    implements _$BookingContentCopyWith<$Res> {
  __$BookingContentCopyWithImpl(this._self, this._then);

  final _BookingContent _self;
  final $Res Function(_BookingContent) _then;

  /// Create a copy of BookingContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bookingsCount = freezed,
  }) {
    return _then(_BookingContent(
      bookingsCount: freezed == bookingsCount
          ? _self.bookingsCount
          : bookingsCount // ignore: cast_nullable_to_non_nullable
              as BookingsCount?,
    ));
  }

  /// Create a copy of BookingContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $BookingsCountCopyWith<$Res>? get bookingsCount {
    if (_self.bookingsCount == null) {
      return null;
    }

    return $BookingsCountCopyWith<$Res>(_self.bookingsCount!, (value) {
      return _then(_self.copyWith(bookingsCount: value));
    });
  }
}

/// @nodoc
mixin _$BookingsCount {
  int? get pending;
  int? get accepted;
  int? get ongoing;
  int? get completed;
  int? get canceled;
  @JsonKey(name: 'total_bookings')
  int? get total;

  /// Create a copy of BookingsCount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BookingsCountCopyWith<BookingsCount> get copyWith =>
      _$BookingsCountCopyWithImpl<BookingsCount>(
          this as BookingsCount, _$identity);

  /// Serializes this BookingsCount to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BookingsCount &&
            (identical(other.pending, pending) || other.pending == pending) &&
            (identical(other.accepted, accepted) ||
                other.accepted == accepted) &&
            (identical(other.ongoing, ongoing) || other.ongoing == ongoing) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.canceled, canceled) ||
                other.canceled == canceled) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, pending, accepted, ongoing, completed, canceled, total);

  @override
  String toString() {
    return 'BookingsCount(pending: $pending, accepted: $accepted, ongoing: $ongoing, completed: $completed, canceled: $canceled, total: $total)';
  }
}

/// @nodoc
abstract mixin class $BookingsCountCopyWith<$Res> {
  factory $BookingsCountCopyWith(
          BookingsCount value, $Res Function(BookingsCount) _then) =
      _$BookingsCountCopyWithImpl;
  @useResult
  $Res call(
      {int? pending,
      int? accepted,
      int? ongoing,
      int? completed,
      int? canceled,
      @JsonKey(name: 'total_bookings') int? total});
}

/// @nodoc
class _$BookingsCountCopyWithImpl<$Res>
    implements $BookingsCountCopyWith<$Res> {
  _$BookingsCountCopyWithImpl(this._self, this._then);

  final BookingsCount _self;
  final $Res Function(BookingsCount) _then;

  /// Create a copy of BookingsCount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pending = freezed,
    Object? accepted = freezed,
    Object? ongoing = freezed,
    Object? completed = freezed,
    Object? canceled = freezed,
    Object? total = freezed,
  }) {
    return _then(_self.copyWith(
      pending: freezed == pending
          ? _self.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as int?,
      accepted: freezed == accepted
          ? _self.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as int?,
      ongoing: freezed == ongoing
          ? _self.ongoing
          : ongoing // ignore: cast_nullable_to_non_nullable
              as int?,
      completed: freezed == completed
          ? _self.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as int?,
      canceled: freezed == canceled
          ? _self.canceled
          : canceled // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BookingsCount implements BookingsCount {
  const _BookingsCount(
      {this.pending,
      this.accepted,
      this.ongoing,
      this.completed,
      this.canceled,
      @JsonKey(name: 'total_bookings') this.total});
  factory _BookingsCount.fromJson(Map<String, dynamic> json) =>
      _$BookingsCountFromJson(json);

  @override
  final int? pending;
  @override
  final int? accepted;
  @override
  final int? ongoing;
  @override
  final int? completed;
  @override
  final int? canceled;
  @override
  @JsonKey(name: 'total_bookings')
  final int? total;

  /// Create a copy of BookingsCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BookingsCountCopyWith<_BookingsCount> get copyWith =>
      __$BookingsCountCopyWithImpl<_BookingsCount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BookingsCountToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BookingsCount &&
            (identical(other.pending, pending) || other.pending == pending) &&
            (identical(other.accepted, accepted) ||
                other.accepted == accepted) &&
            (identical(other.ongoing, ongoing) || other.ongoing == ongoing) &&
            (identical(other.completed, completed) ||
                other.completed == completed) &&
            (identical(other.canceled, canceled) ||
                other.canceled == canceled) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, pending, accepted, ongoing, completed, canceled, total);

  @override
  String toString() {
    return 'BookingsCount(pending: $pending, accepted: $accepted, ongoing: $ongoing, completed: $completed, canceled: $canceled, total: $total)';
  }
}

/// @nodoc
abstract mixin class _$BookingsCountCopyWith<$Res>
    implements $BookingsCountCopyWith<$Res> {
  factory _$BookingsCountCopyWith(
          _BookingsCount value, $Res Function(_BookingsCount) _then) =
      __$BookingsCountCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? pending,
      int? accepted,
      int? ongoing,
      int? completed,
      int? canceled,
      @JsonKey(name: 'total_bookings') int? total});
}

/// @nodoc
class __$BookingsCountCopyWithImpl<$Res>
    implements _$BookingsCountCopyWith<$Res> {
  __$BookingsCountCopyWithImpl(this._self, this._then);

  final _BookingsCount _self;
  final $Res Function(_BookingsCount) _then;

  /// Create a copy of BookingsCount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pending = freezed,
    Object? accepted = freezed,
    Object? ongoing = freezed,
    Object? completed = freezed,
    Object? canceled = freezed,
    Object? total = freezed,
  }) {
    return _then(_BookingsCount(
      pending: freezed == pending
          ? _self.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as int?,
      accepted: freezed == accepted
          ? _self.accepted
          : accepted // ignore: cast_nullable_to_non_nullable
              as int?,
      ongoing: freezed == ongoing
          ? _self.ongoing
          : ongoing // ignore: cast_nullable_to_non_nullable
              as int?,
      completed: freezed == completed
          ? _self.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as int?,
      canceled: freezed == canceled
          ? _self.canceled
          : canceled // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
