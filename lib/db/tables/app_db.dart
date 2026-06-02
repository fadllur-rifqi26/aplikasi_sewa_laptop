import 'package:drift/drift.dart';
import 'package:drift_sqflite/drift_sqflite.dart';

import 'user_table.dart';
import 'laptop_table.dart';
import 'favorite_table.dart';

part 'app_db.g.dart';

@DriftDatabase(tables: [

  UserTable,
  FavoriteTable,
])
class AppDb extends _$AppDb {
  AppDb() : super(SqfliteQueryExecutor(path: 'sewa2_database.db'));

  @override
  int get schemaVersion => 1;

  Future<int> insertUser(UserTableCompanion user) => into(userTable).insert(user);
  Future<List<UserTableData>> getAllUsers() => select(userTable).get();

  Stream<List<FavoriteTableData>> watchAllFavorites() {return select(favoriteTable).watch();}

  Future<int> deleteFavorite(int id) => (delete(favoriteTable)..where((tbl) => tbl.id.equals(id))).go();

  Future<int> insertFavorite(FavoriteTableCompanion favorite) => into(favoriteTable).insert(favorite);

  Future<int> deleteFavoriteByname(String name) {return (delete(favoriteTable)..where((tbl) => tbl.name.equals(name))).go();}

  Future<bool> isFavorite(String name) async {
    final query = select(favoriteTable)..where((tbl) => tbl.name.equals(name));
    final result = await query.get();
    return result.isNotEmpty;
  }
}
