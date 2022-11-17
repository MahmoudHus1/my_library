import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_library/db/dbhelper.dart';
import 'package:my_library/models/author_model.dart';
import 'package:my_library/models/book_model.dart';

class NewBookProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController pageCountCotroller = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController isbnController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController shelfController = TextEditingController();
  final TextEditingController rateControoler = TextEditingController();
  final TextEditingController readStatusControoler = TextEditingController();
  final TextEditingController borrowedController = TextEditingController();
  final TextEditingController borrowedFromController = TextEditingController();
  final TextEditingController returnDateController = TextEditingController();

  double val = 0.0;
  double pageCount = 0.0;
  String labelValue = 'Unread';
  double progressAmount = 0.0;
  bool isSelect = false;
  bool showTextField = false;
  double rating = 0;
  String? selectedValue;

  String checkLabel(String val) {
    if (val == '0') {
      labelValue = 'Unread';
      progressAmount = 0;
    } else if (val == '10') {
      labelValue = 'Read';
      progressAmount = 1;
    } else {
      labelValue = 'Reading';
      progressAmount = 0.5;
    }
    notifyListeners();
    return labelValue;
  }

  void changeValue(double value) {
    val = value;
    notifyListeners();
  }

  void changePageCount(double value) {
    pageCount = value;
    notifyListeners();
  }

  void changeRating(double rate) {
    rating = rate;
    notifyListeners();
  }

  void changeSelectedValue(String value) {
    selectedValue = value;
    notifyListeners();
  }

  void changeIsSelect() {
    isSelect = !isSelect;
    if (isSelect) {
      showTextField = true;
    } else {
      showTextField = false;
    }
    notifyListeners();
  }

  void addBook() async {
    // BookModel bM = BookModel(bookTitle: titleController.text.trim(), genre: genreController.text.trim(),
    //  publishYear: yearController.text, pageCount: pageCountCotroller.text.trim() as int, language: languageController.text, 
    //  isbn: isbnController.text, description: descriptionController.text, notes: notesController.text,
    //   shelf: shelfController.text, bookRate: rateControoler.text as double, bookReadStatus: readStatusControoler.text, 
    //   isBorrowed: borrowedController.text as bool, borrowedFrom:borrowedFromController.text , returnDate: (returnDateController.text as DateTime).millisecond);
    // int bookId = await DpHelper.dpHelper.insertNewBook(bM);
    
    // AuthorModel aM = AuthorModel(authorName: authorName);
    int authorId = await DpHelper.dpHelper.insertNewAuthor([{'authorName': 'ahmad'}, {'authorName': 'omar'}]);
    log(authorId.toString());
  }
}

