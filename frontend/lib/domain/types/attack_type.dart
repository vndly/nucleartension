import 'dart:ui';
import 'package:nucleartension/utils/palette.dart';

enum AttackType {
  incoming(color: Palette.textAttackIncoming),
  outgoing(color: Palette.textAttackOutgoing);

  final Color color;

  const AttackType({required this.color});
}
