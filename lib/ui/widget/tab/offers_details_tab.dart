import 'package:clutch/domain/network/model/response/categories_response.dart';
import 'package:clutch/domain/network/model/response/offer_details_mobile_dto.dart';
import 'package:clutch/presentation/model/offer_details_model_ui.dart';
import 'package:clutch/ui/widget/atom/icon_description_item.dart';
import 'package:clutch/ui/widget/organism/about_widget.dart';
import 'package:flutter/material.dart';

class OffersDetailsTab extends StatefulWidget {
  final OfferDetailsModelUi offer;

  OffersDetailsTab(this.offer);

  @override
  _OffersDetailsTabState createState() => _OffersDetailsTabState();
}

class _OffersDetailsTabState extends State<OffersDetailsTab> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /*CompanyHeader(widget.company)*/
            Divider(),
            AboutWidget("О предложении", widget.offer.description),
            IconDescriptionItem(
              "assets/images/ic_calendar.png",
              "380936629627",
              color: Color(0xFFFF473D),
            ),
            IconDescriptionItem(
                "assets/images/ic_phone.png", "+38 099 000 00 00")

            /*WorkSchedule(),
            Divider(),*/
          ]),
    );
  }
}
