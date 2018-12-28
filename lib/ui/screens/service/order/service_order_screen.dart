import 'package:flutter/material.dart';
import 'package:mnt_flutter/ui/widgets/cards/service_order_card.dart';

class ServiceOrderScreen extends StatefulWidget {
  @override
  _ServiceOrderScreenState createState() => _ServiceOrderScreenState();
}

class _ServiceOrderScreenState extends State<ServiceOrderScreen> {
  static const int generateCount = 100;

  @override
  Widget build(BuildContext context) => ListView(
      children:
          List.generate(generateCount, (index) => ServiceOrderCard(index)));
}
