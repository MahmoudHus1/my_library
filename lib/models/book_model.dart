// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:my_library/models/author_model.dart';

class BookModel {
  int? bookId;
  String bookTitle;
  String genre;
  String publishYear;
  int pageCount;
  String language;
  String isbn;
  String description;
  String notes;
  String shelf;
  double bookRate;
  String bookReadStatus;
  bool isBorrowed;
  String borrowedFrom;
  int returnDate;
  BookModel(
     {this.bookId,
    required this.bookTitle,
    required this.genre,
    required this.publishYear,
    required this.pageCount,
    required this.language,
    required this.isbn,
    required this.description,
    required this.notes,
    required this.shelf,
    required this.bookRate,
    required this.bookReadStatus,
    required this.isBorrowed,
    required this.borrowedFrom,
    required this.returnDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookId': bookId,
      'bookTitle': bookTitle,
      'genre': genre,
      'publishYear': publishYear,
      'pageCount': pageCount,
      'Language': language,
      'ISBN': isbn,
      'description': description,
      'notes': notes,
      'shelf': shelf,
      'bookRate': bookRate,
      'bookReadStatus': bookReadStatus,
      'isBorrowed': isBorrowed,
      'borrowedFrom': borrowedFrom,
      'returnDate': returnDate,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      bookTitle: map['bookTitle'] as String,
      genre: map['genre'] as String,
      publishYear: map['publishYear'] as String,
      pageCount: map['pageCount'] as int,
      language: map['Language'] as String,
      isbn: map['ISBN'] as String,
      description: map['description'] as String,
      notes: map['notes'] as String,
      shelf: map['shelf'] as String,
      bookRate: map['bookRate'] as double,
      bookReadStatus: map['bookReadStatus'] as String,
      isBorrowed: map['isBorrowed'] as bool,
      borrowedFrom: map['borrowedFrom'] as String,
      returnDate: map['returnDate'] as int,
    );
  }
}
