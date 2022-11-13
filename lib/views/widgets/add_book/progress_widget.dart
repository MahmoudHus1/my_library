import 'package:flutter/material.dart';
import 'package:my_library/providers/controller_provider.dart';
import 'package:provider/provider.dart';

class Progress {
  


  static void readStatus(BuildContext context) {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Consumer<NewBookProvider>(
          builder: (context, myProvider, widget) {
            return AlertDialog(
              title: const Text('You clicked on'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Slider(
                      value: myProvider.val,
                      max: 10,
                      divisions: 2,
                      label: myProvider.checkLabel(myProvider.val.round().toString()),
                      onChanged: (double value) {
                        myProvider.val = value;
                      },
                    )
                  ],
                ),
              ),
              actions: [
                ElevatedButton(
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }
        );
      },
    );
  }
}