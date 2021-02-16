import 'dart:async';
import 'dart:convert';
import 'package:diagnose_me/core/util/Constant.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;
  int dbVersion =
      6; //change the version,when you make changes to the  database before push

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      await db.execute("DROP TABLE IF EXISTS ${Constant.AILMENTS}");
      await db.execute("DROP TABLE IF EXISTS ${Constant.CAUSES}");
      _onCreate(db, newVersion);
    }
  }

  initDB() async {
    //getApplicationDocumentsDirectory
//    Directory documentsDirectory = await getDatabasesPath();
//    String path = join(documentsDirectory.path, "myApp.db");
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'myApp.db');
    return await openDatabase(path,
        version: dbVersion,
        onOpen: (db) {},
        onUpgrade: _onUpgrade,
        onCreate: _onCreate);
  }

  void _onCreate(Database db, int version) async {
    print('creating ... version => $version');
    await db.execute("CREATE TABLE IF NOT EXISTS ${Constant.AILMENTS} ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "ailmentName TEXT,"
        "treatment TEXT,"
        "causes TEXT,"
        "prevention TEXT,"
        ")");

    await db.execute("CREATE TABLE ${Constant.SYMPTOMS} ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "symtomsName TEXT,"
        "weight TEXT,"
        "ailmentid INTEGER"
        ")");
  }
}
