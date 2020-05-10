import 'package:clutch/presentation/event/profile_event.dart';
import 'package:clutch/presentation/state/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  //CompanyRepository companyRepository = CompanyRepositoryImpl();

  MainBloc() {
    //assert(companyRepository != null);
  }

  @override
  ProfileState get initialState => ProfileLoading();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is LoadProfile) {
      yield* _mapLoadMainToState(event);
    }
  }

  Stream<ProfileState> _mapLoadMainToState(LoadProfile event) async* {
    yield ProfileLoading();
    try {
      /* CompanyAndOffersSearch body = CompanyAndOffersSearch();
      MainInfo companyList = await companyRepository.fetchAllCompany(body);
      yield MainLoaded(companyList.companyShortMobileDtoList,
          companyList.offersShortMobileDtoList);*/
    } catch (error) {
      //yield MainError(error);
    }
  }
}
