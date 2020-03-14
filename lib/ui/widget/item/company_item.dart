import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/core/custom_route.dart';
import 'package:flutter_clutch_mobile/ui/screen/company_screen.dart';

class CompanyItem extends StatelessWidget {
  final int id;
  final Color color;
  final String image;

  CompanyItem(this.id, this.image, {this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CustomRoute.DETAILS_COMPANY,
            arguments: id);
      },
      child: Card(
        elevation: 1,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: color,
        child: Container(
          child: Image.asset(image),
        ),
      ),
    );
  }
}
