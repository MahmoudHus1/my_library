import 'package:flutter/material.dart';

import '../widgets/drawer/drawer_widget.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});
@override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('Wish List'),
        backgroundColor: const Color.fromARGB(255, 243, 16, 0),
      ),
    );
  }
}