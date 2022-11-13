import 'package:flutter/material.dart';

import '../widgets/drawer_widget.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('About'),
        backgroundColor: const Color.fromARGB(255, 243, 16, 0),
      ),
    );
  }
}