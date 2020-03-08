import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/ui/widget/drawer.dart';
import 'package:flutter_clutch_mobile/ui/widget/search_app_bar.dart';
import 'package:flutter_clutch_mobile/ui/widget/tab/companies_tab.dart';
import 'package:flutter_clutch_mobile/ui/widget/tab/offers_tab.dart';

class MainRoute extends StatefulWidget {
  @override
  _MainRouteState createState() => _MainRouteState();
}

class _MainRouteState extends State<MainRoute>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  //static int _selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: this._scaffoldKey,
      appBar: SearchAppBar(_tabController, _scaffoldKey),
      drawer: mainDrawer(),
      /*bottomNavigationBar:
          BottomNavigation.mainBottomNavigation(_onItemTapped, _selectedIndex),*/
      backgroundColor: Colors.white,
      body: TabBarView(
        children: [OffersTab(), CompaniesTab()],
        controller: _tabController,
      ),
    );
  }

  /*void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      debugPrint(">>>>${index}");
    });
  }*/
}
