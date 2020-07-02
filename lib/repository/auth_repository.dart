import 'package:clutch/domain/network/model/profile_dto.dart';
import 'package:clutch/presentation/model/auth_dto.dart';

abstract class AuthRepository {

  Future<bool> initPhone(String phone);

  Future<AuthDto> confirmPhone(String phone, String code, String token);

  Future<ProfileDto> fetchProfile();

  Future<ProfileDto> changeProfile(ProfileDto profileDto);
}