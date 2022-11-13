import 'package:flutter/material.dart';

import '../widgets/drawer_widget.dart';
import 'add_book.dart';

class Titles extends StatelessWidget {
  const Titles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return AddNewBook();
            },
          ));
        },
        backgroundColor: const Color.fromARGB(255, 243, 16, 0),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Titles'),
        backgroundColor: const Color.fromARGB(255, 243, 16, 0),
      ),
    );
  }
}
