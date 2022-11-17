import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  String question;
  String answer;
  bool showTextField;
  double height;

  CustomText(
      {Key? key,
      required this.question,
      required this.answer,
      required this.showTextField,
      required this.height})
      : super(key: key);

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.showTextField = !widget.showTextField;
        setState(() {});
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        height: widget.showTextField ? widget.height : 30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(widget.showTextField
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down),
                Text(widget.question,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ],
            ),
            Visibility(
              visible: widget.showTextField,
              child: Text(widget.answer, style: const TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ),
    );
  }
}
