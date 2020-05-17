import 'package:clutch/domain/network/model/response/categories_response.dart';
import 'package:clutch/presentation/model/offer_details_model_ui.dart';
import 'package:clutch/presentation/model/place_model_ui.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:clutch/ui/widget/organism/scrollable_offer_app_bar.dart';
import 'package:clutch/ui/widget/tab/locations_tab.dart';
import 'package:clutch/ui/widget/tab/offers_details_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/global.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OfferScreen extends StatefulWidget {
  OfferDetailsModelUi _offer = OfferDetailsModelUi(
      1,
      "333",
      [
        "https://gotoshop.ua/img/p/2020/05/114111/1686678-114111-515415895344155703.jpg?t=t1589534463",
        "https://gotoshop.ua/img/p/2020/05/114110/1686677-114110-870415895342938532.jpg?t=t1589534281",
        "https://atbakcii.com.ua/wp-content/uploads/2018/06/anons-aktsii-ekonomiya-v-atb-s-20-06-2018-po-26-06-2018-2.jpg"
      ],
      "title",
      Colors.red,
      CategoriesResponse(title: "title", icon: "", id: 1),
      "description",
      "380936629627",
      "От 33 до 33",
      [
        PlaceModelUi(
          "name",
          "address",
          "vicinit",
          "imageUrl",
          LatLng(22, 33),
        )
      ]);

  /*OfferDetailsMobileDto _offer = OfferDetailsMobileDto(
    "Акция",
    CategoriesResponse(title: 'Косметика', icon: "", id: 1),
    "Описание",
    23,
    "+380936629627",
    images: [
      "https://gotoshop.ua/img/p/2020/05/114111/1686678-114111-515415895344155703.jpg?t=t1589534463",
      "https://gotoshop.ua/img/p/2020/05/114110/1686677-114110-870415895342938532.jpg?t=t1589534281",
      "https://atbakcii.com.ua/wp-content/uploads/2018/06/anons-aktsii-ekonomiya-v-atb-s-20-06-2018-po-26-06-2018-2.jpg"
    ],
  );*/
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
                        widget._offer.categoriesResponse?.title ?? "",
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
                                  LocationsTab(widget._offer.places),
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
