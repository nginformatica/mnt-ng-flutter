import 'package:flutter/material.dart';

class ServiceOrderCard extends StatelessWidget {
  static const statusWidth = 130.0;
  final int index;

  const ServiceOrderCard(this.index);

  Widget _buildCardWrapper({@required List<Widget> children}) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
                height: 184.0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: children,
                ))
          ],
        ),
      ),
    );
  }

  Widget _buildCardDataSpace(
      {@required List<Widget> children, @required Color color}) {
    return Container(
      color: color,
      child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: children,
          )),
    );
  }

  Widget _buildCardStatusView() {
    return _buildCardDataSpace(
        color: Colors.blue, children: <Widget>[Text("A  AA")]);
  }

  @override
  Widget build(BuildContext context) {
    return _buildCardWrapper(children: <Widget>[
      SizedBox(
        child: _buildCardStatusView(),
        width: statusWidth,
      ),
      Expanded(
        child: _buildCardDataSpace(
          children: <Widget>[Text("A  AA")],
          color: Colors.white,
        ),
      )
    ]);
  }
}
