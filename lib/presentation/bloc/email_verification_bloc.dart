import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clutch/domain/model/exception/http_exceptions.dart';
import 'package:clutch/domain/repository/auth_repository.dart';
import 'package:clutch/domain/repository/impl/auth_repository_impl.dart';
import 'package:clutch/presentation/event/email_verification_event.dart';
import 'package:clutch/presentation/state/email_verification_state.dart';

class EmailVerificationBloc
    extends Bloc<EmailVerificationEvent, EmailVerificationState> {
  AuthRepository authRepository = AuthRepositoryImpl();

  EmailVerificationBloc() {
    assert(authRepository != null);
  }

  @override
  get initialState => EmailVerificationInitial();

  @override
  Stream<EmailVerificationState> mapEventToState(
      EmailVerificationEvent event) async* {
    if (event is SendEmailEvent) {
      yield* _mapSendEmailEventToState(event);
    }
  }

  Stream<EmailVerificationState> _mapSendEmailEventToState(
      SendEmailEvent event) async* {
    yield EmailVerificationLoading();
    try {
      bool result = await authRepository.requestEmail(event.email);
      if (result) {
        yield EmailVerificationBaseActionBox(successScreen: true);
      }
    } on HttpExceptions catch (e) {
      yield EmailVerificationBaseActionBox(message: e.value);
    } catch(e){

    }
    yield EmailVerificationInitial();
  }
}
