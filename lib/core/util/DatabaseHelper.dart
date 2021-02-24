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
      await db.execute("DROP TABLE IF EXISTS ${Constant.SYMPTOMS}");
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
        "prevention TEXT,"
        "dosage TEXT"
        ")");

    await db.execute("CREATE TABLE ${Constant.SYMPTOMS} ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "symptomsName TEXT,"
        "weight TEXT"
        "almentId INTEGER"
        ")");

    await db.execute("CREATE TABLE ${Constant.CAUSES} ("
        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "causeName TEXT,"
        "ailmentid INTEGER"
        ")");
  }

  // Future<String> getCustomerString(User user) async {
  //   try {
  //     final db = await database;
  //     List customer = await queryAllRows(Constant.PROFILE_TABLE);
  //     if (customer.length < 1) {
  //       var raw = insert(user);
  //       return "${raw.toString()}";
  //     } else {
  //       print("customer.length  ${customer.length.toString()}");
  //       return customer.length.toString();
  //     }
  //   } on Exception catch (e) {
  //     print("exception ${e.toString()}");
  //     return null;
  //   }
  // }
  //
  // insert(User user) async {
  //   final db = await database;
  //   var raw = await db.insert(Constant.PROFILE_TABLE, user.toJson());
  //   print("after insert :: $raw");
  //   print("Before Insert ::: ${user.toJson()}");
  //   return raw;
  // }
  //
  // insertRequestType(GetType type) async {
  //   print("eBefore Insert request type ::: ${type.toJson()}");
  //   final db = await database;
  //   var raw = await db.insert(Constant.REQUEST_TYPE, type.toJson());
  //   print("after insert  request type :: $raw");
  //   return raw;
  // }
  //
  // Future<List<GetType>> getRequestType() async {
  //   try {
  //     final db = await database;
  //     List<GetType> getTypes = [];
  //     var res = await db.rawQuery("SELECT * FROM ${Constant.REQUEST_TYPE} ");
  //     print("length ${res.length}");
  //     if (res.length > 0) {
  //       for (var rs in res) {
  //         getTypes.add(GetType.fromJson(rs));
  //       }
  //       return getTypes;
  //     } else {
  //       return null;
  //     }
  //   } on Exception catch (e) {
  //     print("exception ${e.toString()}");
  //     return null;
  //   }
  // }
  //
  // Future<User> getData(String tableName) async {
  //   try {
  //     final db = await database;
  //     var res = await db.rawQuery("SELECT * FROM $tableName ");
  //     print(jsonEncode(res));
  //     if (res.length > 0) {
  //       print("####################");
  //       print("first ::: ${res.first}");
  //       return User.fromJson(res.first);
  //     } else {
  //       print("rawQuery 111111");
  //       return null;
  //     }
  //   } on Exception catch (e) {
  //     print("exception ${e.toString()}");
  //     return null;
  //   }
  // }
}
