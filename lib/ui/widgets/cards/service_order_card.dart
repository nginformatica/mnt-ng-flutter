import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mnt_flutter/data/entities/service_order.dart';

class _CardRightSide extends StatelessWidget {
  const _CardRightSide({
    @required this.equipmentId,
    @required this.equipmentName,
    @required this.localization,
    @required this.serviceId,
    @required this.serviceName,
  });

  final String equipmentId;
  final String equipmentName;
  final String localization;
  final String serviceId;
  final String serviceName;

  Widget _buildEquipmentData(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final equipmentIdStyle = text.subtitle;
    final equipmentNameStyle = text.caption.copyWith(
      color: Colors.grey,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(equipmentId.toUpperCase(),
            style: equipmentIdStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis
        ),
        Text(equipmentName.toUpperCase(),
            style: equipmentNameStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis
        ),
      ],
    );
  }

  Widget _buildLocalizationData(BuildContext context) {
    final text = Theme.of(context).textTheme.apply(fontSizeFactor: 1);

    final localizationText = Text(
        localization.toUpperCase(),
        style: text.caption,
        maxLines: 1,
        overflow: TextOverflow.ellipsis
    );

    return Row(
      children: <Widget>[
        localizationText,
      ],
    );
  }

  Widget _buildServiceData(BuildContext context){
    final text = Theme.of(context).textTheme.apply(fontSizeFactor: 1);
    final idTextStyle = text.subtitle.copyWith(fontWeight: FontWeight.bold);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(serviceId.toUpperCase(), style: idTextStyle),
        Text(serviceName.toUpperCase(), style: text.caption),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const containerPadding = EdgeInsets.symmetric(
      horizontal: 10.0,
      vertical: 20.0,
    );

    const divider = Divider(color: Colors.grey);

    return Expanded(child: Container(
        padding: containerPadding,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            _buildEquipmentData(context),
            divider,
            _buildLocalizationData(context),
            Expanded(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[_buildServiceData(context)],
              ),
            )
          ],
        )
    )
    );
  }
}

class _CardLeftSide extends StatelessWidget {
  const _CardLeftSide({
    @required this.orderId,
    @required this.expectedFinishDate,
  });

  static const statusWidth = 120.0;
  final String orderId;
  final DateTime expectedFinishDate;

  Widget _buildCardStatusView(BuildContext context) {
    final text = Theme.of(context)
        .textTheme
        .apply(displayColor: Colors.white, bodyColor: Colors.white);

    final orderIdStyle = text.title;
    final statusTimeStyle = text.subhead.copyWith(fontWeight: FontWeight.w300);

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
                orderId,
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
                  DateFormat.yMd().format(expectedFinishDate),
                  style: statusTimeStyle,
                ),
                Text(
                  DateFormat.Hm().format(expectedFinishDate),
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
    return SizedBox(
      child: _buildCardStatusView(context),
      width: statusWidth,
    );
  }
}

class ServiceOrderCard extends StatelessWidget {
  const ServiceOrderCard(this.order);

  final ServiceOrder order;
  static const cardHeight = 185.0;

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

  @override
  Widget build(BuildContext context) {
    return _buildCardWrapper(children: <Widget>[
      _CardLeftSide(
        expectedFinishDate: order.expectedFinishDate,
        orderId: order.id,
      ),
      _CardRightSide(
        equipmentId: order.equipment.id,
        equipmentName: order.equipment.name,
        localization: order.equipment.localization,
        serviceId: order.service.id,
        serviceName: order.service.name,
      )
    ]);
  }
}
