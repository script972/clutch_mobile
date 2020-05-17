import 'package:clutch/domain/network/model/response/point_short_dto.dart';
import 'package:clutch/presentation/model/place_model_ui.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PointMapper {
  static PlaceModelUi mapperResponseToModel(PointShortDto pointShortDto) {
    return PlaceModelUi(
        pointShortDto.title,
        pointShortDto.address,
        pointShortDto.distance.toString(),
        pointShortDto.image,
        LatLng(pointShortDto.lat, pointShortDto.lng));
  }
}