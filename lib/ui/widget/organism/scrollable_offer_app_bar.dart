import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clutch/domain/network/model/response/offer_details_mobile_dto.dart';
import 'package:clutch/ui/widget/atom/cached_network_image_wrapper.dart';
import 'package:clutch/ui/widget/atom/sliver_app_bar.dart';
import 'package:clutch/ui/widget/organism/barcode_dialog.dart';
import 'package:flutter/material.dart';

class ScrollableOfferAppBar extends StatefulWidget {
  final OfferDetailsMobileDto _offer;
  bool hideFlexibleSpace = false;
  int _currentPosition = 0;

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
            background: Stack(
              children: <Widget>[
                CarouselSlider(
                  items: widget._offer.images
                      .map((i) => Builder(
                            builder: (BuildContext context) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: CachedNetworkImageWrapper(i),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    //height: 220,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reaso) {
                      setState(() {
                        widget._currentPosition = index;
                      });
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget._offer.images
                        .asMap()
                        .map((index, value) => MapEntry(
                            index,
                            Container(
                              width: 8.0,
                              height: 8.0,
                              margin: EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: widget._currentPosition == index
                                      ? Color.fromRGBO(1, 1, 1, 1)
                                      : Color.fromRGBO(1, 1, 1, 0.4)),
                            )))
                        .values
                        .toList(),
                  ),
                ),
              ],
            )),
        actions: <Widget>[
          SliverAppBarComponent(
            hiddenChild: barcode(),
            expandedChild: barcode(),
          )
        ],
      );

//BarcodeDialog
  Widget barcode() => GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => BarcodeDialog("312312"),
        );
      },
      child: Image.asset("assets/images/ic_barcode.png"));
}
