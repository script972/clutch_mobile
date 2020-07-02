import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/presentation/bloc/main_bloc.dart';
import 'package:clutch/presentation/event/main_event.dart';
import 'package:clutch/presentation/model/short_offer_model_ui.dart';
import 'package:clutch/presentation/state/main_state.dart';
import 'package:clutch/ui/screen/base_screen.dart';
import 'package:clutch/ui/widget/organism/categories_drawer.dart';
import 'package:clutch/ui/widget/organism/main_drawer.dart';
import 'package:clutch/ui/widget/organism/search_app_bar.dart';
import 'package:clutch/ui/widget/organism/tab/companies_tab.dart';
import 'package:clutch/ui/widget/organism/tab/offers_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Future<void> initState() {
    _tabController = TabController(length: 2, vsync: this);
    BlocProvider.of<MainBloc>(context).add(LoadMain());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScreen(
        child: Scaffold(
            key: this._scaffoldKey,
            appBar: SearchAppBar(_tabController, _scaffoldKey),
            drawer: MainDrawer(),
            endDrawer: CategoriesDrawer(),
            backgroundColor: Colors.white,
            body: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
              List<ShortOfferModelUi> offer = [];
              List<CompanyShortMobile> company = [];
              if (state is MainLoaded) {
                offer = state.offer;
                company = state.company;
              }
              return Stack(
                children: <Widget>[
                  TabBarView(
                    children: [OffersTab(offer), CompaniesTab(company)],
                    controller: _tabController,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          onTap: () {},
                          child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                                border: Border.all(
                                  width: 0,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  _scaffoldKey.currentState.openEndDrawer();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    "assets/images/ic_filter.png",
                                    color: Colors.white,
                                  ),
                                ),
                              ))))
                ],
              );
            })),
      );
}
