import 'package:flutter/material.dart';

class ServiceOrderCard extends StatelessWidget {
  static const statusWidth = 130.0;
  static const cardHeight = 185.0;
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
                height: cardHeight,
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

  Widget _buildCardStatusView(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final orderIdStyle = theme.textTheme.title.copyWith(color: Colors.white);
    final statusTimeStyle = theme.textTheme.subhead
        .copyWith(color: Colors.white, fontWeight: FontWeight.w300);

    return Container(
      color: Colors.red[900],
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 30.0,
            left: 0.0,
            right: 0.0,
            child: Center(
              child: Text(
                "007296",
                style: orderIdStyle,
              ),
            ),
          ),
          Center(
            child: Icon(
              Icons.autorenew,
              size: 45.0,
              color: Colors.white,
            ),
          ),
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 15.0,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "28/03/2005",
                  style: statusTimeStyle,
                ),
                Text(
                  "00:12",
                  style: statusTimeStyle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildCardWrapper(children: <Widget>[
      SizedBox(
        child: _buildCardStatusView(context),
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
