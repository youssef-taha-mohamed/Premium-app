import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'now.db'),
      onCreate: (database, version) async {
        Batch batch = database.batch();
        batch.execute(
          "CREATE TABLE premium(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,address TEXT, phone INTEGER,id_number INTEGER,item TEXT,total_item INTEGER, monthly INTEGER, period INTEGER)",
        );
        //batch.execute("CREATE TABLE attendance(id INTEGER PRIMARY KEY AUTOINCREMENT, userId INTEGER, todayDate TEXT, weekId INTEGER, status INTEGER, weekStatus INTEGER,overTimeStatus INTEGER, salaryReceived TEXT,salary TEXT,workPlace TEXT,weekEnd TEXT)",);
        //batch.execute("CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, dateCreated TEXT, color INTEGER)",);
        await batch.commit();
      },
      version: 1,
    );
  }

  Future<List<Object?>> clearData() async {
    final Database db = await initializeDB();
    Batch batch = db.batch();
    batch.execute("delete from users");
    return await batch.commit();
  }
}