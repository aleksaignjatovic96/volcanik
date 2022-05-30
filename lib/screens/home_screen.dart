import 'package:flutter/material.dart';

import '../database/helpers/category_helper.dart';
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
        title: const Text(
          "VOLCANIK",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 5,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<Category>>(
          future: getCategories(),
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
                              updateCategory(newCategory);
                            });
                          },
                          onLongPress: () {
                            setState(() {
                              removeCategory(category.id!);
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
          await addCategory(
            Category(name: 'salary', type: "income"),
          );
          setState(() {});
        },
      ),
    ));
  }
}
