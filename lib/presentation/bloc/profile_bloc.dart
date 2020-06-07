import 'package:clutch/domain/network/model/profile_dto.dart';
import 'package:clutch/presentation/event/profile_event.dart';
import 'package:clutch/presentation/state/profile_state.dart';
import 'package:clutch/repository/auth_repository.dart';
import 'package:clutch/repository/impl/auth_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  AuthRepository authRepository = AuthRepositoryImpl();

  ProfileBloc() {
    assert(authRepository != null);
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
      ProfileDto profileDto = await authRepository.fetchProfile();
      yield ProfileLoaded(
          profileDto.facePhoto, profileDto.firstName, profileDto.lastName);
    } catch (error) {
      yield ProfileError(error.toString());
    }
  }
}
