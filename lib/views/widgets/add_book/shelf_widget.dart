// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:my_library/providers/controller_provider.dart';

class ShelfTextField extends StatelessWidget {
  final bool flag;
  ShelfTextField({
    Key? key,
    required this.flag,
  }) : super(key: key);
  final List<String> genderItems = [
    'Male',
    'Female',
  ];
  @override
  Widget build(BuildContext context) {
    return flag
        ? DropdownButtonFormField(
            decoration: InputDecoration(
              floatingLabelStyle: const TextStyle(color: Colors.red),
              labelText: 'Shelf',
              labelStyle: const TextStyle(color: Colors.red),
              isDense: true,
              contentPadding: const EdgeInsets.all(15),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 2),
              ),
              filled: true,
            ),
            isExpanded: true,
            hint: const Text(
              'Main shelf',
              style: TextStyle(fontSize: 14),
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 30,
            items: genderItems
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select gender.';
              }
            },
            onChanged: (value) {
              //Do something when changing the item if you want.
            },
            onSaved: (value) {
              Provider.of<NewBookProvider>(context, listen: false)
                  .changeSelectedValue(value.toString());
            },
          )
        : Container(
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
              ),
              items: genderItems
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please select gender.';
                }
              },
              onChanged: (value) {
                //Do something when changing the item if you want.
              },
              onSaved: (value) {
                Provider.of<NewBookProvider>(context, listen: false)
                    .changeSelectedValue(value.toString());
              },
            ),
          );
  }
}
