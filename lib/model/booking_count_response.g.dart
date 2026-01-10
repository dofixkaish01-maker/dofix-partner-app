// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_count_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookingCountResponse _$BookingCountResponseFromJson(
        Map<String, dynamic> json) =>
    _BookingCountResponse(
      responseCode: json['response_code'] as String?,
      message: json['message'] as String?,
      content: json['content'] == null
          ? null
          : BookingContent.fromJson(json['content'] as Map<String, dynamic>),
      errors: json['errors'] as List<dynamic>?,
    );

Map<String, dynamic> _$BookingCountResponseToJson(
        _BookingCountResponse instance) =>
    <String, dynamic>{
      'response_code': instance.responseCode,
      'message': instance.message,
      'content': instance.content,
      'errors': instance.errors,
    };

_BookingContent _$BookingContentFromJson(Map<String, dynamic> json) =>
    _BookingContent(
      bookingsCount: json['bookings_count'] == null
          ? null
          : BookingsCount.fromJson(
              json['bookings_count'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookingContentToJson(_BookingContent instance) =>
    <String, dynamic>{
      'bookings_count': instance.bookingsCount,
    };

_BookingsCount _$BookingsCountFromJson(Map<String, dynamic> json) =>
    _BookingsCount(
      pending: (json['pending'] as num?)?.toInt(),
      accepted: (json['accepted'] as num?)?.toInt(),
      ongoing: (json['ongoing'] as num?)?.toInt(),
      completed: (json['completed'] as num?)?.toInt(),
      canceled: (json['canceled'] as num?)?.toInt(),
      total: (json['total_bookings'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BookingsCountToJson(_BookingsCount instance) =>
    <String, dynamic>{
      'pending': instance.pending,
      'accepted': instance.accepted,
      'ongoing': instance.ongoing,
      'completed': instance.completed,
      'canceled': instance.canceled,
      'total_bookings': instance.total,
    };
