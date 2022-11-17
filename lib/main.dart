// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_library/db/dbhelper.dart';
import 'package:my_library/providers/controller_provider.dart';
import 'package:my_library/views/screens/titles.dart';
import 'package:provider/provider.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NewBookProvider>(
        create: (context) {
          return NewBookProvider();
        },
        child: const InitApp());
  }
}

class InitApp extends StatelessWidget {
  const InitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyBookLibrary',
      home:  Titles(),
    );
  }
}
