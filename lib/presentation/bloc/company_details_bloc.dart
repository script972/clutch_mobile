import 'package:clutch/domain/mapper/offer_mapper.dart';
import 'package:clutch/domain/mapper/point_mapper.dart';
import 'package:clutch/domain/network/model/response/categories_response.dart';
import 'package:clutch/helpers/color_helper.dart';
import 'package:clutch/presentation/event/company_details_event.dart';
import 'package:clutch/presentation/model/company_details_model_ui.dart';
import 'package:clutch/presentation/model/place_model_ui.dart';
import 'package:clutch/presentation/state/company_details_state.dart';
import 'package:clutch/repository/company_repository.dart';
import 'package:clutch/repository/impl/company_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CompanyDetailsBloc
    extends Bloc<CompanyDetailsEvent, CompanyDetailsState> {
  CompanyRepository companyRepository = CompanyRepositoryImpl();

  CompanyDetailsBloc() {
    assert(companyRepository != null);
  }

  @override
  CompanyDetailsState get initialState => CompanyDetailsLoading();

  @override
  Stream<CompanyDetailsState> mapEventToState(
      CompanyDetailsEvent event) async* {
    if (event is LoadCompanyDetails) {
      yield* _mapLoadMainToState(event);
    }
  }

  Stream<CompanyDetailsState> _mapLoadMainToState(
      LoadCompanyDetails event) async* {
    yield CompanyDetailsLoading();
    try {
      var companyResponse =
          await companyRepository.fetchCompanyDetails(event.id);
      var ui = CompanyDetailsModelUi(
          companyResponse.id,
          companyResponse.logo,
          companyResponse.barcode,
          companyResponse.title,
          ColorHelper.colorFromHex(companyResponse.color),
          CategoriesResponse(title: ">>"),
          companyResponse.description,
          companyResponse.pointShortMobileDtoList.map((e) {
            var marker = Marker(
                position: LatLng(e.lat, e.lng),
                markerId: MarkerId(e.id.toString()));
            PlaceModelUi place = PointMapper.mapperResponseToUi(e);
            place.marker = marker;
            return place;
          }).toList(),
          companyResponse.offersShortMobileDtoList.map((e) {
            return OfferMapper.mapperShortResponseToUi(e);
          }).toList());

      yield CompanyDetailsLoaded(ui);
    } catch (error) {
      yield CompanyDetailsError(error);
    }
  }
}
