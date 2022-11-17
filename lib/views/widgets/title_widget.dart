import 'package:flutter/material.dart';

import '../screens/book_info_screen.dart';

class BookButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            color: Colors.red.withOpacity(.3)
          ),
                backgroundColor: Colors
                    .transparent,
                shadowColor: Colors.black.withOpacity(.2),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 15.0),
              ),
        onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return BookInfo();
        },));
      }, child: Row(children: [
        SizedBox(
          child: SizedBox(
            height: 100,
            width: 80,
            child: Image.asset('assets/images/book-52.png')),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
            Text('Perfume', style: TextStyle(fontSize: 20, color: Colors.black),),
            Text('Mahmoud', style: TextStyle(fontSize: 15, color: Colors.black),)
          ],),
        ),
      ],)),
    );
  }

}