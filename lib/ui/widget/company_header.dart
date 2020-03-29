import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/repository/model/response/company_response.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CompanyHeader extends StatelessWidget {
  final CompanyResponse _company;

  CompanyHeader(this._company);

  @override
  Widget build(BuildContext context) => ListTile(
      title: Text(
        _company.title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
      subtitle: Text('Lorem ipsum'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FlutterRatingBar(
            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
            fillColor: Color(0xFFF88821),
            ignoreGestures: true,
            fullRatingWidget: Image.asset(
              'assets/images/ic_star_active.png',
              scale: 0.7,
            ),
            noRatingWidget: Image.asset(
              'assets/images/ic_star.png',
              scale: 0.7,
            ),
            initialRating: 4,
            itemSize: 25,
            tapOnlyMode: true,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              '381,830',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.38), fontSize: 12),
            ),
          )
        ],
      ),
    );
}
