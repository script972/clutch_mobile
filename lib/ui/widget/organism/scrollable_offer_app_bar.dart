import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clutch/domain/network/model/response/offer_details_mobile_dto.dart';
import 'package:clutch/ui/widget/atom/cached_network_image_wrapper.dart';
import 'package:clutch/ui/widget/atom/sliver_app_bar.dart';
import 'package:flutter/material.dart';

class ScrollableOfferAppBar extends StatefulWidget {
  final OfferDetailsMobileDto _offer;
  bool hideFlexibleSpace = false;

  ScrollableOfferAppBar(this._offer, this.hideFlexibleSpace);

  @override
  _ScrollableOfferAppBarState createState() => _ScrollableOfferAppBarState();
}

class _ScrollableOfferAppBarState extends State<ScrollableOfferAppBar> {
  @override
  Widget build(BuildContext context) => SliverAppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        expandedHeight: widget.hideFlexibleSpace ? 0.0 : 200.0,
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
            background: CarouselSlider(
              items: widget._offer.images
                  .map((i) => Builder(
                        builder: (BuildContext context) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: CachedNetworkImageWrapper(i),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(height: 220),
            )),
        actions: <Widget>[
          SliverAppBarComponent(
            hiddenChild: barcode(),
            expandedChild: barcode(),
          )
        ],
      );

  Widget barcode() {
    return Image.asset("assets/images/ic_barcode.png");
  }
}
