import 'package:clutch/domain/network/model/request/company_and_offers_search.dart';
import 'package:clutch/domain/network/model/response/main_info_response.dart';
import 'package:clutch/presentation/event/main_event.dart';
import 'package:clutch/presentation/state/main_state.dart';
import 'package:clutch/repository/company_repository.dart';
import 'package:clutch/repository/impl/company_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      CompanyAndOffersSearch body = CompanyAndOffersSearch();
      MainInfo companyList = await companyRepository.fetchAllCompany(body);
      yield MainLoaded(companyList.companyShortMobileDtoList,
          companyList.offersShortMobileDtoList);
    } catch (error) {
      yield MainError(error);
    }
  }
}
