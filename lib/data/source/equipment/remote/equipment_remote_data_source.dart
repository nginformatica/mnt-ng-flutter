import 'package:mnt_flutter/data/entities/equipment.dart';
import 'package:mnt_flutter/data/source/equipment/equipment_data_source.dart';
import 'package:rxdart/rxdart.dart';

class EquipmentRemoteDataSource implements EquipmentDataSource {

  @override
  void createEquipment(Equipment equipment) {
    throw UnimplementedError();
  }

  @override
  void deleteAllEquipments() {
    throw UnimplementedError();
  }

  @override
  void updateEquipment(Equipment equipment) {
    throw UnimplementedError();
  }

  @override
  Observable<List<Equipment>> getEquipments() {
    throw UnimplementedError();
  }
}
