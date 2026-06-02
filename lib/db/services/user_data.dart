import '../tables/app_db.dart';

class UserDataService {
  final AppDb db;

  UserDataService(this.db);

  Future<List<UserTableData>> getAllUsers() async {
    return await db.select(db.userTable).get();
  }

  Future<UserTableData?> getUserById(int id) async {
    return await (db.select(db.userTable)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<int> insertUser(UserTableCompanion user) async {
    return await db.into(db.userTable).insert(user);
  }

  Future<bool> updateUser(UserTableData user) async {
    return await db.update(db.userTable).replace(user);
  }

  Future<int> deleteUser(int id) async {
    return await (db.delete(db.userTable)..where((tbl) => tbl.id.equals(id))).go();
  }
}
