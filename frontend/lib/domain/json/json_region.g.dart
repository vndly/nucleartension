// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'json_region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JsonRegion _$JsonRegionFromJson(Map<String, dynamic> json) => JsonRegion(
  id: json['id'] as String,
  vertices: (json['vertices'] as List<dynamic>)
      .map((e) => (e as List<dynamic>).map((e) => (e as num).toInt()).toList())
      .toList(),
);

Map<String, dynamic> _$JsonRegionToJson(JsonRegion instance) =>
    <String, dynamic>{'id': instance.id, 'vertices': instance.vertices};
