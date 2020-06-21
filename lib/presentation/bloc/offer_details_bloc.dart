import 'package:clutch/helpers/geo_helper.dart';
import 'package:clutch/presentation/event/offer_details_event.dart';
import 'package:clutch/presentation/state/offer_details_state.dart';
import 'package:clutch/repository/impl/offer_repository_impl.dart';
import 'package:clutch/repository/offer_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OfferDetailsBloc extends Bloc<OfferDetailsEvent, OfferDetailsState> {
  OfferRepository offerRepository = OfferRepositoryImpl();

  MainBloc() {
    // assert(companyRepository != null);
  }

  @override
  OfferDetailsState get initialState => OfferDetailsLoading();

  @override
  Stream<OfferDetailsState> mapEventToState(OfferDetailsEvent event) async* {
    if (event is LoadOfferDetails) {
      yield* _mapLoadMainToState(event);
    }
  }

  Stream<OfferDetailsState> _mapLoadMainToState(LoadOfferDetails event) async* {
    yield OfferDetailsLoading();
    LatLng camera = await GeoHelper.detectPositionLatLng();
    try {
      yield OfferDetailsLoaded(
          await offerRepository.fetchCompanyById(event.id), camera);
    } catch (e) {
      yield OfferDetailsError(e);
    }
  }
}
