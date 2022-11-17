import 'package:flutter/material.dart';

import '../widgets/drawer/drawer_widget.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: const Color.fromARGB(255, 243, 16, 0),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '''Premium''',
              style: TextStyle(
                  fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.lock_person_outlined,
                  size: 40,
                  color: Colors.blue,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Premium',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '''Removes ads and the daily search limit and 
unlocks visual settings.''',
                      style: TextStyle(
                          fontSize: 15, color: Colors.black.withOpacity(0.5)),
                    ),
                  ],
                )
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
            const Text(
              '''Visual''',
              style: TextStyle(
                  fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.dark_mode_outlined,
                  size: 40,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Darker mode',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '''The dark mode will be even darker. Prefer
for OLED screens.''',
                      style: TextStyle(
                          fontSize: 15, color: Colors.black.withOpacity(0.5)),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            const Divider(
              thickness: 2,
            ),
            const Text(
              '''Exporting''',
              style: TextStyle(
                  fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.import_export,
                  size: 40,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Export Library to CSV file.',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '''The file will be save on your downloads
folder.''',
                      style: TextStyle(
                          fontSize: 15, color: Colors.black.withOpacity(0.5)),
                    ),
                  ],
                )
              ],
            ),
            const Divider(
              thickness: 2,
            ),
            const Text(
              '''Advanced''',
              style: TextStyle(
                  fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create backup file.',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '''The file will be save on your downloads folder.''',
                      style: TextStyle(
                          fontSize: 15, color: Colors.black.withOpacity(0.5)),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Restore backup from file.',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '''All of your current book will be deleted
and replaced by the backup.''',
                      style: TextStyle(
                          fontSize: 15, color: Colors.black.withOpacity(0.5)),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
