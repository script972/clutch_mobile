import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/ui/widget/item/offer_item.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class OffersTab extends StatelessWidget {
  final List<OfferItem> offers = [
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
      "assets/images/offers/offer1.png",
      subTitle: "до 12.01.2019",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 8.0),
        child: StaggeredGridView.countBuilder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          crossAxisCount: 4,
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          itemCount: this.offers.length,
          itemBuilder: (BuildContext context, int index) => offers[index],
          staggeredTileBuilder: (int index) => this.offers[index].staggeredTile,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ));
  }
}
