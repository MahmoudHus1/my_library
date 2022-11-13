// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../providers/controller_provider.dart';
import '../widgets/add_book/progress_widget.dart';

class AddNewBook extends StatefulWidget {
  const AddNewBook({super.key});

  @override
  State<AddNewBook> createState() => _AddNewBookState();
}

class _AddNewBookState extends State<AddNewBook> {
  TextEditingController titleController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController genreController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController pageCountCotroller = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController isbnController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController shelfController = TextEditingController();
  TextEditingController readStatusControoler = TextEditingController();
  TextEditingController borrowedcontroller = TextEditingController();
  TextEditingController returnDateController = TextEditingController();

  bool isSelect = false;
  bool _showTextField = false;
  double rating = 0;
  String? selectedValue;

  final List<String> genderItems = [
    'Male',
    'Female',
  ];
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

   


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        backgroundColor: const Color.fromARGB(255, 37, 189, 7),
        child: const Icon(Icons.check),
      ),
      appBar: AppBar(
        title: const Text('New Book'),
        backgroundColor: const Color.fromARGB(255, 243, 16, 0),
      ),
      body: Consumer<NewBookProvider>(
        builder: (context, myProvider,widget) {
          return Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: ListView(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        CustomTextField(
                          hintText: 'Title',
                          labelText: 'Title',
                          controller: titleController,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: authorController,
                          decoration: InputDecoration(
                            filled: true,
                            floatingLabelStyle: const TextStyle(color: Colors.red),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 2)),
                            labelText: 'Author',
                            hintText: 'Author',
                            suffixIcon:
                                InkWell(onTap: () {}, child: const Icon(Icons.add)),
                          ),
                        ),
                      ],
                    )),
                    SizedBox(
                        width: 170,
                        height: 200,
                        child: InkWell(
                          child: InkWell(
                            child: Image.network(
                              'https://icons.veryicon.com/png/o/business/colorful-office-icons/book-52.png',
                            ),
                          ),
                        ))
                  ],
                ),
                CustomTextField(
                  hintText: 'Genre',
                  labelText: 'Genre',
                  controller: genreController,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        hintText: 'Year published',
                        labelText: 'Year published',
                        controller: yearController,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CustomTextField(
                        hintText: 'Page count',
                        labelText: 'Page count',
                        controller: pageCountCotroller,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hintText: 'English',
                  labelText: 'Language',
                  controller: languageController,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                    controller: isbnController,
                    decoration: InputDecoration(
                      filled: true,
                      floatingLabelStyle: const TextStyle(color: Colors.red),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2)),
                      labelText: 'ISBN',
                      suffixIcon: InkWell(
                          onTap: () {
                            isbnController.text += 'X';
                          },
                          child: const Icon(Icons.close)),
                      hintText: isbnController.text,
                    )),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      filled: true,
                      floatingLabelStyle: const TextStyle(color: Colors.red),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 2)),
                      labelText: 'Enter a description',
                      hintText: 'Enter a description'),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  hintText: 'Notes',
                  labelText: 'Notes',
                  controller: notesController,
                ),
                const SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    floatingLabelStyle: const TextStyle(color: Colors.red),
                    labelText: 'Shelf',
                    labelStyle: const TextStyle(color: Colors.red),
                    isDense: true,
                    contentPadding: EdgeInsets.all(15),
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
                    selectedValue = value.toString();
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        child: RatingBar.builder(
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemSize: 30,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        this.rating = rating;
                        print(rating);
                      },
                    )),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Progress.readStatus(context);
                            log(myProvider.labelValue);
                            setState(() {});
                          },
                          child: CircularPercentIndicator(
                            radius: 20.0,
                            lineWidth: 7.0,
                            percent: myProvider.progressAmount,
                            progressColor: Colors.red,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(myProvider.labelValue),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isSelect,
                      activeColor: Colors.red,
                      onChanged: (value) {
                        setState(() {
                          isSelect = value!;
                          if (isSelect) {
                            _showTextField = true;
                          } else {
                            _showTextField = false;
                          }
                        });
                      },
                    ),
                    const Text('Borrowed')
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Visibility(
                  visible: _showTextField,
                  child: Column(
                    children: [
                      CustomTextField(
                        hintText: 'Library',
                        labelText: 'Borrowed From',
                        controller: borrowedcontroller,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                          controller: returnDateController,
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
                              setState(() {
                                returnDateController.text = formattedDate;
                              });
                            } else {
                              print("Date is not selected");
                            }
                          })
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  String labelText;
  String hintText;
  TextEditingController controller;

  CustomTextField(
      {Key? key,
      required this.labelText,
      required this.hintText,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        floatingLabelStyle: const TextStyle(color: Colors.red),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2)),
        labelText: labelText,
        hintText: hintText,
      ),
    );
  }
}

