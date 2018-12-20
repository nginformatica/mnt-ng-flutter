import 'package:flutter/material.dart';

class MntHomeScreen extends StatefulWidget {
  MntHomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MntHomeScreenState createState() => new _MntHomeScreenState();
}

class _MntHomeScreenState extends State<MntHomeScreen> {
  int _currentIndex = 0;
  final List<Widget> children = [
    _HelloScreen("First"),
    _HelloScreen("Second"),
    _HelloScreen("Third"),
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
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text("")),
        BottomNavigationBarItem(icon: Icon(Icons.wrap_text), title: Text(""))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigoAccent,
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
