import 'package:flutter/material.dart';
import 'package:mnt_flutter/constants/custom_colors.dart';
import 'package:mnt_flutter/ui/screens/service/order/service_order_screen.dart';

class MntHomeScreen extends StatefulWidget {
  MntHomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MntHomeScreenState createState() => new _MntHomeScreenState();
}

class _MntHomeScreenState extends State<MntHomeScreen> {
  int _currentIndex = 1;
  final List<Widget> children = [
    _HelloScreen("Second"),
    ServiceOrderScreen(),
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

  BottomNavigationBar _buildBottomNavigation() {
    return BottomNavigationBar(
      onTap: _onTabTapped,
      currentIndex: _currentIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.receipt), title: Text("S.S.")),
        BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("O.S."))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.defaultListBackground,
        bottomNavigationBar: _buildBottomNavigation(),
        body: children[_currentIndex]);
  }
}

class _HelloScreen extends StatelessWidget {
  final String message;

  const _HelloScreen(this.message);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Text(
            'Hello ${message}',
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      ],
    );
  }
}
