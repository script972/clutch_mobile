import 'package:clutch/domain/mapper/offer_mapper.dart';
import 'package:clutch/domain/mapper/point_mapper.dart';
import 'package:clutch/domain/network/model/request/company_and_offers_search.dart';
import 'package:clutch/domain/network/model/response/main_info_response.dart';
import 'package:clutch/domain/repository/company_repository.dart';
import 'package:clutch/domain/repository/impl/company_repository_impl.dart';
import 'package:clutch/helpers/geo_helper.dart';
import 'package:clutch/helpers/map_helper.dart';
import 'package:clutch/helpers/utils/date_utils.dart';
import 'package:clutch/presentation/event/main_event.dart';
import 'package:clutch/presentation/model/place_main_model_ui.dart';
import 'package:clutch/presentation/model/place_model_ui.dart';
import 'package:clutch/presentation/model/short_offer_model_ui.dart';
import 'package:clutch/presentation/state/main_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  CompanyRepository companyRepository = CompanyRepositoryImpl();

  MainBloc() {
    assert(companyRepository != null);
  }

  @override
  MainState get initialState => MainLoading();

  @override
  Stream<MainState> mapEventToState(MainEvent event) async* {
    if (event is LoadMain) {
      yield* _mapLoadMainToState(event);
    }
  }

  Stream<MainState> _mapLoadMainToState(LoadMain event) async* {
    yield MainLoading();
    try {
      Position position;
      try {
        position = await GeoHelper.detectPosition();
      } catch (e) {}
      LatLng userPosition;
      if (position != null && position.latitude != null) {
        userPosition = LatLng(position.latitude, position.longitude);
      }
      var body = CompanyAndOffersSearch();
      if(position!=null) {
        body.lat = position.latitude;
        body.lng = position.longitude;
      }
      MainInfo companyList;
      companyList = await companyRepository.fetchAllCompany(body);

      List<PlaceMainModelUi> place = companyList.pointShortMobileDtoList
          .map((e) => PointMapper.mapperMainResponseToUi(e))
          .toList();
      for (int i = 0; i < place.length; i++) {
        PlaceModelUi placeModelUi = place[i];
        Marker marker = Marker(
            position: placeModelUi.position,
            icon: (placeModelUi.imageUrl == null ||
                    placeModelUi.imageUrl.isEmpty)
                ? null
                : await MapHelper.getNetworkImageMarker(placeModelUi.imageUrl),
            markerId: MarkerId(placeModelUi.position.toString()));
        placeModelUi.marker = marker;
      }

      List<ShortOfferModelUi> shortOfferModelUi = [];
      for (int i = 0; i < companyList.offersShortMobileDtoList.length; i++) {
        String subTitle = "";
        if (companyList.offersShortMobileDtoList[i].finish != null)
          subTitle = DateUtils.timestampToString(
              companyList.offersShortMobileDtoList[i].finish) ?? "";
        StaggeredTile widthType;
        if (i % 3 == 0)
          widthType = const StaggeredTile.count(4, 2.25);
        else
          widthType = const StaggeredTile.count(2, 2.65);

        ShortOfferModelUi offer = OfferMapper.mapperShortResponseToUi(
            companyList.offersShortMobileDtoList[i]);
        offer.subTitle = subTitle;
        offer.staggeredTile = widthType;
        shortOfferModelUi.add(offer);
      }

      yield MainLoaded(companyList.companyShortMobileDtoList, shortOfferModelUi,
          companyList.categoriesDtoList, place, userPosition);
    } catch (error) {
      yield MainError(error.toString());
    }
  }
}
