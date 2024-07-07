import 'package:hive/hive.dart';

part 'hive_place_names.g.dart';

@HiveType(typeId: 2)
class HivePlaceNames extends HiveObject {
  HivePlaceNames({required this.placeNames});

  @HiveField(0)
  List<String> placeNames;
}
