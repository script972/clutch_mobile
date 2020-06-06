import 'package:clutch/presentation/event/auth_event.dart';
import 'package:clutch/presentation/state/auth_state.dart';
import 'package:clutch/repository/auth_repository.dart';
import 'package:clutch/repository/impl/auth_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    String phone = "380${event.phone}";
    try {
      bool isOk = await authRepository.initPhone(phone);
      if (isOk) {
        yield AuthLoaded();
      }
    } catch (error) {
      yield AuthError(error);
    }
  }

  Stream<AuthState> _mapPhoneCodeEventToState(PhoneCodeAuth event) async* {
    yield AuthLoading();
    try {
      bool isOk = await authRepository.confirmPhone(event.phone, event.code);
      //yield
    } catch (error) {
      yield AuthError(error);
    }
  }
}
