import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/ui/widget/item/offer_item.dart';

class OffersTab extends StatelessWidget {
  final List<Widget> offers = [
    OfferItem(
      1,
      "Название акции 1",
      "assets/images/offers/offer1.png",
      subTitle: "до 12.01.2019",
    ),
    OfferItem(
      2,
      "Название акции 2",
      "assets/images/offers/offer2.png",
      subTitle: "до 12.01.2019",
    ),
    OfferItem(
      3,
      "Название акции 3",
      "assets/images/offers/offer3.png",
      subTitle: "до 12.01.2019",
      global: true,
    ),
    OfferItem(
      4,
      "Название акции 4",
      "assets/images/offers/offer.png",
      subTitle: "до 12.01.2019",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.only(top: 16.0), child: SizedBox());
  }
}
