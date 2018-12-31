import 'package:mnt_flutter/data/entities/equipment.dart';

class ServiceOrder {
  const ServiceOrder({this.equipment, this.id, this.expectedFinishDate});

  final Equipment equipment;
  final String id;
  final DateTime expectedFinishDate;
}
