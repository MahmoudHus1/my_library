import 'package:flutter/material.dart';
import 'package:my_library/core/constant/text.dart';

import '../widgets/FAQ_widget.dart';
import '../widgets/drawer/drawer_widget.dart';

class FAQ extends StatelessWidget {
  final bool _showTextField1 = false;
  final bool _showTextField2 = false;
  final bool _showTextField3 = false;
  final bool _showTextField4 = false;
  final bool _showTextField5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('FAQ'),
        backgroundColor: const Color.fromARGB(255, 243, 16, 0),
      ),
      body: ListView(
        children: [
          CustomText(
            question: MyText.q1,
            answer: MyText.a1,
            showTextField: _showTextField1,
            height: 50,
          ),
          const Divider(
            thickness: 2,
          ),
          CustomText(
            question: MyText.q2,
            answer: MyText.a2,
            showTextField: _showTextField2,
            height: 50,
          ),
          const Divider(
            thickness: 2,
          ),
          CustomText(
            question: MyText.q3,
            answer: MyText.a3,
            showTextField: _showTextField3,
            height: 80,
          ),
          const Divider(
            thickness: 2,
          ),
          CustomText(
            question: MyText.q4,
            answer: MyText.a4,
            showTextField: _showTextField4,
            height: 200,
          ),
          const Divider(
            thickness: 2,
          ),
          CustomText(
            question: MyText.q5,
            answer: MyText.a5,
            showTextField: _showTextField5,
            height: 100,
          ),
          const Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
