import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModelUi {
  final String name;
  final String vicinity;
  final Color vicinityColor;
  final String imageUrl;
  final LatLng position;

  PlaceModelUi(this.name, this.vicinity, this.imageUrl, this.position, {this.vicinityColor = Colors.green});
}