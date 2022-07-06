
import 'package:sqflite/sqflite.dart';
import 'package:user_profile_shared_preferences_example/database/pills_database.dart';

class Repository{

  PillsDatabase _pillsDatabase = PillsDatabase();
  static Database _database;

  //init database
  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await _pillsDatabase.setDatabase();
    return _database;
  }

  //insert something to database
  Future<int> insertData(String table,Map<String,dynamic> data) async{
    Database db = await database;
    try{
      return await db.insert(table, data);
    }catch(e){
      return null;
    }
  }

  //get all data from database
  Future<List<Map<String,dynamic>>> getAllData(table) async{
    Database db = await database;
    try{
      return db.query(table);
    }catch(e){
      return null;
    }
  }

  //delete data
  Future<int> deleteData(String table,int id) async{
    Database db = await database;
    try{
      return await db.delete(table,where: "id = ?", whereArgs: [id]);
    }catch(e){
      return null;
    }
  }


}