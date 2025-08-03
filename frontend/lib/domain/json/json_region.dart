import 'package:json_annotation/json_annotation.dart';
import 'json_position.dart';

part 'json_region.g.dart';

@JsonSerializable()
class JsonRegion {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'slots')
  final int slots;

  @JsonKey(name: 'vertices')
  final List<JsonPosition> vertices;

  JsonRegion({
    required this.id,
    required this.slots,
    required this.vertices,
  });

  factory JsonRegion.fromJson(Map<String, dynamic> json) =>
      _$JsonRegionFromJson(json);

  Map<String, dynamic> toJson() => _$JsonRegionToJson(this);
}
