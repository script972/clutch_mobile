import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/presentation/bloc/main_bloc.dart';
import 'package:clutch/presentation/model/short_offer_model_ui.dart';
import 'package:clutch/presentation/state/main_state.dart';
import 'package:clutch/ui/screen/base_screen.dart';
import 'package:clutch/ui/widget/organism/tab/companies_tab.dart';
import 'package:clutch/ui/widget/organism/tab/offers_tab.dart';
import 'package:flutter/material.dart';
import 'package:clutch/ui/widget/organism/main_drawer.dart';
import 'package:clutch/ui/widget/organism/search_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScreen(
    child: Scaffold(
        key: this._scaffoldKey,
        appBar: SearchAppBar(_tabController, _scaffoldKey),
        drawer: MainDrawer(),
        backgroundColor: Colors.white,
        body: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
          List<ShortOfferModelUi> offer = [];
          List<CompanyShortMobile> company= [];
          if (state is MainLoaded) {
            offer = state.offer;
            company = state.company;
          }
          return TabBarView(
            children: [OffersTab(offer), CompaniesTab(company)],
            controller: _tabController,
          );
        })),
  );
}
