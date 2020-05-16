import 'package:clutch/core/custom_route.dart';
import 'package:clutch/domain/network/model/response/offers_short_mobile_dto.dart';
import 'package:clutch/ui/model/short_offer_model_ui.dart';
import 'package:clutch/ui/widget/atom/cached_network_image_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OfferItem extends StatelessWidget {
  final ShortOfferModelUi model;

  OfferItem(this.model);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, CustomRoute.DETAILS_OFFER,
              arguments: model.id);
        },
        child: Card(
          elevation: 8.0,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(model.imageUrl),
                        fit: BoxFit.cover)),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(80, 0, 0, 0),
                            Color.fromARGB(80, 0, 0, 0),
                            Colors.transparent,
                          ],
                          begin: FractionalOffset.bottomCenter,
                          end: FractionalOffset.topCenter,
                          stops: [0.0, 0.1, 0.3],
                          tileMode: TileMode.clamp),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(this.model.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold)),
                        Text(this.model.subTitle,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            )),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      );
}
