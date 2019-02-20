// ignore: avoid_classes_with_only_static_members
import 'package:mnt_flutter/data/source/equipment/equipment_data_source.dart';
import 'package:mnt_flutter/data/source/equipment/equipment_repository.dart';
import 'package:mnt_flutter/data/source/equipment/local/equipment_local_data_source.dart';


// ignore: avoid_classes_with_only_static_members
class Inject {
  static EquipmentDataSource get _localEquipmentRepo =>
      EquipmentLocalDataSource();

  static EquipmentRepository Function() equipmentRepo = _singleton(() {
    return EquipmentRepository(_localEquipmentRepo);
  });

  static T Function() _singleton<T>(T create()) {
    T instance;
    return () => instance ??= create();
  }
}
