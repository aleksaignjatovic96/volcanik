import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager {
  DatabaseManager._privateConstructor();

  static const String _databaseName = 'wallet.db';
  static const int _databaseVersion = 1;

  static final DatabaseManager db = DatabaseManager._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    //use this when you want to delete the database
    //await deleteDatabase(path);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate,
        onConfigure: _onConfigure);
  }

  static Future _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Category(
        id INTEGER PRIMARY KEY,
        name TEXT,
        type TEXT CHECK( type IN ('expense', 'income'))
      );
    ''');
    await db.execute('''
      CREATE TABLE WalletTransaction(
        id INTEGER PRIMARY KEY,
        description TEXT,
        date TEXT,
        expense REAL,
        income REAL,
        category INTEGER,
        FOREIGN KEY (category) REFERENCES Category (id)
      );
    ''');
    await db.execute('''
      INSERT INTO Category(name, type) 
      VALUES ('bills', 'expense');
    ''');
    await db.execute('''
      INSERT INTO Category(name, type) 
      VALUES ('salary', 'income');
    ''');
  }
}
