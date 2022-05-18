import 'package:sqflite/sqflite.dart';

import '../../models/category.dart';
import '../database_manager.dart';

Future<List<Category>> getCategories() async {
  Database database = await DatabaseManager.db.database;
  var categories = await database.query('Category', orderBy: 'name');
  List<Category> categoryList = categories.isNotEmpty
      ? categories.map((category) => Category.fromMap(category)).toList()
      : [];
  return categoryList;
}

Future<int> addCategory(Category category) async {
  Database database = await DatabaseManager.db.database;
  return await database.insert('Category', category.toMap());
}

Future<int> removeCategory(int id) async {
  Database database = await DatabaseManager.db.database;
  return await database.delete('Category', where: 'id = ?', whereArgs: [id]);
}

Future<int> updateCategory(Category category) async {
  Database database = await DatabaseManager.db.database;
  return await database.update('Category', category.toMap(),
      where: 'id = ?', whereArgs: [category.id]);
}
