import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mnt_flutter/data/entities/service_order.dart';

class ServiceOrderCard extends StatelessWidget {
  const ServiceOrderCard(this.order);

  final ServiceOrder order;
  static const statusWidth = 130.0;
  static const cardHeight = 185.0;

  Widget _buildCardWrapper({@required List<Widget> children}) => Center(
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

  Widget _buildCardTitles(BuildContext context) {
    final theme = Theme.of(context);
    final equipmentIdStyle = theme.textTheme.title;
    final equipmentNameStyle = theme.textTheme.subhead
        .copyWith(color: Colors.grey, fontWeight: FontWeight.w300);

    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: Text(order.equipment.id.toUpperCase(),
              style: equipmentIdStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
        ),
        Expanded(
          child: Text(order.equipment.name.toUpperCase(),
              style: equipmentNameStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
        ),
      ],
    );
  }

  Widget _buildCardDataSpace(BuildContext context) => Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[_buildCardTitles(context), const Divider()],
        ),
      ));

  Widget _buildCardStatusView(BuildContext context) {
    final theme = Theme.of(context);
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
                order.id,
                style: orderIdStyle,
              ),
            ),
          ),
          const Center(
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
                  DateFormat.yMd().format(order.expectedFinishDate),
                  style: statusTimeStyle,
                ),
                Text(
                  DateFormat.Hm().format(order.expectedFinishDate),
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
  Widget build(BuildContext context) => _buildCardWrapper(children: <Widget>[
        SizedBox(
          child: _buildCardStatusView(context),
          width: statusWidth,
        ),
        Expanded(child: _buildCardDataSpace(context))
      ]);
}
