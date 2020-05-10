import 'package:clutch/domain/network/model/response/offer_details_mobile_dto.dart';
import 'package:clutch/domain/network/model/response/offers_short_mobile_dto.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:clutch/ui/widget/atom/sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class ScrollableOfferAppBar extends StatefulWidget {

  final OfferDetailsMobileDto _offer;
  final TabController _offerTabController;


  ScrollableOfferAppBar(this._offer, this._offerTabController);

  @override
  _ScrollableOfferAppBarState createState() => _ScrollableOfferAppBarState();
}

class _ScrollableOfferAppBarState extends State<ScrollableOfferAppBar> {

  bool hideFlexibleSpace = false;

  @override
  Widget build(BuildContext context) =>
      SliverAppBar(
        backgroundColor: Theme
            .of(context)
            .primaryColorLight,
        expandedHeight: hideFlexibleSpace ? 0.0 : 200.0,
        elevation: 0.0,
        pinned: true,
        leading: IconButton(
          color: Colors.white,
          padding: EdgeInsets.only(left: 6.0),
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: SliverAppBarComponent(
          hiddenChild: Row(
            children: <Widget>[
              //Image.asset(widget._offer.images[0], scale: 4),
              Icon(Icons.description),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(widget._offer.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    )),
              ),
            ],
          ),
          expandedChild: SizedBox(),
        ),
        flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.pin,
            background: /*Image.asset(
                widget._offer.images[0]
            )*/Icon(Icons.description)),
        bottom: TabBar(
          onTap: (tab) {
            setState(() {
              if (widget._offerTabController.index == 1)
                hideFlexibleSpace = true;
              else
                hideFlexibleSpace = false;
            });
          },
          unselectedLabelColor: Colors.black.withOpacity(0.56),
          labelColor: Colors.black,
          isScrollable: true,
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 3.0, color: Colors.black),
              insets: EdgeInsets.symmetric(horizontal: 12.0)),
          tabs: [
            Tab(text: translate(Keys.Details)),
            Tab(text: translate(Keys.Locations)),
          ],
          controller: widget._offerTabController,
        ),
      );
}
