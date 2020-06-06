import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/presentation/model/company_details_model_ui.dart';
import 'package:clutch/presentation/model/offer_details_model_ui.dart';
import 'package:clutch/ui/widget/atom/cached_network_image_wrapper.dart';
import 'package:flutter/material.dart';

import 'package:clutch/ui/localization/keys.dart';
import 'file:///C:/Users/denys.misiura/StudioProjects/projects/clutch_mobile/lib/ui/widget/molecula/sliver_app_bar.dart';
import 'package:flutter_translate/flutter_translate.dart';

class ScrollableCompanyAppBar extends StatefulWidget {
  final CompanyDetailsModelUi company;
  final TabController _companyTabController;

  ScrollableCompanyAppBar(this.company, this._companyTabController);

  @override
  _ScrollableCompanyAppBarState createState() => _ScrollableCompanyAppBarState();
}

class _ScrollableCompanyAppBarState extends State<ScrollableCompanyAppBar> {
  bool hideFlexibleSpace = false;

  @override
  Widget build(BuildContext context) => SliverAppBar(
    backgroundColor: widget.company.color,
    expandedHeight: hideFlexibleSpace ? 0.0 : 200.0,
    elevation: 0.0,
    pinned: true,
    leading: IconButton(
      color: blackOrWhite(),
      padding: EdgeInsets.only(left: 6.0),
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: SliverAppBarComponent(
      hiddenChild: Row(
        children: <Widget>[
          Container(
              width: 50,
              height: 50,
              child: CachedNetworkImageWrapper(widget.company.logoUrl)),
          Padding(
            padding: const EdgeInsets.only(left: 30.0),
            child: Text(widget.company.title,
                style: TextStyle(
                  color: blackOrWhite(),
                  fontSize: 20,
                )),
          ),
        ],
      ),
      expandedChild: SizedBox(),
    ),
    flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Hero(
          tag: widget.company.id,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: CachedNetworkImageWrapper(widget.company.logoUrl),
          ),
        )),
    actions: <Widget>[
      SliverAppBarComponent(
        hiddenChild: barcode(),
        expandedChild: barcode(),
      )
    ],
    bottom: TabBar(
      onTap: (tab) {
        setState(() {
          if (widget._companyTabController.index == 2)
            hideFlexibleSpace = true;
          else
            hideFlexibleSpace = false;
        });
      },
      unselectedLabelColor: blackOrWhite().withOpacity(0.56),
      labelColor: blackOrWhite(),
      isScrollable: true,
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 3.0, color: blackOrWhite()),
          insets: EdgeInsets.symmetric(horizontal: 12.0)),
      tabs: [
        Tab(text: translate(Keys.Offers)),
        Tab(text: translate(Keys.Details)),
        Tab(text: translate(Keys.Locations)),
      ],
      controller: widget._companyTabController,
    ),
  );

  Widget barcode() {
    return Image.asset("assets/images/ic_barcode.png");
  }

  Color blackOrWhite() => widget.company.color == Colors.white ? Colors.black : Colors.white;
}
