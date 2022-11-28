import 'package:flutter/material.dart';
import 'package:my_library/models/book_model.dart';
import 'package:provider/provider.dart';

import '../../providers/controller_provider.dart';
import '../screens/book_info_screen.dart';

class BookButton extends StatelessWidget {
  final String title;
  final List author;
  final Map<String, dynamic> details;
  final int index;

  const BookButton(
      {required this.title,
      required this.author,
      super.key,
      required this.details,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: BorderSide(color: Colors.red.withOpacity(.3)),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.black.withOpacity(.2),
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return BookInfo(
                  description: details['description'],
                  genre: details['genre'],
                  language: details['language'],
                  notes: details['notes'],
                  pages: details['pageCount'],
                  rating: details['bookRate'],
                  title: details['bookTitle'],
                  year: details['publishYear'],
                  authors: Provider.of<NewBookProvider>(context).allBooks[index]
                      ['authors'] as List,
                );
              },
            ));
          },
          child: Row(
            children: [
              SizedBox(
                child: SizedBox(
                    height: 100,
                    width: 80,
                    child: Image.asset('assets/images/book-52.png')),
              ),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 20, color: Colors.black),
                        ),
                        Text(
                          (author.toString())
                              .replaceAll('[', '')
                              .replaceAll(']', ''),
                          style: const TextStyle(
                              fontSize: 15, color: Colors.black),
                        )
                      ],
                    )),
              ),
              InkWell(
                  onTap: () {
                    Provider.of<NewBookProvider>(context).deleteTask();
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          )),
    );
  }
}
