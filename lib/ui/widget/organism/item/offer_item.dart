import 'package:cached_network_image/cached_network_image.dart';
import 'package:clutch/core/custom_route.dart';
import 'package:clutch/presentation/bloc/offer_details_bloc.dart';
import 'package:clutch/presentation/event/offer_details_event.dart';
import 'package:clutch/presentation/model/short_offer_model_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfferItem extends StatelessWidget {
  final ShortOfferModelUi model;

  OfferItem(this.model);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, CustomRoute.DETAILS_OFFER);
          BlocProvider.of<OfferDetailsBloc>(context)
              .add(LoadOfferDetails(model.id));
        },
        child: Card(
          elevation: 8.0,
          child: Stack(
            children: <Widget>[
              model.imageUrl != null
                  ? CachedNetworkImage(
                      imageUrl: model.imageUrl,
                      imageBuilder: (context, imageProvider) => Container(
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
                    )
                  : SizedBox(),
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
                        tileMode: TileMode.clamp,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(model.title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold)),
                        Text(model.subTitle,
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
