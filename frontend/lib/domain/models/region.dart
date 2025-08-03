import 'package:flame/game.dart';

class Region {
  final String id;
  final List<Vector2> vertices;
  final int slots;

  const Region({
    required this.id,
    required this.vertices,
    required this.slots,
  });
}
