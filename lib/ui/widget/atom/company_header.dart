import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:flutter/material.dart';
import 'package:clutch/ui/widget/atom/rating_wrapper.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CompanyHeader extends StatelessWidget {
  final CompanyShortMobile _company;

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
          RatingWrapper(4),
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
