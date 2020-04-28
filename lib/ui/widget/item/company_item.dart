import 'package:flutter/material.dart';
import 'package:clutch/core/custom_route.dart';
import 'package:clutch/domain/network/model/response/company_response.dart';

class CompanyItem extends StatefulWidget {
  CompanyResponse _companyResponse;

  CompanyItem(this._companyResponse);

  @override
  _CompanyItemState createState() => _CompanyItemState();
}

class _CompanyItemState extends State<CompanyItem> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, CustomRoute.DETAILS_COMPANY,
              arguments: widget._companyResponse);
        },
        child: Card(
          elevation: 1,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: widget._companyResponse.color,
          child: Hero(
            tag: widget._companyResponse.image,
            child: Image.asset(widget._companyResponse.image),
          ),
        ),
      );
}
