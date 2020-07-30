import 'package:clutch/presentation/model/place_model_ui.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceMainModelUi extends PlaceModelUi {
  int companyId;

  PlaceMainModelUi(this.companyId, String name, String address, String vicinity,
      String imageUrl, LatLng position)
      : super(name, address, vicinity, imageUrl, position);
}
