import 'package:flutter/material.dart';

import '../widgets/drawer_widget.dart';

class Genres extends StatelessWidget {
  const Genres({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('Genres'),
        backgroundColor: Color.fromARGB(255, 243, 16, 0),
      ),
    );
  }
}