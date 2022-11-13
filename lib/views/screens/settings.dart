import 'package:flutter/material.dart';

import '../widgets/drawer_widget.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Color.fromARGB(255, 243, 16, 0),
      ),
    );
  }
}