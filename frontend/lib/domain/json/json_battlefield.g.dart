// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_battlefield.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonBattlefield _$JsonBattlefieldFromJson(Map<String, dynamic> json) =>
    JsonBattlefield(
      id: json['id'] as String,
      width: (json['width'] as num).toInt(),
      height: (json['height'] as num).toInt(),
      regions: (json['regions'] as List<dynamic>)
          .map((e) => JsonRegion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$JsonBattlefieldToJson(JsonBattlefield instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'regions': instance.regions,
    };
