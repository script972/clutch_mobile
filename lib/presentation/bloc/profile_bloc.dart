import 'package:clutch/domain/network/model/profile_dto.dart';
import 'package:clutch/domain/network/model/sex_dto.dart';
import 'package:clutch/presentation/event/profile_event.dart';
import 'package:clutch/presentation/state/profile_state.dart';
import 'package:clutch/repository/auth_repository.dart';
import 'package:clutch/repository/impl/auth_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  AuthRepository authRepository = AuthRepositoryImpl();

  ProfileLoaded profileLoaded;
  ProfileLoaded profileChange;

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
    if (event is ChangePhoto) {
      yield* _mapChangePhoto(event);
    }
    if (event is ChangeName) {
      profileChange = profileChange.copyWith(name: event.name);
    }
    if (event is ChangeLastName) {
      profileChange = profileChange.copyWith(lastName: event.lastName);
    }
    if (event is SaveProfile) {
      yield* _mapSaveToState(event);
    }
  }

  Stream<ProfileState> _mapLoadMainToState(LoadProfile event) async* {
    try {
      ProfileDto profileDto = await authRepository.fetchProfile();
      bool sexMale = false;
      bool sexFemale = false;
      if (profileDto.sex == Sex.MALE) {
        sexMale = true;
        sexFemale = false;
      } else if (profileDto.sex == Sex.FEMALE) {
        sexMale = false;
        sexFemale = true;
      }
      profileLoaded = ProfileLoaded(
          photo: profileDto.facePhoto,
          photoExternal: true,
          name: profileDto.firstName,
          lastName: profileDto.lastName,
          birthday: /*profileDto.birthday*/ 1,
          sexMale: sexMale,
          sexFemale: sexFemale);
      profileChange = profileLoaded.copyWith();
      yield profileChange;
    } catch (error) {
      yield ProfileError(error.toString());
    }
  }

  Stream<ProfileState> _mapChangePhoto(ChangePhoto event) async* {
    final picker = ImagePicker();
    var image = await picker.getImage(source: ImageSource.gallery);
    /* profileLoaded.photo = image.path;
    profileLoaded.photoExternal = false;*/
    profileChange =
        profileChange.copyWith(photo: image.path, photoExternal: false);
    yield profileChange;
  }

  Stream<ProfileState> _mapSaveToState(SaveProfile event) async* {
    ProfileDto profileDto = ProfileDto(
      firstName: profileChange.name,
      lastName: profileChange.lastName,
    );
    ProfileDto profileResult = await authRepository.changeProfile(profileDto);
    yield profileChange.copyWith(
      photo: profileResult.facePhoto,
      photoExternal: true,
    );
  }
}
