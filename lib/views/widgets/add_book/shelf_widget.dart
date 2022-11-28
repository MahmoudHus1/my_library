// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_library/providers/controller_provider.dart';

class ShelfTextField extends StatelessWidget {
  ShelfTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
            margin: const EdgeInsets.only(right: 20),
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.1),
            ),
            child: DropdownButtonFormField(
              iconSize: 0.0,
              decoration: InputDecoration(
                fillColor: Colors.red,
                prefixIcon: const Icon(
                  Icons.library_books,
                  color: Colors.red,
                ),
                floatingLabelStyle: const TextStyle(color: Colors.red),
                contentPadding: const EdgeInsets.all(0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 0),
                ),
              ),
              isExpanded: true,
              hint: const Text(
                'Main shelf',
                style: TextStyle(fontSize: 15),
              ), items: [], onChanged: (value) {
                
              },
            ),
          );
  }
}
