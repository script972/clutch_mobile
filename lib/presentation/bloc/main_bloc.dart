import 'package:clutch/domain/network/model/request/company_and_offers_search.dart';
import 'package:clutch/domain/network/model/response/main_info_response.dart';
import 'package:clutch/helpers/utils/date_utils.dart';
import 'package:clutch/presentation/event/main_event.dart';
import 'package:clutch/presentation/state/main_state.dart';
import 'package:clutch/repository/company_repository.dart';
import 'package:clutch/repository/impl/company_repository_impl.dart';
import 'package:clutch/ui/model/short_offer_model_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
      var body = CompanyAndOffersSearch();
      MainInfo companyList = await companyRepository.fetchAllCompany(body);
      List<ShortOfferModelUi> shortOfferModelUi = [];
      for (int i = 0; i < companyList.offersShortMobileDtoList.length; i++) {
        String subTitle = "";
        if (companyList.offersShortMobileDtoList[i].finish != null)
          subTitle = DateUtils.timestampToString(
              companyList.offersShortMobileDtoList[i].finish);
        var widthType;
        if (i % 3 == 0)
          widthType = const StaggeredTile.count(4, 2.25);
        else
          widthType = const StaggeredTile.count(2, 2.65);
        shortOfferModelUi.add(ShortOfferModelUi(
            companyList.offersShortMobileDtoList[i].id,
            companyList.offersShortMobileDtoList[i].image,
            companyList.offersShortMobileDtoList[i].title,
            subTitle,
            widthType));
      }
      yield MainLoaded(
          companyList.companyShortMobileDtoList, shortOfferModelUi);
    } catch (error) {
      yield MainError(error);
    }
  }
}
