import 'package:clutch/presentation/bloc/offer_details_bloc.dart';
import 'package:clutch/presentation/model/offer_details_model_ui.dart';
import 'package:clutch/presentation/state/offer_details_state.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:clutch/ui/screen/base_screen.dart';
import 'package:clutch/ui/widget/atom/bloc_error_indicator.dart';
import 'package:clutch/ui/widget/atom/loader_indicator.dart';
import 'package:clutch/ui/widget/organism/scrollable_offer_app_bar.dart';
import 'package:clutch/ui/widget/organism/tab/locations_tab.dart';
import 'package:clutch/ui/widget/organism/tab/offers_details_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/global.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen();

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
  Widget build(BuildContext context) => BaseScreen(
        child: Scaffold(body: BlocBuilder<OfferDetailsBloc, OfferDetailsState>(
            builder: (context, state) {
          if (state is OfferDetailsLoading) {
            return LoaderIndicator();
          }
          if (state is OfferDetailsLoaded) {
            OfferDetailsModelUi offer = state.offerDetailsModelUi;
            return NestedScrollView(
              headerSliverBuilder: (a1, a2) => <Widget>[
                ScrollableOfferAppBar(offer, hideFlexibleSpace),
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
                            offer.title,
                            style: TextStyle(fontSize: 24),
                          ),
                          Text(
                            offer.categoriesResponse?.title ?? "",
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
                                      insets: EdgeInsets.symmetric(
                                          horizontal: 12.0)),
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
                                      OffersDetailsTab(offer),
                                      LocationsTab(offer.places),
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
            );
          }
          return BlocErrorIndicator("");
        })),
      );
}
