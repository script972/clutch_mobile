import 'package:clutch/helpers/security_manager.dart';
import 'package:clutch/presentation/event/auth_event.dart';
import 'package:clutch/presentation/model/auth_dto.dart';
import 'package:clutch/presentation/state/auth_state.dart';
import 'package:clutch/repository/auth_repository.dart';
import 'package:clutch/repository/impl/auth_repository_impl.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_translate/global.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository = AuthRepositoryImpl();

  CompanyDetailsBloc() {
    assert(authRepository != null);
  }

  @override
  AuthState get initialState => AuthLoading();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is PhoneAuth) {
      yield* _mapPhoneEventToState(event);
    }
    if (event is PhoneCodeAuth) {
      yield* _mapPhoneCodeEventToState(event);
    }
  }

  Stream<AuthState> _mapPhoneEventToState(PhoneAuth event) async* {
    yield AuthLoading();
    String phone = "+380${event.phone}";
    try {
      bool isOk = await authRepository.initPhone(phone);
      if (isOk) {
        yield AuthLoaded(phone, "");
      } else {}
    } catch (error) {
      yield AuthError(error.toString());
    }
  }

  Stream<AuthState> _mapPhoneCodeEventToState(PhoneCodeAuth event) async* {
    yield AuthLoading();
    try {
      AuthDto authDto =
          await authRepository.confirmPhone(event.phone, event.code);
      yield SecurityManager.proccessNewSecuriryToken(authDto)
          ? PhoneAndCodeValid()
          : AuthLoaded(event.phone, translate(Keys.Phone_Code_Invalid));
    } catch (error) {
      yield AuthLoaded(event.phone, translate(Keys.Phone_Code_Invalid));
      //yield PhoneAndCodeInvalid(error.toString());
    }
  }
}
