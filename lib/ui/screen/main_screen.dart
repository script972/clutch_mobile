import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/presentation/bloc/main_bloc.dart';
import 'package:clutch/presentation/event/main_event.dart';
import 'package:clutch/presentation/model/short_offer_model_ui.dart';
import 'package:clutch/presentation/state/main_state.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:clutch/ui/screen/base_screen.dart';
import 'package:clutch/ui/widget/atom/bloc_error_indicator.dart';
import 'package:clutch/ui/widget/atom/loader_indicator.dart';
import 'package:clutch/ui/widget/organism/categories_drawer.dart';
import 'package:clutch/ui/widget/organism/main_drawer.dart';
import 'package:clutch/ui/widget/organism/tab/companies_tab.dart';
import 'package:clutch/ui/widget/organism/tab/offers_tab.dart';
import 'package:clutch/ui/widget/organism/tab/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/flutter_translate.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  int itemIndex = 0;

  @override
  Future<void> initState() {
    _tabController = TabController(length: 2, vsync: this);
    BlocProvider.of<MainBloc>(context).add(LoadMain());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Scaffold(
          key: this._scaffoldKey,
          //appBar: SearchAppBar(_tabController, _scaffoldKey),
          drawer: MainDrawer(),
          endDrawer: CategoriesDrawer(),
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
                offer = state.offer;
                listBody.add(OffersTab(offer));
                listBody.add(ProfileTab());

                listBody.add(SizedBox());
                return Stack(
                  children: <Widget>[
                    listBody[itemIndex],
                    itemIndex != 2
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
                        : SizedBox()
                  ],
                );
              }

              return BlocErrorIndicator("Something wrong");
            }),
          )),
    );
  }

  Widget bottomMenu() =>
      BlocBuilder<MainBloc, MainState>(builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: itemIndex,
          onTap: (index) {
            setState(() {
              itemIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/ic_company.png",
                color: Colors.green,
              ),
              title: Text(translate(Keys.Corporation)),
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/ic_offer.png",
                width: 24.0,
                color: Colors.green,
              ),
              title: Text(translate(Keys.Offers)),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                title: Text(translate(Keys.Profile)))
          ],
        );
      });
}
