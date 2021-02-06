import 'package:clutch/domain/repository/impl/offer_repository_impl.dart';
import 'package:clutch/domain/repository/offer_repository.dart';
import 'package:clutch/helpers/geo_helper.dart';
import 'package:clutch/presentation/event/offer_details_event.dart';
import 'package:clutch/presentation/state/offer_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfferDetailsBloc extends Bloc<OfferDetailsEvent, OfferDetailsState> {
  OfferRepository offerRepository = OfferRepositoryImpl();

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
    var camera = await GeoHelper.detectPositionLatLng();
    try {
      yield OfferDetailsLoaded(
          await offerRepository.fetchCompanyById(event.id), camera);
    } catch (e) {
      yield OfferDetailsError(e);
    }
  }
}
