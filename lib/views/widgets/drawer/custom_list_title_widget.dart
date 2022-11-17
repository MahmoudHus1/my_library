import 'package:flutter/material.dart';

import '../../screens/titles.dart';

class CustomListTitle extends StatelessWidget {
  IconData icon;
  String text;
  Widget page;
  BuildContext context;
  CustomListTitle(this.icon, this.text, this.page, this.context, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      leading: Icon(icon),
      onTap: () {
        Navigator.of(context).pop(MaterialPageRoute(
          builder: (context) {
            return const Titles();
          },
        ));
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return page;
          },
        ));
      },
    );
  }
}
