import 'package:clutch/helpers/utils/shared_preferences_helper.dart';
import 'package:flutter/material.dart';
import 'package:clutch/ui/widget/organism/main_drawer.dart';
import 'package:clutch/ui/widget/organism/search_app_bar.dart';
import 'package:clutch/ui/widget/tab/companies_tab.dart';
import 'package:clutch/ui/widget/tab/offers_tab.dart';

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
  Widget build(BuildContext context) => Scaffold(
        key: this._scaffoldKey,
        appBar: SearchAppBar(_tabController, _scaffoldKey),
        drawer: MainDrawer(),
        backgroundColor: Colors.white,
        body: TabBarView(
          children: [OffersTab(), CompaniesTab()],
          controller: _tabController,
        ),
      );
}
