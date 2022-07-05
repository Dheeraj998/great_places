import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static Future<Database> database() async {
    var databasesPath = await getDatabasesPath();

    return openDatabase(
      path.join(
        databasesPath,
        'places.db',
      ),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE user_places (id TEXT PRIMARY KEY, title TEXT, image TEXT)');
      },
    );
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbHelper.database();
    db.insert(table, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbHelper.database();
    return db.query(table);
  }
}
