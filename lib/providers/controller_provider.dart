import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_library/db/dbhelper.dart';
import 'package:my_library/models/author_model.dart';
import 'package:my_library/models/book_author_model.dart';
import 'package:my_library/models/book_model.dart';

class NewBookProvider extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController pageCountCotroller = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController isbnController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController shelfController = TextEditingController();
  final TextEditingController borrowedController = TextEditingController();
  final TextEditingController returnDateController = TextEditingController();

  List<TextEditingController> controllers = [
    TextEditingController(),
  ];

  double val = 0.0;
  double pageCount = 0.0;
  String returnDate = '';
  String labelValue = 'Unread';
  double progressAmount = 0.0;
  bool isSelect = false;
  bool showTextField = false;
  double rating = 0;

  void clean() {
    titleController.clear();
    genreController.clear();
    yearController.clear();
    pageCountCotroller.clear();
    languageController.clear();
    isbnController.clear();
    descriptionController.clear();
    notesController.clear();
    shelfController.clear();
    borrowedController.clear();
    returnDateController.clear();
    for (var element in controllers) {
      element.clear();
    }
    val = 0.0;
    pageCount = 0.0;
    returnDate = '';
    labelValue = 'Unread';
    progressAmount = 0.0;
    isSelect = false;
    showTextField = false;
    rating = 0;
  }

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



  void changeIsSelect() {
    isSelect = !isSelect;
    if (isSelect) {
      showTextField = true;
    } else {
      showTextField = false;
    }
    notifyListeners();
  }

  void changeDateValue(String date) {
    returnDate = date;
    notifyListeners();
  }

  List<Map<String, Object?>> allBooks = [];
  List<AuthorModel> allAuthors = [];

  getAllBooks() async {
    allBooks = await DbHelper.dbHelper.getAllBooks();

    notifyListeners();
  }

  getAllBooksForAnAuthor() async {
    await DbHelper.dbHelper.getAllBooksForSameAuthor();
  }

  getAllAuthorsForSameBook() async {
    allAuthors = await DbHelper.dbHelper.getAuthors();
    notifyListeners();
  }

  Future<void> addBook() async {
    BookModel bM = BookModel(
        bookTitle: titleController.text.trim(),
        genre: genreController.text.trim(),
        publishYear: yearController.text,
        pageCount: int.parse(pageCountCotroller.text.trim()),
        language: languageController.text,
        isbn: isbnController.text,
        description: descriptionController.text,
        notes: notesController.text,
        shelf: 'Main shelf',
        bookRate: rating,
        bookReadStatus: labelValue,
        isBorrowed: isSelect ? 1 : 0,
        borrowedFrom: borrowedController.text,
        returnDate:returnDateController.text != '' ?
            DateTime.parse(returnDateController.text).millisecondsSinceEpoch : 0);

    int bookId = await DbHelper.dbHelper.insertNewBook(bM);

    for (var element in controllers) {
      int authorId = await DbHelper.dbHelper.insertNewAuthor(element.text);
      BookAuthorModel bA = BookAuthorModel(bookId: bookId, authorId: authorId);
      int relId = await DbHelper.dbHelper.connectBookWithAuthor(bA);
    }
    print(bookId);
    getAllBooks();
    clean();
  }

    deleteTask() async {
    await DbHelper.dbHelper.deleteTask();
    getAllBooks();
  }
}
