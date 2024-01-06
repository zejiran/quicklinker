import 'package:path/path.dart';
import 'package:quicklinker/models/url_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'shortened_links.db');
    return await openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(
        'CREATE TABLE Links (originalUrl TEXT, shortUrl TEXT, timestamp TEXT)',
      );
    });
  }

  Future<void> insertLink(UrlModel url) async {
    final db = await database;
    await db.insert(
      'Links',
      url.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<UrlModel>> getLinks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'Links',
      orderBy: 'timestamp DESC',
      limit: 10,
    );
    return List.generate(maps.length, (i) {
      return UrlModel.fromMap(maps[i]);
    });
  }
}
