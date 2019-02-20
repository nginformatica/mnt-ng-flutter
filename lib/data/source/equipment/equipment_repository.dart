import 'package:mnt_flutter/data/entities/equipment.dart';
import 'package:mnt_flutter/data/source/equipment/equipment_data_source.dart';
import 'package:mnt_flutter/data/source/equipment/local/equipment_local_data_source.dart';
import 'package:mnt_flutter/data/source/equipment/remote/equipment_remote_data_source.dart';
import 'package:rxdart/rxdart.dart';

class EquipmentRepository extends EquipmentDataSource {
  EquipmentRepository(this._localDataSource);

  EquipmentDataSource _localDataSource;

  @override
  void createEquipment(Equipment equipment) {
    _localDataSource.createEquipment(equipment);
  }

  @override
  void deleteAllEquipments() {}

  @override
  void updateEquipment(Equipment equipment) {}

  @override
  Observable<List<Equipment>> getEquipments() {
    return _localDataSource.getEquipments();
  }

  void refreshTask() {
    //_isCacheDirty = true;
  }
}
