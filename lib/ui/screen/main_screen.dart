import 'package:circle_bottom_navigation/circle_bottom_navigation.dart';
import 'package:circle_bottom_navigation/widgets/tab_data.dart';
import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/helpers/bottom_navigation_icons.dart';
import 'package:clutch/presentation/bloc/main_bloc.dart';
import 'package:clutch/presentation/event/main_event.dart';
import 'package:clutch/presentation/model/short_offer_model_ui.dart';
import 'package:clutch/presentation/state/main_state.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:clutch/ui/screen/base_screen.dart';
import 'package:clutch/ui/widget/atom/bloc_error_indicator.dart';
import 'package:clutch/ui/widget/atom/loader_indicator.dart';
import 'package:clutch/ui/widget/organism/tab/companies_tab.dart';
import 'package:clutch/ui/widget/organism/tab/maps_big_tab.dart';
import 'package:clutch/ui/widget/organism/tab/offers_tab.dart';
import 'package:clutch/ui/widget/organism/tab/setting_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/global.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int itemIndex = 0;
  String appbarTitle = "";

  @override
  Future<void> initState() {
    BlocProvider.of<MainBloc>(context).add(LoadMain());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Scaffold(
          key: this._scaffoldKey,
          appBar: appbarTitle.isNotEmpty
              ? AppBar(
                  title: Text(appbarTitle),
                )
              : null,
          backgroundColor: Colors.white,
          bottomNavigationBar:
              BlocBuilder<MainBloc, MainState>(builder: (context, state) {
            return state is MainLoaded ? bottomMenu() : SizedBox();
          }),
          body: SafeArea(
            child: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
              List<ShortOfferModelUi> offer = [];
              List<CompanyShortMobile> company = [];

              var listBody = List<Widget>();
              if (state is MainLoading) {
                return LoaderIndicator();
              }
              if (state is MainLoaded) {
                company = state.company;
                listBody.add(CompaniesTab(company));
                listBody.add(MapsBigTab());
                offer = state.offer;
                listBody.add(OffersTab(offer));

                listBody.add(SettingTab());

                return Stack(
                  children: <Widget>[
                    listBody[itemIndex],
                    /* itemIndex != 2
                        ? Align(
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
                                        _scaffoldKey.currentState
                                            .openEndDrawer();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          "assets/images/ic_filter.png",
                                          color: Colors.white,
                                        ),
                                      ),
                                    ))))
                        : SizedBox()*/
                  ],
                );
              }

              return BlocErrorIndicator("Something wrong");
            }),
          )),
    );
  }

  Widget bottomMenu() => CircleBottomNavigation(
        initialSelection: itemIndex,
        hasElevationShadows: true,
        barHeight: 50.0,
        circleSize: 55,
        onTabChangedListener: (index) {
          setState(() {
            itemIndex = index;
            if (itemIndex == 3) {
              appbarTitle = translate(Keys.Settings);
            } else {
              appbarTitle = "";
            }
          });
        },
        tabs: [
          TabData(
            icon: Bottom_navigation_icon.account_balance,
            //title: translate(Keys.Discount),
          ),
          TabData(
            icon: Icons.map,
            //title: translate(Keys.Big_Map)
          ),
          TabData(
            icon: Bottom_navigation_icon.local_offer,
            //title: translate(Keys.Offers)
          ),
          TabData(
            icon: Bottom_navigation_icon.settings,
            //title: translate(Keys.Settings)
          ),
        ],
      );
}
