import 'package:flutter/material.dart';
import 'package:mnt_flutter/data/entities/equipment.dart';
import 'package:mnt_flutter/data/entities/order_service.dart';
import 'package:mnt_flutter/data/entities/service_order.dart';
import 'package:mnt_flutter/ui/widgets/cards/service_order_card.dart';

class ServiceOrderScreen extends StatefulWidget {
  @override
  _ServiceOrderScreenState createState() => _ServiceOrderScreenState();
}

class _ServiceOrderScreenState extends State<ServiceOrderScreen> {
  static const int generateCount = 100;

  @override
  Widget build(BuildContext context) {
    const equipment = Equipment(
      id: 'Moto Z001',
      localization: 'Ferramentaria',
      name: 'Servo Motor Grande',
    );

    const service = OrderService(
      id: 'Moto Z001',
      name: 'Servo Motor Grande',
      type: OrderServiceType.corrective
    );

    final order = ServiceOrder(
        id: '007296',
        expectedFinishDate: DateTime(2005, 03, 28, 0, 12),
        equipment: equipment,
        service: service
    );

    return ListView(
        children: List.generate(generateCount, (index) {
          return ServiceOrderCard(order);
        })
    );
  }
}
