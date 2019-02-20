import 'package:mnt_flutter/data/entities/equipment.dart';
import 'package:rxdart/rxdart.dart';

abstract class EquipmentDataSource {
  void createEquipment(Equipment equipment);

  Observable<List<Equipment>> getEquipments();

  void updateEquipment(Equipment equipment);

  void deleteAllEquipments();
}
