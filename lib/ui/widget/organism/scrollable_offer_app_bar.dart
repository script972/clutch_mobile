import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:clutch/presentation/model/offer_details_model_ui.dart';
import 'package:clutch/ui/widget/molecula/sliver_app_bar.dart';
import 'package:clutch/ui/widget/organism/barcode_custom.dart';
import 'package:flutter/material.dart';

class ScrollableOfferAppBar extends StatefulWidget {
  final OfferDetailsModelUi _offer;
  final bool hideFlexibleSpace;

  const ScrollableOfferAppBar(this._offer, this.hideFlexibleSpace);

  @override
  _ScrollableOfferAppBarState createState() => _ScrollableOfferAppBarState();
}

class _ScrollableOfferAppBarState extends State<ScrollableOfferAppBar> {
  int _currentPosition = 0;

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
                child: Text(_cutingIfNeed(widget._offer.title),
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
                              child: CachedNetworkImage(
                                imageUrl: i,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                        child: CircularProgressIndicator(
                                            value: downloadProgress.progress)),
                                errorWidget: (context, url, error) {
                                  return Icon(Icons.error);
                                },
                                useOldImageOnUrlChange: true,
                              ),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                    aspectRatio: 1.841,
                    onPageChanged: (index, reaso) {
                      setState(() {
                        _currentPosition = index;
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
                                  color: _currentPosition == index
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
            hiddenChild: BarcodeCustom('1335'),
            expandedChild: BarcodeCustom('3223'),
          )
        ],
      );

  String _cutingIfNeed(String title) {
    var cutON = 15;
    if (title.length > cutON) {
      return widget._offer.title.substring(0, 15) + '...';
    } else {
      return title;
    }
  }
}
