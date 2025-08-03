import 'package:json_annotation/json_annotation.dart';
import 'json_region.dart';

part 'json_battlefield.g.dart';

@JsonSerializable()
class JsonBattlefield {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'width')
  final int width;

  @JsonKey(name: 'height')
  final int height;

  @JsonKey(name: 'regions')
  final List<JsonRegion> regions;

  const JsonBattlefield({
    required this.id,
    required this.width,
    required this.height,
    required this.regions,
  });

  factory JsonBattlefield.fromJson(Map<String, dynamic> json) =>
      _$JsonBattlefieldFromJson(json);

  Map<String, dynamic> toJson() => _$JsonBattlefieldToJson(this);
}
