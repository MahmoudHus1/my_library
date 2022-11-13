import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

import '../screens/FAQ.dart';
import '../screens/about.dart';
import '../screens/authors.dart';
import '../screens/genres.dart';
import '../screens/settings.dart';
import '../screens/shelves.dart';
import '../screens/titles.dart';
import '../screens/wish_list.dart';


class MyDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn.elearningindustry.com/wp-content/uploads/2016/05/top-10-books-every-college-student-read-1024x640.jpeg'),
                      fit: BoxFit.fill)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Library',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Books',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            CustomListTitle(Icons.collections_bookmark_outlined, 'Shelves', Shelves(), context),
            const Divider(
              thickness: 2,
            ),
            CustomListTitle(Icons.book, 'Titles', const Titles(), context),
            CustomListTitle(Icons.face, 'Authors', const Authors(), context),
            CustomListTitle(TablerIcons.friends, 'Genres', const Genres(), context),
            CustomListTitle(TablerIcons.gift,'Wish List', const WishList(), context),
            const Divider(
              thickness: 2,
            ),
            CustomListTitle(Icons.settings, 'Settings', const Settings(), context),
            CustomListTitle(Icons.question_mark, 'FAQ',  FAQ(), context),
            CustomListTitle(Icons.info, 'About', const About(), context),
            const Divider(
              thickness: 2,
            ),
          ],
        ),
      );
    
  }
}

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
