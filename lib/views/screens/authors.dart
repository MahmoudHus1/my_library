import 'package:flutter/material.dart';
import 'package:my_library/views/widgets/drawer/drawer_widget.dart';

import '../widgets/list_book_widget.dart';

class Authors extends StatelessWidget {
  const Authors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('Authors'),
        backgroundColor: const Color.fromARGB(255, 243, 16, 0),
      ),
      body: ListBook(icon: Icons.face, value: 'Mahmoud'),
    );
  }
}
