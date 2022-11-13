import 'package:flutter/material.dart';
import 'package:my_library/views/widgets/drawer_widget.dart';

class Authors extends StatelessWidget {
  const Authors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('Authors'),
        backgroundColor: Color.fromARGB(255, 243, 16, 0),
      ),
    );
  }
}