import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mnt_flutter/data/entities/counter.dart';
import 'package:mnt_flutter/data/entities/equipment.dart';
import 'package:mnt_flutter/util/inject.dart';

class CountersListScreen extends StatefulWidget {
  @override
  _CountersListScreenState createState() => _CountersListScreenState();
}

class _CountersListScreenState extends State<CountersListScreen> {
  final _equipmentRepo = Inject.equipmentRepo();

  Widget _buildCounters(List<Counter> counters) {
    final theme = Theme.of(context);
    final sectionTitle = Text(
      'Contadores:',
      style: theme.textTheme.subhead.copyWith(color: Colors.black54),
    );

    final chips = counters
        .map((counter) => Text('${counter.name}: ${counter.value}'))
        .map((it) => Chip(label: it))
        .toList();

    return Wrap(
      spacing: 5.0,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: <Widget>[sectionTitle] + chips,
    );
  }

  Widget _buildItem(Equipment equipment) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.headline.copyWith(color: Colors.white);
    const titleDecor = BoxDecoration(color: Color.fromARGB(100, 0, 0, 0));
    final descriptionStyle = theme.textTheme.subhead;

    final equipmentImage = Positioned.fill(
        child: Ink.image(
      image: NetworkImage(
          'https://img.lojadomecanico.com.br/IMAGENS/11/612/103921/Torno-Mecanico-750mm-750W-220V-Mono-fortgpro-fg0062.JPG'),
      fit: BoxFit.cover,
      child: Container(),
    ));

    final equipmentName = Positioned(
      bottom: 5.0,
      left: 5.0,
      right: 16.0,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.centerLeft,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          decoration: titleDecor,
          child: Text(
            '${equipment.id} - ${equipment.name}',
            style: titleStyle,
          ),
        ),
      ),
    );

    final equipmentLocalization = Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        'Localização: ${equipment.localization}',
        style: descriptionStyle.copyWith(color: Colors.black54),
      ),
    );

    final children = <Widget>[
      // Photo and title.
      SizedBox(
        height: 200.0,
        child: Stack(
          children: <Widget>[
            equipmentImage,
            equipmentName,
          ],
        ),
      ),
      Divider(),
      // Description and share/explore buttons.
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: DefaultTextStyle(
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          style: descriptionStyle,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // three line description
              equipmentLocalization,
              _buildCounters(equipment.counters)
            ],
          ),
        ),
      ),
    ];

    return Card(
      // This ensures that the Card's children are clipped correctly.
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildStreamList() {
    return StreamBuilder(
        stream: _equipmentRepo.getEquipments().asBroadcastStream(),
        builder: (list, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            return _buildCountersList(
                // Dart lost the type here
                snapshot.data as List<Equipment>);
          }
        });
  }

  Widget _buildCountersList(List<Equipment> list) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => _buildItem(list[index]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Apontamento de Contadores')),
      body: _buildStreamList(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red[800],
          child: const Icon(Icons.add),
          onPressed: () {}),
    );
  }
}
