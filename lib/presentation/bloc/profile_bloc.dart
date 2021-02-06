import 'package:clutch/domain/network/model/profile_dto.dart';
import 'package:clutch/domain/repository/auth_repository.dart';
import 'package:clutch/domain/repository/impl/auth_repository_impl.dart';
import 'package:clutch/presentation/event/profile_event.dart';
import 'package:clutch/presentation/state/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  AuthRepository authRepository = AuthRepositoryImpl();

  ProfileLoaded profileLoaded;
  ProfileLoaded profileChange = ProfileLoaded();

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
      var firstName = event.name.isEmpty ? null : event.name;
      profileChange = profileChange.copyWith(name: firstName);
      yield profileLoaded = profileLoaded.copyWith(name: firstName);
    }
    if (event is ChangeLastName) {
      var lastName = event.lastName.isEmpty ? null : event.lastName;
      profileChange = profileChange.copyWith(lastName: lastName);
      yield profileLoaded = profileLoaded.copyWith(lastName: lastName);
    }
    if (event is ChangeBirthday) {
      profileChange = profileChange.copyWith(birthday: event.birhday);
      yield profileLoaded = profileLoaded.copyWith(birthday: event.birhday);
    }
    if (event is ChangeSex) {
      profileChange = profileChange.copyWith(sex: event.sex);
      yield profileLoaded = profileLoaded.copyWith(sex: event.sex);
    }
    if (event is SaveProfile) {
      yield* _mapSaveToState(event);
    }
  }

  Stream<ProfileState> _mapLoadMainToState(LoadProfile event) async* {
    try {
      var profileDto = await authRepository.fetchProfile();

      profileLoaded = ProfileLoaded(
        photo: profileDto.facePhoto,
        photoExternal: true,
        name: profileDto.firstName,
        lastName: profileDto.lastName,
        birthday: profileDto.birthday,
        sex: profileDto.sex,
      );
      yield profileLoaded;
    } catch (error) {
      yield ProfileError(error.toString());
    }
  }

  Stream<ProfileState> _mapChangePhoto(ChangePhoto event) async* {
    final picker = ImagePicker();
    var image = await picker.getImage(source: ImageSource.gallery);
    profileLoaded =
        profileLoaded.copyWith(photo: image.path, photoExternal: false);
    profileChange =
        profileChange.copyWith(photo: image.path, photoExternal: false);
    yield profileLoaded;
  }

  Stream<ProfileState> _mapSaveToState(SaveProfile event) async* {
    var profileDto = ProfileDto(
      firstName: profileChange.name,
      lastName: profileChange.lastName,
      birthday: profileChange.birthday,
      sex: profileChange.sex,
      facePhoto: profileChange.photo,
    );
    var profileResult = await authRepository.changeProfile(profileDto);
    yield profileLoaded.copyWith(
        photo: profileResult.facePhoto,
        photoExternal: true,
        sex: profileResult.sex,
        name: profileResult.firstName,
        lastName: profileResult.lastName,
        birthday: profileResult.birthday);
  }
}
