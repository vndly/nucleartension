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
    position = _center(vertices);
    size = _size(vertices);
  }

  Vector2 _center(List<Vector2> vertices) {
    double sumX = 0;
    double sumY = 0;

    for (final Vector2 vertex in vertices) {
      sumX += vertex.x;
      sumY += vertex.y;
    }

    return Vector2(sumX / vertices.length, sumY / vertices.length);
  }

  Vector2 _size(List<Vector2> vertices) {
    double minX = vertices.first.x;
    double maxX = vertices.first.x;
    double minY = vertices.first.y;
    double maxY = vertices.first.y;

    for (final Vector2 vertex in vertices) {
      if (vertex.x < minX) {
        minX = vertex.x;
      }
      if (vertex.x > maxX) {
        maxX = vertex.x;
      }
      if (vertex.y < minY) {
        minY = vertex.y;
      }
      if (vertex.y > maxY) {
        maxY = vertex.y;
      }
    }

    return Vector2(maxX - minX, maxY - minY);
  }
}
