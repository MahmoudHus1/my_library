import 'package:flutter/material.dart';

import '../widgets/drawer/drawer_widget.dart';

class Shelves extends StatelessWidget {
  const Shelves({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('Shelves'),
        backgroundColor: Color.fromARGB(255, 243, 16, 0),
      ),
    );
  }
}