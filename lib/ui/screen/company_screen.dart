import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/repository/model/response/company_response.dart';
import 'package:flutter_clutch_mobile/ui/widget/scrollable_app_bar.dart';
import 'package:flutter_clutch_mobile/ui/widget/tab/company_details_tab.dart';

class CompanyScreen extends StatefulWidget {
  CompanyResponse company;

  CompanyScreen(this.company);

  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen>
    with TickerProviderStateMixin {
  TabController _companyTabController;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (a1, a2) => <Widget>[
            ScrollableAppBar(widget.company, _companyTabController),
          ],
          body: Container(
            child: TabBarView(
              controller: _companyTabController,
              children: <Widget>[
                SizedBox(),
                CompanyDetailsTab(widget.company),
                SizedBox()
              ],
            ),
          ),
        ),
      );

  @override
  void initState() {
    _companyTabController =
        TabController(length: 3, vsync: this, initialIndex: 1);
    super.initState();
  }
}
