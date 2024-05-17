import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;
  static final table = 'category';
  static final tableContact = 'contact';

  static final userNamePassword = 'userNamePassword';

  static final userId = '_id';
  static final userName = 'name';
  static final columnLName = 'lname';
  static final columnMobile = 'mobile';
  static final columnEmail = 'email';
  static final columnCategory = 'cat';
  static final columnProfile = 'profile';

  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();
  Future<Database?> get database1 async {
    if (_database == null) {
      _database = await _initDatabase();
    }
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }
  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {

    await db.execute('''
          CREATE TABLE $userNamePassword (
            $userId TEXT NOT NULL,
            $userName TEXT NOT NULL 
          )
          ''');
  }

  Future<int> getUserCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $userNamePassword')) ??
        0;
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[userId];
    return await db.update(userNamePassword, row, where: '$userId = ?', whereArgs: [id]);
  }

  Future<int>  insertUserData(Map<String, dynamic> row) async {
    Database? db = await instance.database;
    return await db.insert(userNamePassword, row);
  }

  Future <int> deleteuSERlIST () async{
    Database? db = await instance.database;
    return await db.delete(userNamePassword);
  }



  Future<List<Map<String, dynamic>>> getUserData() async {
    Database db = await instance.database;
    return await db.query(userNamePassword);
  }

}