import 'package:flutter/material.dart';
import 'package:mnt_flutter/data/entities/equipment.dart';
import 'package:mnt_flutter/data/entities/service_order.dart';
import 'package:mnt_flutter/ui/widgets/cards/service_order_card.dart';

class ServiceOrderScreen extends StatefulWidget {
  @override
  _ServiceOrderScreenState createState() => _ServiceOrderScreenState();
}

class _ServiceOrderScreenState extends State<ServiceOrderScreen> {
  static const int generateCount = 100;

  @override
  Widget build(BuildContext context) => ListView(
          children: List.generate(generateCount, (index) {
        final order = ServiceOrder(
          id: '007296',
          expectedFinishDate: DateTime(2005, 03, 28, 0, 12),
          equipment: Equipment(
              id: 'Moto Z001',
              localization: 'Unknown',
              name: 'Servo Motor Grande'),
        );

        return ServiceOrderCard(order);
      }));
}
