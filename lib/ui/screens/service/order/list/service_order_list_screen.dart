import 'package:flutter/material.dart';
import 'package:mnt_flutter/data/entities/equipment.dart';
import 'package:mnt_flutter/data/entities/order_service.dart';
import 'package:mnt_flutter/data/entities/service_order.dart';
import 'package:mnt_flutter/navigation/router.dart';
import 'package:mnt_flutter/ui/widgets/cards/service_order_card.dart';

class ServiceOrderListScreen extends StatefulWidget {
  @override
  _ServiceOrderListScreenState createState() => _ServiceOrderListScreenState();
}

class _ServiceOrderListScreenState extends State<ServiceOrderListScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  static const int generateCount = 100;


  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        vsync: this,
        initialIndex: 1,
        length: 4
    );
  }

  Widget _buildMockedList(){
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ordens de Serviço'),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.accents.first,
          tabs: const <Widget>[
            Tab(text: 'Dia'),
            Tab(text: 'Semana'),
            Tab(text: 'Mes'),
            Tab(text: 'Todas'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red[800],
        child: const Icon(Icons.add),
        onPressed: (){
          goToCreateOrder(context);
        }
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          _buildMockedList(),
          _buildMockedList(),
          _buildMockedList(),
          _buildMockedList(),
        ],
      )
    );
  }
}
