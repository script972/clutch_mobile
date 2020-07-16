import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/presentation/model/company_details_model_ui.dart';
import 'package:clutch/presentation/model/offer_details_model_ui.dart';
import 'package:flutter/material.dart';
import 'package:clutch/ui/widget/atom/rating_wrapper.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CompanyHeader extends StatelessWidget {
  final CompanyDetailsModelUi _company;

  CompanyHeader(this._company);

  @override
  Widget build(BuildContext context) => ListTile(
    leading: (_company.categoriesResponse!=null && _company.categoriesResponse.icon!=null && _company.categoriesResponse.icon.isNotEmpty) ? Image.network(_company.categoriesResponse.icon) : SizedBox(),
      title: Text(
        _company.title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(_company?.categoriesResponse?.title ?? ""),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          /*RatingWrapper(4),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              '381,830',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.38), fontSize: 12),
            ),
          )*/
        ],
      ),
    );
}
