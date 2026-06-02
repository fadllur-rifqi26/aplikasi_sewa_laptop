import 'package:drift/drift.dart';

class UserTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 3, max: 155)();
  TextColumn get email => text().withLength(min: 5, max: 255)();
  TextColumn get password => text().withLength(min: 5, max: 255)();
  TextColumn get phone => text().withLength(min: 10, max: 15)();
  TextColumn get role => text().withDefault(const Constant("Customer"))();
}