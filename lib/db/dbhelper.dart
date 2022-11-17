import 'dart:io';

import 'package:my_library/models/author_model.dart';
import 'package:my_library/models/book_author_model.dart';
import 'package:my_library/models/book_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DpHelper {
  static final DpHelper dpHelper = DpHelper._init();
  DpHelper._init();

  static Database? _database;
Future<void> connectToDatabase() async {
    final Directory directory = await getApplicationDocumentsDirectory();

    _database = await openDatabase(
      '${directory.path}/library.db',
      version: 1,
      onCreate: (db, version) async {
        await  db.execute('''
               CREATE TABLE Book (
                  bookId INTEGER PRIMARY KEY AUTOINCREMENT, 
                  bookTitle TEXT, 
                  genre TEXT, 
                  publishYear TEXT,
                  pageCount INTEGER,
                  language TEXT,
                  isbn TEXT,
                  description TEXT,
                  notes TEXT, 
                  shelf TEXT, 
                  bookRate DOUBLE,
                  bookReadStatus TEXT,
                  isBorrowed INTEGER,
                  borrowedFrom TEXT,
                  returnDate DATETIME
              )''');
  await  db.execute('''
               CREATE TABLE Author (
                  authorId INTEGER PRIMARY KEY AUTOINCREMENT, 
                  authorName TEXT
              )''');
 await   db.execute('''
               CREATE TABLE BookAuthor (
                  bookId INTEGER, 
                  authorId INTEGER,
                  FOREGIN KEY (bookId) REFERENCES Book (bookId),
                  FOREGIN KEY (authorId) REFERENCES Author (authorId)
              )''');
      },
    );
}

delete() async {
   final Directory directory = await getApplicationDocumentsDirectory();
  await databaseFactory.deleteDatabase('${directory.path}/library.db');
}

  Future<int> insertNewBook(BookModel bM) async {
    int id = await _database!.insert('Book', bM.toMap());
    return id;
  }

  Future<int> insertNewAuthor(List<Object?> args) async {
      await connectToDatabase();
    int id = await _database!.insert('Author', {'authorName': 'omar'});
   // int id = await _database!.rawInsert('INSERT INTO Author VALUES(?)', args);
    return id;
  }

  Future<int> connectBookWithAuthor(BookAuthorModel rel) async {
    int id = await _database!.insert('BookAuthor', rel.toMap());
    return id;
  }
}
