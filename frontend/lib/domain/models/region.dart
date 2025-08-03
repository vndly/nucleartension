import 'package:flame/game.dart';

class Region {
  final String id;
  late final Vector2 position;
  late final Vector2 size;
  final List<Vector2> vertices;
  final int slots;

  Region({
    required this.id,
    required this.vertices,
    required this.slots,
  }) {
    position = Vector2(0, 0);
    size = Vector2.all(0);
  }
}
