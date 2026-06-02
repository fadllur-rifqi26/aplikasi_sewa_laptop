// lib/data/db/local_storage/tables/favorite_table.dart
import 'package:drift/drift.dart';

class FavoriteTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get price => text()();
  TextColumn get imgUrl => text()();
  TextColumn get loc => text()();
}