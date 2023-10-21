import 'package:e_premier_new/models/premium.dart';
import 'databasehandler.dart';

class PremiumRepository {
  // ignore: non_constant_identifier_names
  String table_name = 'premium';
  DatabaseHandler databaseHandler = DatabaseHandler();

  // ignore: non_constant_identifier_names
  Future insert(Premium premium) async {
    int result = 0;
    final db = await databaseHandler.initializeDB();
    result = await db.insert(table_name, premium.toMap());
    return result;
  }

  // Future insertP(int userId) async{
  //   int result = 0;
  //   final db = await databaseHandler.initializeDB();
  //   final String date='${DateTime.now().year}-${DateTime.now().month<10?'0${DateTime.now().month}':'${DateTime.now().month}'}-${DateTime.now().day<10?'0${DateTime.now().day}':'${DateTime.now().day}'}';
  //   result = await db.rawInsert(
  //       """INSERT INTO $table_name($userId)
  //       SELECT 5, 'text to insert'
  //       WHERE NOT EXISTS(SELECT 1 FROM memos WHERE id = 5 AND text = 'text to insert')""");
  //   return result;
  // }

  Future retrieve() async {
    final db = await databaseHandler.initializeDB();
    final List<Map<String, Object?>> queryResults = await db.query(table_name);
    //print(dqueryResultsb[0]);
    return queryResults.map((e) => Premium.fromMap(e)).toList();
  }

  Future retrieveById(int id) async {
    final db = await databaseHandler.initializeDB();
    final List<Map<String, Object?>> queryResults =
    await db.query(table_name, where: 'id = ?', whereArgs: [id]);
    return queryResults.map((e) => Premium.fromMap(e)).toList();
  }

  // Future retrieveByUserIdDateTime(int userId,DateTime dateTime) async{
  //   final db = await databaseHandler.initializeDB();
  //   final String date='${dateTime.year}-${dateTime.month<10?'0${dateTime.month}':'${dateTime.month}'}-${dateTime.day<10?'0${dateTime.day}':'${dateTime.day}'}';
  //   final List<Map<String, Object?>> queryResults = await db.query(table_name, where: 'userId = ? and todayDate LIKE ?', whereArgs: [userId,'%$date%']);
  //   return queryResults.map((e) => Zikr.fromMap(e)).toList();
  // }

  // Future<List<int>> retrieveWeeks(int userId) async{
  //   final db = await databaseHandler.initializeDB();
  //   final List<Map<String, Object?>> queryResults = await db.rawQuery("SELECT DISTINCT weekId FROM $table_name WHERE userId = ? ",[userId]);
  //   return queryResults.map((e) => e['weekId'] as int).toList();
  // }

  // Future<List<Zikr>> retrieveAttendByWeekId({required int weekId, required int userId}) async{
  //   final db = await databaseHandler.initializeDB();
  //   final List<Map<String, Object?>> queryResults = await db.query(table_name, where: "weekId = ? and userId = ?", whereArgs: [weekId, userId]);
  //   return queryResults.map((e) => Zikr.fromMap(e)).toList();
  // }

  // ignore: non_constant_identifier_names
  Future update({required Premium premium}) async {
    int result = 0;
    final db = await databaseHandler.initializeDB();
    result = await db.update(table_name, premium.toMap(),
        where: 'id = ?', whereArgs: [premium.id!]);
    return result;
  }

  Future deleted(int id) async {
    final db = await databaseHandler.initializeDB();
    db.delete(table_name, where: 'id = ?', whereArgs: [id]);
  }
}
