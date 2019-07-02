import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../models/DayCountModel.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE DayCount ("
              "id INTEGER PRIMARY KEY,"
              "title TEXT,"
              "date TEXT,"
              ")");
        });
  }

  insertDayCount(DayCount newDayCount) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM DayCount");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into DayCount (id,title,date)"
            " VALUES (?,?,?,?)",
        [id, newDayCount.title, newDayCount.date]);
    return raw;
  }

  updateDayCount(DayCount newDayCount) async {
    final db = await database;
    var res = await db.update("DayCount", newDayCount.toMap(),
        where: "id = ?", whereArgs: [newDayCount.id]);
    return res;
  }

  getDayCount(int id) async {
    final db = await database;
    var res = await db.query("DayCount", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? DayCount.fromMap(res.first) : null;
  }

  Future<List<DayCount>> getAllDayCounts() async {
    final db = await database;
    var res = await db.query("DayCount");
    List<DayCount> list =
    res.isNotEmpty ? res.map((c) => DayCount.fromMap(c)).toList() : [];
    return list;
  }

  deleteDayCount(int id) async {
    final db = await database;
    return db.delete("DayCount", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from DayCount");
  }

}