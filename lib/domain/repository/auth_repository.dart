import 'package:clutch/domain/network/model/profile_dto.dart';
import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/domain/network/model/response/company_with_paid_access.dart';
import 'package:clutch/presentation/model/auth_dto.dart';

abstract class AuthRepository {

  Future<bool> initPhone(String phone);

  Future<AuthDto> confirmPhone(String phone, String code, String token);

  Future<ProfileDto> fetchProfile();

  Future<ProfileDto> changeProfile(ProfileDto profileDto);

  Future<List<CompanyWithPaidAccess>> fetchPaidAccessDetails();

  Future<bool> requestPaidAccessByCode(String inviteCode);


}