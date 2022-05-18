import 'package:flutter/material.dart';
import 'package:volcanik/database/database_manager.dart';

import '../models/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text("VOLCANIK"),
      ),
      body: Center(
        child: FutureBuilder<List<Category>>(
          future: DatabaseManager.db.getCategories(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: Text("Loading..."));
            }
            return snapshot.data!.isEmpty
                ? const Center(
                    child: Text('No Categories in List.'),
                  )
                : ListView(
                    children: snapshot.data!.map((category) {
                      return Center(
                        child: ListTile(
                          title: Text(category.name),
                          onTap: () {
                            var newCategory = Category(
                                id: category.id, name: 'test', type: "expense");
                            setState(() {
                              DatabaseManager.db.updateCategory(newCategory);
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              DatabaseManager.db.removeCategory(category.id!);
                            });
                          },
                        ),
                      );
                    }).toList(),
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () async {
          await DatabaseManager.db.addCategory(
            Category(name: 'salary', type: "income"),
          );
          setState(() {});
        },
      ),
    ));
  }
}
