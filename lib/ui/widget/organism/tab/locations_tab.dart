import 'dart:async';

import 'package:clutch/presentation/model/place_model_ui.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_translate/global.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationsTab extends StatefulWidget {
  List<PlaceModelUi> places;
  LatLng camera;

  LocationsTab(this.places, this.camera);

  @override
  _LocationsTabState createState() => _LocationsTabState();
}

class _LocationsTabState extends State<LocationsTab> {
  final markers = <Marker>{};
  final Completer<GoogleMapController> _controller = Completer();
  final double MAP_ZOOM = 12.0;

  @override
  void initState() {
    super.initState();
    widget.places.forEach((element) {
      markers.add(element.marker);
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
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              markers: markers,
              initialCameraPosition: CameraPosition(
                  target: widget.camera ?? LatLng(46.9, 32.0), zoom: MAP_ZOOM),
              gestureRecognizers: Set()
                ..add(
                  Factory<OneSequenceGestureRecognizer>(
                    () => EagerGestureRecognizer(),
                  ),
                )),
          DraggableScrollableActuator(
            child: DraggableScrollableSheet(
                initialChildSize: 0.25,
                minChildSize: 0.25,
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
                    translate(Keys.List_Of_Location),
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
                  itemCount: widget.places.length,
                  itemBuilder: (_, index) {
                    var place = widget.places[index];
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
                                : Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Theme.of(context).primaryColor),
                                  ),
                            width: 60,
                            height: 60,
                          ),
                          title: Text(place.name),
                          subtitle: Text(place.address),
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
