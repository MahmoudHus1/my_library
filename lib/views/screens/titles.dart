import 'package:flutter/material.dart';
import 'package:my_library/views/widgets/title_widget.dart';

import '../widgets/drawer/drawer_widget.dart';
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
              return const AddNewBook();
            },
          ));
        },
        backgroundColor: const Color.fromARGB(255, 243, 16, 0),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title:TextField(),
        backgroundColor: const Color.fromARGB(255, 243, 16, 0),
        actions: [IconButton(onPressed: () {
          
        }, icon: const Icon(Icons.search))],
      ),
      body: BookButton(),
    );
  }
}
