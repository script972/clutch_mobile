import 'package:clutch/domain/network/model/response/categories_response.dart';
import 'package:clutch/domain/network/model/response/offer_details_mobile_dto.dart';
import 'package:clutch/ui/widget/organism/scrollable_offer_app_bar.dart';
import 'package:clutch/ui/widget/tab/company_locations_tab.dart';
import 'package:clutch/ui/widget/tab/offers_details_tab.dart';
import 'package:flutter/material.dart';

class OfferScreen extends StatefulWidget {
  OfferDetailsMobileDto _offer = OfferDetailsMobileDto(
      "Акция",
      CategoriesResponse(title: 'Косметика',icon: "", id: 1),
      "Описание", 23, "+380936629627"
  );
  int id;

  OfferScreen(this.id);

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen>
    with TickerProviderStateMixin {
  TabController _offerTabController;

  @override
  void initState() {
    super.initState();
    _offerTabController =
        TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (a1, a2) => <Widget>[
          ScrollableOfferAppBar(widget._offer, _offerTabController),
        ],
        body: Container(
          child: TabBarView(
            controller: _offerTabController,
            children: <Widget>[
              OffersDetailsTab(widget._offer),
              CompanyLocationsTab(),
            ],
          ),
        ),
      ),
    );
  }
}
