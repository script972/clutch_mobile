import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clutch/domain/repository/auth_repository.dart';
import 'package:clutch/domain/repository/impl/auth_repository_impl.dart';
import 'package:equatable/equatable.dart';

part '../event/email_verified_code_event.dart';

part '../state/email_verified_code_state.dart';

class EmailVerifiedCodeBloc
    extends Bloc<EmailVerifiedCodeEvent, EmailVerifiedCodeState> {
  AuthRepository authRepository = AuthRepositoryImpl();

  EmailVerifiedCodeBloc() {
    assert(authRepository != null);
  }

  @override
  EmailVerifiedCodeState get initialState => EmailVerifiedCodeInitial();

  @override
  Stream<EmailVerifiedCodeState> mapEventToState(
      EmailVerifiedCodeEvent event) async* {
    if (event is SendCodeFromEmailEvent) {
      yield* _mapSendCodeFromEmailToState(event);
    }
  }

  Stream<EmailVerifiedCodeState> _mapSendCodeFromEmailToState(
      SendCodeFromEmailEvent event) async* {
    yield EmailVerifiedCodeLoading();
    bool sucess = await authRepository.requestEmailCodeVerified(event.codeFromEmail);
    if(sucess) {

    } else {

    }
  }
}
