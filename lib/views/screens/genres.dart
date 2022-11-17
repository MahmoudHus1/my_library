import 'package:flutter/material.dart';

import '../widgets/drawer/drawer_widget.dart';
import '../widgets/list_book_widget.dart';

class Genres extends StatelessWidget {
  const Genres({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('Genres'),
        backgroundColor: const Color.fromARGB(255, 243, 16, 0),
      ),
      body: ListBook(icon: Icons.book, value: 'Adventure'),
    );
  }
}