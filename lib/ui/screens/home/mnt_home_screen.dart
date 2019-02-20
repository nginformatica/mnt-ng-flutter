import 'package:flutter/material.dart';
import 'package:mnt_flutter/constants/custom_colors.dart';
import 'package:mnt_flutter/ui/screens/counters/list/counters_list_screen.dart';
import 'package:mnt_flutter/ui/screens/service/order/list/service_order_list_screen.dart';

class MntHomeScreen extends StatefulWidget {
  const MntHomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MntHomeScreenState createState() => _MntHomeScreenState();
}

class _MntHomeScreenState extends State<MntHomeScreen> {
  int _currentIndex = 1;
  final List<Widget> children = [
    const _HelloScreen('Second'),
    ServiceOrderListScreen(),
    CountersListScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  BottomNavigationBar _buildBottomNavigation() => BottomNavigationBar(
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt),
              title: Text('S.S.')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('O.S.')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.av_timer),
              title: Text('Contadores')
          )
        ],
      );

  @override
  Widget build(BuildContext context){ 
    return Scaffold(
      backgroundColor: defaultListBackground,
      bottomNavigationBar: _buildBottomNavigation(),
      body: children[_currentIndex]);
  }
}

class _HelloScreen extends StatelessWidget {
  const _HelloScreen(this.message);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Text(
            'Hello $message',
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      ],
    );
  }
}
