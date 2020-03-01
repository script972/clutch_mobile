import 'package:flutter/material.dart';

import '../item/company_item.dart';

class CompaniesTab extends StatelessWidget {
  final List<Widget> companyList = <Widget>[
    CompanyItem(1, "assets/images/logos/foxtrot.png", color: Color(0xFFFE5000)),
    CompanyItem(2, "assets/images/logos/adidas.png"),
    CompanyItem(3, "assets/images/logos/turkishairlines.png"),
    CompanyItem(4, "assets/images/logos/reebok.png", color: Color(0xFF0074CD)),
    CompanyItem(5, "assets/images/logos/answear.png", color: Color(0xFFF1B1C8)),
    CompanyItem(6, "assets/images/logos/puma.png", color: Colors.black),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0, left: 8.0, right: 8.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        children: companyList,
      ),
    );
  }
}
