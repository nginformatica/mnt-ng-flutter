import 'package:mnt_flutter/data/entities/counter.dart';

class Equipment {
  const Equipment({this.id, this.name, this.localization, this.counters});

  final String name;
  final String id;
  final String localization;
  final List<Counter> counters;
}
