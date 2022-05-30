import 'package:sqflite/sqflite.dart';

import '../../models/wallet_transaction.dart';
import '../database_manager.dart';

Future<List<WalletTransaction>> getTransactions() async {
  Database database = await DatabaseManager.db.database;
  var transactions = await database.query('Transaction', orderBy: 'name');
  List<WalletTransaction> transactionList = transactions.isNotEmpty
      ? transactions
          .map((transaction) => WalletTransaction.fromMap(transaction))
          .toList()
      : [];
  return transactionList;
}

Future<int> addTransaction(WalletTransaction transaction) async {
  Database database = await DatabaseManager.db.database;
  return await database.insert('Transaction', transaction.toMap());
}

Future<int> removeTransaction(int id) async {
  Database database = await DatabaseManager.db.database;
  return await database.delete('Transaction', where: 'id = ?', whereArgs: [id]);
}

Future<int> updateTransaction(WalletTransaction transaction) async {
  Database database = await DatabaseManager.db.database;
  return await database.update('Transaction', transaction.toMap(),
      where: 'id = ?', whereArgs: [transaction.id]);
}
