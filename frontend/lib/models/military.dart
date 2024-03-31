class Military {
  int power;
  int defenseMissiles;
  int attackMissiles;

  Military({
    required this.power,
    required this.defenseMissiles,
    required this.attackMissiles,
  });

  bool get hasPower => power > 0;

  bool get hasAttackMissiles => attackMissiles > 0;
}
