import 'package:clutch/presentation/bloc/company_details_bloc.dart';
import 'package:clutch/presentation/state/company_details_state.dart';
import 'package:clutch/ui/widget/atom/bloc_error_indicator.dart';
import 'package:clutch/ui/widget/atom/loader_indicator.dart';
import 'package:clutch/ui/widget/organism/tab/company_details_tab.dart';
import 'package:clutch/ui/widget/organism/tab/locations_tab.dart';
import 'package:clutch/ui/widget/organism/tab/offers_tab.dart';
import 'package:flutter/material.dart';
import 'package:clutch/ui/widget/organism/scrollable_company_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompanyScreen extends StatefulWidget {
  CompanyScreen();

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
  Widget build(BuildContext context) =>
      Scaffold(body: BlocBuilder<CompanyDetailsBloc, CompanyDetailsState>(
          builder: (context, state) {
        if (state is CompanyDetailsLoading) {
          return LoaderIndicator();
        }
        if (state is CompanyDetailsLoaded) {
          return NestedScrollView(
            headerSliverBuilder: (a1, a2) => <Widget>[
              ScrollableCompanyAppBar(
                  state.companyDetailsModelUi, _companyTabController),
            ],
            body: Container(
              child: TabBarView(
                controller: _companyTabController,
                children: <Widget>[
                  OffersTab(state.companyDetailsModelUi.offers),
                  CompanyDetailsTab(state.companyDetailsModelUi),
                  LocationsTab(state.companyDetailsModelUi.places, state.camera),
                ],
              ),
            ),
          );
        }
        return BlocErrorIndicator("");
      }));
}
