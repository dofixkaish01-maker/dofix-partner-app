// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'provider_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProviderModel _$ProviderModelFromJson(Map<String, dynamic> json) =>
    ProviderModel(
      responseCode: json['responseCode'] as String?,
      message: json['message'] as String?,
      content: json['content'] == null
          ? null
          : Provider.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProviderModelToJson(ProviderModel instance) =>
    <String, dynamic>{
      'responseCode': instance.responseCode,
      'message': instance.message,
      'content': instance.content?.toJson(),
    };
