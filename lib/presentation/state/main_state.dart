import 'package:clutch/domain/network/model/response/categories_response.dart';
import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/presentation/model/place_main_model_ui.dart';
import 'package:clutch/presentation/model/short_offer_model_ui.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@immutable
abstract class MainState extends Equatable {
  const MainState();
}

class MainLoading extends MainState {
  @override
  List<Object> get props => [];
}

class MainLoaded extends MainState {
  final List<CompanyShortMobile> company;
  final List<ShortOfferModelUi> offer;
  final List<CategoriesResponse> categories;
  final List<PlaceMainModelUi> places;
  final LatLng userPosition;

  const MainLoaded(this.company, this.offer, this.categories, this.places,
      this.userPosition);

  @override
  List<Object> get props => [company, offer, categories, places, userPosition];
}

class MainError extends MainState {
  final String error;

  const MainError(this.error);

  @override
  List<Object> get props => [error];
}
