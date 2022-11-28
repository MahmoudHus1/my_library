import 'dart:io';

import 'package:my_library/models/author_model.dart';
import 'package:my_library/models/book_author_model.dart';
import 'package:my_library/models/book_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static final DbHelper dbHelper = DbHelper._init();
  DbHelper._init();

  static late Database _database;
  Future<void> connectToDatabase() async {
    final Directory directory = await getApplicationDocumentsDirectory();

    _database = await openDatabase(
      '${directory.path}/library.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
               CREATE TABLE Book (
                  bookId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
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
        await db.execute('''
               CREATE TABLE Author (
                  authorId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, 
                  authorName TEXT
              )'''); // unique
        await db.execute('''
               CREATE TABLE BookAuthor (
                  bookId INTEGER NOT NULL, 
                  authorId INTEGER NOT NULL,
                  FOREIGN KEY (bookId) REFERENCES Book (bookId),
                  FOREIGN KEY (authorId) REFERENCES Author (authorId)
              )''');
        print('created');
      },
    );
  }

  delete() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    await databaseFactory.deleteDatabase('${directory.path}/library.db');
  }

  Future<int> insertNewBook(BookModel bM) async {
    await connectToDatabase();
    int id = await _database.insert('Book', bM.toMap());
    return id;
  }

  Future<int> insertNewAuthor(String name) async {
    await connectToDatabase();
    int id = await _database.insert('Author', {'authorName': name});
    return id;
  }

  Future<int> connectBookWithAuthor(BookAuthorModel rel) async {
    int id = await _database.insert('BookAuthor', rel.toMap());
    return id;
  }

  Future<List<Map<String, Object?>>> getAllBooks() async {
    final List<Map<String, Object?>> data = await _database.rawQuery('''
    SELECT a.*, b.*
    FROM 
    Author as a INNER JOIN BookAuthor as ba ON ba.authorId = a.authorId
    INNER JOIN Book as b ON ba.bookId = b.bookId
    WHERE
    b.bookId IN (SELECT c.bookId
                    FROM BookAuthor c
                    GROUP BY c.bookId);
 ''');

    List<Map<String, dynamic>> bId = [];
    int i = 0;

    for (var element in data) {
      bool index = false;

      for (var bb in bId) {
        if (!index) {
          index = bb.containsValue(element['bookId']);
        }
      }

      if (!index) {
        final b = {
          'bookId': element['bookId'],
          'authors': [],
          'detials': element,
        };

        for (var e in data) {
          if (e['bookId'] == b['bookId']) {
            (b['authors'] as List).add(e['authorName']);
          }
        }

        bId.add(b);
        i++;
        i == bId.length ? i = bId.length - 1 : i;
      }
    }
    return bId;
  }

  Future<List<AuthorModel>> getAuthors() async {
    List<AuthorModel> list = [];
    await _database.query('Author').then((value) {
      for (var element in value) {
        list.add(AuthorModel.fromMap(element));
      }
    });

    return list;
  }

  Future<List<Map<String, Object?>>> getAllBooksForSameAuthor() async {
    return await _database.rawQuery(''' 
    SELECT a.authorName, b.*
      FROM Author as a
      INNER JOIN BookAuthor as ba
      ON a.authorId = ba.authorId
      INNER JOIN Book as b
      ON ba.bookId = b.bookId
    ''');
  }

    Future<int> deleteTask() async {
    int count =
        await _database.delete('Book', where: 'bookId=?');
    return count;
  }
}
