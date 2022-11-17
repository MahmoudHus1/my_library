import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_library/providers/controller_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class ReturnDate extends StatelessWidget {
  
  void initState() {
    initializeDateFormatting();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewBookProvider>(builder: (context, myProvider, widget) {
      return TextField(
          controller: myProvider.returnDateController,
          decoration: const InputDecoration(
              floatingLabelStyle: TextStyle(color: Colors.red),
              icon: Icon(
                Icons.calendar_today,
                color: Colors.red,
              ),
              labelText: "Return Date"),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1201),
              lastDate: DateTime(2101),
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: const ColorScheme.light(
                      primary: Colors.red, // <-- SEE HERE
                      onPrimary: Colors.white, // <-- SEE HERE
                    ),
                  ),
                  child: child!,
                );
              },
            );

            if (pickedDate != null) {
              print(pickedDate);
              String formattedDate =
                  DateFormat('yyyy-MM-dd').format(pickedDate);
              print(formattedDate);
              myProvider.returnDateController.text = formattedDate;
            } else {
              print("Date is not selected");
            }
          });
    });
  }
}
