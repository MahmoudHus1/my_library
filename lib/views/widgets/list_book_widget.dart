// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../screens/author_book_screen.dart';

class ListBook extends StatelessWidget {
  IconData icon;
  String value;
  ListBook({
    Key? key,
    required this.icon,
    required this.value,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: BorderSide(color: Colors.red.withOpacity(.3)),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.black.withOpacity(.2),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return AuthorBookScreen(value);
              },
            ));
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              children:  [
                Icon(
                  icon,
                  color: Colors.black,
                  size: 30,
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    value,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
                Text(
                  '1',
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          )),
    );
  }
}
