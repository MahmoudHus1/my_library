import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:my_library/views/widgets/add_book/progress_widget.dart';

import '../widgets/add_book/rate_widget.dart';
import '../widgets/add_book/shelf_widget.dart';

class BookInfo extends StatelessWidget {
  BookInfo({super.key});

  final AssetImage bookCover = AssetImage('assets/images/books.jpeg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info'),
        backgroundColor: const Color.fromARGB(255, 243, 16, 0),
      ),
      body: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: bookCover,
                  fit: BoxFit.cover,
                )),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
              Positioned(
                bottom: -60,
                left: 130,
                child: Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image:
                          DecorationImage(image: bookCover, fit: BoxFit.fill)),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 80, right: 60, left: 70),
            child: Column(
              children: [
                Text(
                  'Perfume',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Mahmoud',
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'adventure',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 15,
                ),
                Rating(
                  initialRating: 3,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: const [
                        Text(
                          'Year',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        Text(
                          '2003',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    Column(
                      children: const [
                        Text(
                          'Language',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        Text(
                          '2003',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 60,
                    ),
                    Column(
                      children: const [
                        Text(
                          'Pages',
                          style: TextStyle(fontSize: 15, color: Colors.grey),
                        ),
                        Text(
                          '200',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: SizedBox(
                      child: ShelfTextField(
                        flag: false,
                      ),
                    )),
                    const SizedBox(
                      width: 15,
                    ),
                    const Progress(
                      max: 200,
                      divisions: 200,
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description :',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text('la bla bla bla'),
                Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Notes :',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text('la bla bla bla'),
                Divider(
                  thickness: 2,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
