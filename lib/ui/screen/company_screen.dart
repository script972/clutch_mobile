import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:flutter/material.dart';
import 'package:clutch/ui/widget/organism/scrollable_company_app_bar.dart';
import 'package:clutch/ui/widget/tab/company_details_tab.dart';
import 'package:clutch/ui/widget/tab/locations_tab.dart';

class CompanyScreen extends StatefulWidget {
  CompanyShortMobile company;

  CompanyScreen(this.company);

  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen>
    with TickerProviderStateMixin {
  TabController _companyTabController;

  @override
  void initState() {
    _companyTabController =
        TabController(length: 3, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (a1, a2) => <Widget>[
            ScrollableCompanyAppBar(widget.company, _companyTabController),
          ],
          body: Container(
            child: TabBarView(
              controller: _companyTabController,
              children: <Widget>[
                SizedBox(),
                CompanyDetailsTab(widget.company),
                LocationsTab(),
              ],
            ),
          ),
        ),
      );


}
