import 'dart:math';

import 'package:mnt_flutter/data/entities/counter.dart';
import 'package:mnt_flutter/data/entities/equipment.dart';
import 'package:mnt_flutter/data/source/equipment/equipment_data_source.dart';
import 'package:rxdart/rxdart.dart';

class EquipmentLocalDataSource implements EquipmentDataSource {
  EquipmentLocalDataSource() {
    _equipmentSubject.add(_equipmentList);
  }

  static final _equipmentSubject = BehaviorSubject<List<Equipment>>();

  static final _equipmentList = List.generate(
      100,
      (index) => Equipment(
          name: 'CONDICIONADOR DE AR',
          id: 'AC0$index',
          localization: 'Ferramentaria',
          counters: List.generate(2, (index) {
            return Counter(name: 'Horimetro', value: Random().nextInt(8001));
          })));

  @override
  void createEquipment(Equipment equipment) {
    _equipmentList.add(equipment);
    _equipmentSubject.add(_equipmentList);
  }

  @override
  void deleteAllEquipments() {
    _equipmentList.clear();
    _equipmentSubject.add(_equipmentList);
  }

  @override
  void updateEquipment(Equipment equipment) {
    final index = _equipmentList.indexWhere((item) => item.id == equipment.id);

    if (index != -1) {
      _equipmentList[index] = equipment;
      _equipmentSubject.add(_equipmentList);
    }
  }

  @override
  Observable<List<Equipment>> getEquipments() {
    return _equipmentSubject;
  }
}
