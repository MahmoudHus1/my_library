import 'package:flutter/material.dart';

class AuthorBookScreen extends StatelessWidget {
  String nameOfAuthor;
   AuthorBookScreen(this.nameOfAuthor,{super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:  Text(nameOfAuthor),
        backgroundColor: const Color.fromARGB(255, 243, 16, 0),),);
  }
}
