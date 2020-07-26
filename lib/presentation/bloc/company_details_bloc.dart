import 'package:clutch/domain/mapper/offer_mapper.dart';
import 'package:clutch/domain/mapper/point_mapper.dart';
import 'package:clutch/helpers/color_helper.dart';
import 'package:clutch/helpers/geo_helper.dart';
import 'package:clutch/presentation/event/company_details_event.dart';
import 'package:clutch/presentation/model/company_details_model_ui.dart';
import 'package:clutch/presentation/state/company_details_state.dart';
import 'package:clutch/domain/repository/company_repository.dart';
import 'package:clutch/domain/repository/impl/company_repository_impl.dart';
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
          companyResponse.logo ?? "",
          companyResponse.barcode ?? "",
          companyResponse.title ?? "",
          companyResponse.site ?? "",
          companyResponse.phone ?? "",
          ColorHelper.colorFromHex(companyResponse.color),
          companyResponse.categoryDto,
          companyResponse.description ?? "",
          companyResponse.pointShortMobileDtoList
              .map((e) => PointMapper.mapperResponseToUi(e))
              .toList(),
          companyResponse.offersShortMobileDtoList.map((e) {
            return OfferMapper.mapperShortResponseToUi(e);
          }).toList(),
          companyResponse.anchorPropositionResponse,
          companyResponse.facebookUrl,
          companyResponse.instagramUrl);

      LatLng camera = await GeoHelper.detectPositionLatLng();

      yield CompanyDetailsLoaded(ui, camera);
    } catch (error) {
      yield CompanyDetailsError(error);
    }
  }
}
