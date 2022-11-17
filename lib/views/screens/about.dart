import 'package:flutter/material.dart';

import '../widgets/drawer/drawer_widget.dart';

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
      body: Container(
        margin: const EdgeInsets.only(top: 50, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon/icon.png',
                  width: 80,
                  height: 80,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'This is an Application by Mahmoud Hussein',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Social',
                style: TextStyle(
                    fontSize: 17, color: Colors.black.withOpacity(0.5))),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: const [
                Icon(
                  Icons.share,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Share The app.', style: TextStyle(fontSize: 15))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 2,
            ),
            const SizedBox(
              height: 10,
            ),
            Text('Contact with me',
                style: TextStyle(
                    fontSize: 17, color: Colors.black.withOpacity(0.5))),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Icon(
                  Icons.send,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Telegram for feedback and support.', style: TextStyle(fontSize: 15))
              ],
            ),  
            const Divider(thickness: 2,),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: const [
                Icon(
                  Icons.mail,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Contact us.', style: TextStyle(fontSize: 15))
              ],
            ),     
            const Divider(thickness: 2,),
            const SizedBox(
              height: 15,
            ),
            Row(
              children: const [
                Icon(
                  Icons.play_circle_outline_outlined,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Contact us.', style: TextStyle(fontSize: 15))
              ],
            ),
            const Divider(thickness: 2,),
            const SizedBox(
              height: 15,
            ),
            const Text('Version 4.0.4.139', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))     
          ],
        ),
      ),
    );
  }
}
