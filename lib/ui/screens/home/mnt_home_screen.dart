import 'package:flutter/material.dart';

class MntHomeScreen extends StatefulWidget {
  MntHomeScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MntHomeScreenState createState() => new _MntHomeScreenState();
}

class _MntHomeScreenState extends State<MntHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  BottomNavigationBar _buildBottomNavigation() {
    return BottomNavigationBar(
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
        body: Stack(
          children: <Widget>[
            Center(
              child: Text(
                'Hello',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        ));
  }
}
