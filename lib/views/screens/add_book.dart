// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:my_library/db/dbhelper.dart';
import 'package:my_library/views/widgets/add_book/shelf_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../providers/controller_provider.dart';
import '../widgets/add_book/rate_widget.dart';
import '../widgets/add_book/text_field_widget.dart';
import '../widgets/add_book/date_widget.dart';
import '../widgets/add_book/progress_widget.dart';

class AddNewBook extends StatefulWidget {
  const AddNewBook({super.key});

  @override
  State<AddNewBook> createState() => _AddNewBookState();
}

class _AddNewBookState extends State<AddNewBook> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<NewBookProvider>(context, listen: false).addBook();
          Navigator.of(context).pop();
        },
        backgroundColor: const Color.fromARGB(255, 37, 189, 7),
        child: const Icon(Icons.check),
      ),
      appBar: AppBar(
        title: const Text('New Book'),
        backgroundColor: const Color.fromARGB(255, 243, 16, 0),
      ),
      body: Consumer<NewBookProvider>(builder: (context, myProvider, widget) {
        return Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      CustomTextField(
                        hintText: 'Title',
                        labelText: 'Title',
                        controller: myProvider.titleController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: myProvider.authorController,
                        decoration: InputDecoration(
                          filled: true,
                          floatingLabelStyle:
                              const TextStyle(color: Colors.red),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2)),
                          labelText: 'Author',
                          hintText: 'Author',
                          suffixIcon: InkWell(
                              onTap: () {}, child: const Icon(Icons.add)),
                        ),
                      ),
                    ],
                  )),
                  SizedBox(
                    width: 170,
                    height: 200,
                    child: InkWell(
                      child: Image.asset('assets/images/book-52.png'),
                    ),
                  )
                ],
              ),
              CustomTextField(
                hintText: 'Genre',
                labelText: 'Genre',
                controller: myProvider.genreController,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Year published',
                      labelText: 'Year published',
                      controller: myProvider.yearController,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: CustomTextField(
                      hintText: 'Page count',
                      labelText: 'Page count',
                      controller: myProvider.pageCountCotroller,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: 'English',
                labelText: 'Language',
                controller: myProvider.languageController,
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                  controller: myProvider.isbnController,
                  decoration: InputDecoration(
                    filled: true,
                    floatingLabelStyle: const TextStyle(color: Colors.red),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 2)),
                    labelText: 'ISBN',
                    suffixIcon: InkWell(
                        onTap: () {
                          myProvider.isbnController.text += 'X';
                        },
                        child:  Icon(Icons.close, color: Colors.black.withOpacity(.4),)),
                    hintText: myProvider.isbnController.text,
                  )),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: 'Enter a description',
                labelText: 'Enter a description',
                controller: myProvider.descriptionController,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: 'Notes',
                labelText: 'Notes',
                controller: myProvider.notesController,
              ),
              const SizedBox(
                height: 15,
              ),
              ShelfTextField(flag: true),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [ Expanded(child: Rating(initialRating: 0.0,)), const Progress(max: 10, divisions: 2,)],
              ),
              Row(
                children: [
                  Checkbox(
                    value: myProvider.isSelect,
                    activeColor: Colors.red,
                    onChanged: (value) {
                      myProvider.changeIsSelect();
                      if (myProvider.isSelect) {
                      } else {}
                    },
                  ),
                  const Text('Borrowed')
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Visibility(
                visible: myProvider.showTextField,
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: 'Library',
                      labelText: 'Borrowed From',
                      controller: myProvider.borrowedController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ReturnDate()
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
