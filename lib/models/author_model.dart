import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthorModel {
  int? authorId;
  String authorName;
  AuthorModel({
    this.authorId,
    required this.authorName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'authorId': authorId,
      'authorName': authorName,
    };
  }

  factory AuthorModel.fromMap(Map<String, dynamic> map) {
    return AuthorModel(
      authorId: map['authorId'] as int,
      authorName: map['authorName'] as String,
    );
  }
}
