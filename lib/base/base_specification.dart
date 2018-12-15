import 'package:sqflite/sqflite.dart';

abstract class BaseSpecification<T> {
  Future<T> toResults(Database db);
}
