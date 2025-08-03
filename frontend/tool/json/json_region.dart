import 'package:json_annotation/json_annotation.dart';
import 'json_vertex.dart';

part 'json_region.g.dart';

@JsonSerializable()
class JsonRegion {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'vertices')
  final Vertices vertices;

  JsonRegion({required this.id, required this.vertices});

  factory JsonRegion.fromJson(Map<String, dynamic> json) =>
      _$JsonRegionFromJson(json);

  Map<String, dynamic> toJson() => _$JsonRegionToJson(this);
}
