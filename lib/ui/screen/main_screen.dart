import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/ui/widget/main_drawer.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

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
      drawer: MainDrawer(),
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
