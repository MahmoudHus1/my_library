// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import 'package:my_library/providers/controller_provider.dart';

class Progress extends StatelessWidget {
  final double max;
  final int divisions;

  const Progress({
    Key? key,
    required this.max,
    required this.divisions,
  }) : super(key: key);

  void readStatus(BuildContext context) {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Consumer<NewBookProvider>(
            builder: (context, myProvider, widget) {
          return AlertDialog(
            title: divisions == 2 ? const Text('Choose read status') :  const Text('Choose number of pages'),
            content: SingleChildScrollView(
              child: Slider(
                activeColor: Colors.red,
                value: divisions == 2 ? myProvider.val : myProvider.pageCount,
                max: max,
                divisions: divisions,
                label: divisions == 2
                    ? myProvider.checkLabel(myProvider.val.round().toString())
                    : myProvider.pageCount.round().toString(),
                onChanged: (double value) {
                  if (divisions == 2) {
                    myProvider.changeValue(value);
                  } else if (divisions == max) {
                    myProvider.changePageCount(value);
                  }
                },
              ),
            ),
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: const Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewBookProvider>(builder: (context, myProvider, widget) {
      return InkWell(
        onTap: () {
          readStatus(context);
        },
        child: Container(
          width: divisions == 2 ? 120 : 100,
          padding: divisions == 2 ? const EdgeInsets.only(left: 10, top: 5, bottom: 5, right: 5) : const EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 5),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.1),
              borderRadius: BorderRadius.circular(5)),
          child: Row(
            children: [
              CircularPercentIndicator(
                radius: 15.0,
                lineWidth: 5.0,
                percent: divisions ==2 ? myProvider.progressAmount : (myProvider.pageCount/max),
                progressColor: Colors.red,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(divisions == 2
                  ? myProvider.labelValue
                  : myProvider.pageCount.round().toString()),
            ],
          ),
        ),
      );
    });
  }
}
