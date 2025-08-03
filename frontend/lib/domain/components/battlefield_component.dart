import 'package:flame/components.dart';
import 'package:nucleartension/domain/components/region/region_component.dart';
import 'package:nucleartension/domain/models/battlefield.dart';
import 'package:nucleartension/domain/models/region.dart';

class BattlefieldComponent extends World {
  final Battlefield battlefield;

  BattlefieldComponent({required this.battlefield});

  @override
  Future onLoad() async {
    for (final Region region in battlefield.regions) {
      add(
        RegionComponent(
          region: region,
        ),
      );
    }
  }

  void unselectAllRegions() {
    /*for (final RegionComponent component
        in children.whereType<RegionComponent>()) {
      component.unselect();
    }*/
  }
}
