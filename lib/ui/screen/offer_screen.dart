import 'package:clutch/domain/network/model/response/categories_response.dart';
import 'package:clutch/domain/network/model/response/offer_details_mobile_dto.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:clutch/ui/widget/organism/scrollable_offer_app_bar.dart';
import 'package:clutch/ui/widget/tab/locations_tab.dart';
import 'package:clutch/ui/widget/tab/offers_details_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/global.dart';

class OfferScreen extends StatefulWidget {
  OfferDetailsMobileDto _offer = OfferDetailsMobileDto(
    "Акция",
    CategoriesResponse(title: 'Косметика', icon: "", id: 1),
    "Описание",
    23,
    "+380936629627",
    images: [
      "https://manticoreworld.com/wp-content/uploads/2017/01/Team-Foxtrot.png",
      "https://lioncom.pro/wp-content/uploads/2020/01/foxtrot-colored_new.png"
    ],
  );
  int id;

  OfferScreen(this.id);

  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen>
    with TickerProviderStateMixin {
  TabController _offerTabController;
  bool hideFlexibleSpace = false;

  @override
  void initState() {
    super.initState();
    _offerTabController =
        TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (a1, a2) => <Widget>[
            ScrollableOfferAppBar(widget._offer, hideFlexibleSpace),
          ],
          body: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        widget._offer.title,
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        widget._offer.categories?.title ?? "",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: TabBar(
                              onTap: (tab) {
                                setState(() {
                                  if (_offerTabController.index == 1)
                                    hideFlexibleSpace = true;
                                  else
                                    hideFlexibleSpace = false;
                                });
                              },
                              unselectedLabelColor:
                                  Colors.black.withOpacity(0.56),
                              labelColor: Colors.black,
                              isScrollable: true,
                              indicator: UnderlineTabIndicator(
                                  borderSide: BorderSide(
                                      width: 3.0, color: Colors.black),
                                  insets:
                                      EdgeInsets.symmetric(horizontal: 12.0)),
                              tabs: [
                                Tab(text: translate(Keys.Details)),
                                Tab(text: translate(Keys.Locations)),
                              ],
                              controller: _offerTabController,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: TabBarView(
                                controller: _offerTabController,
                                children: <Widget>[
                                  OffersDetailsTab(widget._offer),
                                  LocationsTab(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
