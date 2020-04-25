import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingWrapper extends StatelessWidget {
  final double ITEM_SIZE = 25;

  int rait;

  RatingWrapper(this.rait);

  @override
  Widget build(BuildContext context) => FlutterRatingBar(
        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
        fullRatingWidget: Image.asset(
          'assets/images/ic_star_active.png',
        ),
        noRatingWidget: Image.asset(
          'assets/images/ic_star.png',
        ),
        initialRating: rait.toDouble(),
        itemSize: ITEM_SIZE,
      );
}
