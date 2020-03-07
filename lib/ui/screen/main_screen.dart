import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/ui/widget/drawer.dart';
import 'package:flutter_clutch_mobile/ui/widget/search_app_bar.dart';
import 'package:flutter_clutch_mobile/ui/widget/tab/companies_tab.dart';
import 'package:flutter_clutch_mobile/ui/widget/tab/offers_tab.dart';

class MainScreen extends StatefulWidget {


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final GlobalKey _scaffoldKey = GlobalKey();


  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: SearchAppBar(_tabController, _scaffoldKey),
      drawer: mainDrawer(),
      backgroundColor: Colors.white,
      body: TabBarView(
        children: [OffersTab(), CompaniesTab()],
        controller: _tabController,
      ),
    );
  }
}
