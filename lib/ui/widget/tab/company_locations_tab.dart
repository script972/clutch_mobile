import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clutch_mobile/ui/model/place_model_ui.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CompanyLocationsTab extends StatefulWidget {
  @override
  _CompanyLocationsTabState createState() => _CompanyLocationsTabState();
}

class _CompanyLocationsTabState extends State<CompanyLocationsTab> {
  final Set<Marker> markers = {};
  LatLng _initialPosition;
  final Completer<GoogleMapController> _controller = Completer();

  List<PlaceModelUi> places = [
    PlaceModelUi("name", "vik", "https://www.stop-shop.com/images/module/2005.jpg",
        LatLng(46.9, 32.0)),
    PlaceModelUi("name1", "vik1", "https://www.stop-shop.com/images/module/2005.jpg",
        LatLng(46.89, 32.2)),
    PlaceModelUi("name2", "vik2", "https://www.stop-shop.com/images/module/2005.jpg",
        LatLng(46.895, 32.22)),
    PlaceModelUi("name3", "vik3", "https://www.stop-shop.com/images/module/2005.jpg",
        LatLng(46.855, 32.232)),
  ];


  @override
  void initState() {
    super.initState();
    places.forEach((item){
      markers.add(Marker(position: item.position, markerId: MarkerId(item.position.longitude.toString())));
    });
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          GoogleMap(
              mapType: MapType.normal,
              zoomControlsEnabled: false,
              rotateGesturesEnabled: false,
              onMapCreated: _controller.complete,
              markers: markers,
              initialCameraPosition: CameraPosition(
                  target: _initialPosition ?? LatLng(46.9, 32.0), zoom: 14.0),
              gestureRecognizers: Set()
                ..add(
                  Factory<OneSequenceGestureRecognizer>(
                    () => EagerGestureRecognizer(),
                  ),
                )),
          DraggableScrollableActuator(
            child: DraggableScrollableSheet(
                initialChildSize: 0.4,
                minChildSize: 0.4,
                maxChildSize: 0.95,
                builder: _bottomPanel),
          )
        ],
      );

  Widget _bottomPanel(context, ScrollController scrollController) => Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                color: Colors.grey,
              ),
            ]),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 22.0,
                    height: 4.0,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.12),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(40.0, 30.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Center(
                  child: Text(
                    'Список магазинов',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => Divider(
                        indent: 85.0,
                        color: Colors.black.withOpacity(0.35),
                      ),
                  padding: EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  itemCount: places.length,
                  itemBuilder: (_, index) {
                    var place = places[index];
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        child: ListTile(
                          leading: Container(
                            child: place.imageUrl.isNotEmpty
                                ? CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(place.imageUrl),
                                  )
                                : Container(),
                            width: 60,
                            height: 60,
                          ),
                          title: Text(place.name),
                          subtitle: Text(place.vicinity),
                          onTap: () async {
                            final controller = await _controller.future;
                            await controller.animateCamera(
                              CameraUpdate.newCameraPosition(
                                CameraPosition(
                                  target: place.position,
                                  zoom: 13.5,
                                ),
                              ),
                            );
                            DraggableScrollableActuator.reset(context);
                          },
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      );
}
