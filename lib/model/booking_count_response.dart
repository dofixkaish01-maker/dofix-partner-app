import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_count_response.freezed.dart';
part 'booking_count_response.g.dart';

@freezed
class BookingCountResponse with _$BookingCountResponse {
  const factory BookingCountResponse({
    @JsonKey(name: 'response_code') String? responseCode,
    String? message,
    BookingContent? content,
    List<dynamic>? errors,
  }) = _BookingCountResponse;

  factory BookingCountResponse.fromJson(Map<String, dynamic> json) =>
      _$BookingCountResponseFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class BookingContent with _$BookingContent {
  const factory BookingContent({
    @JsonKey(name: 'bookings_count') BookingsCount? bookingsCount,
  }) = _BookingContent;

  factory BookingContent.fromJson(Map<String, dynamic> json) =>
      _$BookingContentFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

@freezed
class BookingsCount with _$BookingsCount {
  const factory BookingsCount({
    int? pending,
    int? accepted,
    int? ongoing,
    int? completed,
    int? canceled,
    @JsonKey(name: 'total_bookings') int? total,
  }) = _BookingsCount;

  factory BookingsCount.fromJson(Map<String, dynamic> json) =>
      _$BookingsCountFromJson(json);

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
