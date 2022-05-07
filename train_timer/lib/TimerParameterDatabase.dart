import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:train_timer/timerParameter.dart';

class TimerParameterDatabase {
  TimerParameterDatabase._();

  static final TimerParameterDatabase instance = TimerParameterDatabase._();
  static Database? _database;

  Future<Database> get database async =>
    _database ??= await initDB();


  initDB() async {
    WidgetsFlutterBinding.ensureInitialized();
    return await openDatabase(
      join(await getDatabasesPath(), 'timerParameter_database.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE timerParameter(id INTEGER PRIMARY KEY AUTOINCREMENT, secondsWork INTEGER, secondsWait INTEGER, nbreReps INTEGER)",
        );
      },
      version: 1,
    );
  }

  void insertTimerParameter(TimerParameter timerParameter) async {
    final Database db = await database;
    await db.insert('timerParameter', timerParameter.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  void deleteTimerParameter(int id) async {
    final Database db = await database;
    db.delete('timerParameter', where: "id = ?", whereArgs: [id]);
  }

  Future<List<TimerParameter>> timerParameters() async{
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('timerParameter');
    List<TimerParameter> timerParameters = List.generate(maps.length, (i) {
      return TimerParameter.fromMap(maps[i]);
    });
    return timerParameters;
  }
}