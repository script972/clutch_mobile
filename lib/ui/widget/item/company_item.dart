import 'package:flutter/material.dart';

class CompanyItem extends StatelessWidget {
  final int id;
  final Color color;
  final String image;

  CompanyItem(this.id, this.image, {this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 1,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: color,
        child: Container(
          child: Image.asset(image),
        ),
      ),
    );
  }
}
