import 'package:clutch/core/custom_route.dart';
import 'package:clutch/domain/repository/auth_repository.dart';
import 'package:clutch/domain/repository/impl/auth_repository_impl.dart';
import 'package:clutch/helpers/security_manager.dart';
import 'package:clutch/presentation/event/auth_event.dart';
import 'package:clutch/presentation/model/auth_dto.dart';
import 'package:clutch/presentation/state/auth_state.dart';
import 'package:clutch/ui/localization/keys.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
      final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
      String token = await _firebaseMessaging.getToken();
      AuthDto authDto =
          await authRepository.confirmPhone(event.phone, event.code, token);
      if (SecurityManager.proccessNewSecuriryToken(authDto)) {
        bool paidAcces = await SecurityManager.checkPaidAccess();
        yield paidAcces
            ? PhoneAndCodeValidNextScreen(CustomRoute.MAIN_SCREEN)
            : PhoneAndCodeValidNextScreen(CustomRoute.INVITE_CODE_SCREEN);
      } else {
        yield AuthLoaded(event.phone, translate(Keys.Phone_Code_Invalid));
      }
    } catch (error) {
      yield AuthLoaded(event.phone, translate(Keys.Phone_Code_Invalid));
    }
  }
}
