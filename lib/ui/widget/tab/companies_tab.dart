import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/repository/model/response/company_response.dart';
import 'package:flutter_clutch_mobile/ui/widget/item/company_item.dart';


class CompaniesTab extends StatelessWidget {
  final List<Widget> companyList = <Widget>[
    CompanyItem(CompanyResponse(
        1, "foxtrot", "assets/images/logos/foxtrot.png", Color(0xFFFE5000))),
    CompanyItem(CompanyResponse(
        2, "adidas", "assets/images/logos/adidas.png", Colors.white)),
    CompanyItem(CompanyResponse(
        3, "adidas", "assets/images/logos/turkishairlines.png", Colors.white)),
    CompanyItem(CompanyResponse(
        4, "reebok", "assets/images/logos/reebok.png", Color(0xFF0074CD))),
    CompanyItem(CompanyResponse(
        5, "answear", "assets/images/logos/answear.png", Color(0xFFF1B1C8))),
    CompanyItem(CompanyResponse(
        5, "puma", "assets/images/logos/puma.png", Colors.black)),
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
