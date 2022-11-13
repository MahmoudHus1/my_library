
import 'package:flutter/material.dart';

import '../widgets/drawer_widget.dart';

class FAQ extends StatelessWidget {
  bool _showTextField1 = false;
  bool _showTextField2 = false;
  bool _showTextField3 = false;
  bool _showTextField4 = false;
  bool _showTextField5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('FAQ'),
        backgroundColor: Color.fromARGB(255, 243, 16, 0),
      ),
      body: ListView(
        children: [
          SizedBox(
              height: 50,
              width: 100,
              child: Row(
                children:  [
                  Icon(Icons.arrow_drop_down),
                  InkWell(
                    onTap: () {
                      _showTextField1 = !_showTextField1;
                    },
                    child: const Text(
                      'Is there a limit to th number of books i can have?',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
          const Divider(
            thickness: 2,
          ),
          Visibility(
            visible: _showTextField1,
            child: const Text('gggggggggg'),
          ),
          SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(
                children: const [
                  Icon(Icons.arrow_drop_down),
                  InkWell(
                      child: Text('How do I change the cover of a book?',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)))
                ],
              )),
          const Divider(
            thickness: 2,
          ),
          SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(
                children: const [
                  Icon(Icons.arrow_drop_down),
                  InkWell(
                    child: Text('How can I edit a genre?',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  )
                ],
              )),
          const Divider(
            thickness: 2,
          ),
          SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(
                children: const [
                  Icon(Icons.arrow_drop_down),
                  InkWell(
                    child: Text("I can't find any books, why?",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  )
                ],
              )),
          const Divider(
            thickness: 2,
          ),
          SizedBox(
              height: 50,
              width: double.infinity,
              child: Row(
                children: const [
                  Icon(Icons.arrow_drop_down),
                  InkWell(
                    child: Text("I can't read the books i added.",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
