import 'package:mnt_flutter/data/entities/equipment.dart';
import 'package:mnt_flutter/data/entities/order_service.dart';

class ServiceOrder {
  const ServiceOrder({
    this.id,
    this.equipment,
    this.expectedFinishDate,
    this.service
  });

  final Equipment equipment;
  final OrderService service;
  final String id;
  final DateTime expectedFinishDate;
}
