// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import 'package:my_library/providers/controller_provider.dart';

class Rating extends StatelessWidget {
  double initialRating = 0.0;
  Rating({
    Key? key,
    required this.initialRating,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<NewBookProvider>(builder: (context, myProvider, widget) {
      return RatingBar.builder(
        initialRating: initialRating,
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
          myProvider.changeRating(rating);
          print(rating);
        },
      );
    });
  }
}
