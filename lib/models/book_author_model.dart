import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class BookAuthorModel {
  int bookId;
  int authorId;
  BookAuthorModel({
    required this.bookId,
    required this.authorId,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookId': bookId,
      'authorId': authorId,
    };
  }

  factory BookAuthorModel.fromMap(Map<String, dynamic> map) {
    return BookAuthorModel(
      bookId: map['bookId'] as int,
      authorId: map['authorId'] as int,
    );
  }
}
