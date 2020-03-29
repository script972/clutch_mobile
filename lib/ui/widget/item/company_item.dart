import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/core/custom_route.dart';
import 'package:flutter_clutch_mobile/repository/model/response/company_response.dart';

class CompanyItem extends StatelessWidget {
  CompanyResponse _companyResponse;

  CompanyItem(this._companyResponse);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CustomRoute.DETAILS_COMPANY,
            arguments: _companyResponse);
      },
      child: Card(
        elevation: 1,
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        color: _companyResponse.color,
        child: Container(
          child: Image.asset(_companyResponse.image),
        ),
      ),
    );
  }
}
