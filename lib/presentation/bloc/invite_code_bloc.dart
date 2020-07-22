import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clutch/core/custom_route.dart';
import 'package:clutch/domain/repository/auth_repository.dart';
import 'package:clutch/domain/repository/impl/auth_repository_impl.dart';
import 'package:clutch/presentation/event/invite_code_event.dart';
import 'package:clutch/presentation/state/invite_code_state.dart';

class InviteCodeBloc extends Bloc<InviteCodeEvent, InviteCodeState> {
  AuthRepository authRepository = AuthRepositoryImpl();

  InviteCodeBloc() : super();

  InviteCodeState get initialState => InviteCodeInitial();

  @override
  Stream<InviteCodeState> mapEventToState(
    InviteCodeEvent event,
  ) async* {
    if (event is SendInviteCode) {
      yield* _mapSendInviteCodeToState(event);
    }
  }

  Stream<InviteCodeState> _mapSendInviteCodeToState(
      SendInviteCode event) async* {
    yield LoadingState();
    bool sucessCode =
        await authRepository.requestPaidAccessByCode(event.inviteCode);

    if (sucessCode) yield NavigationPath(CustomRoute.MAIN_SCREEN);

    yield InviteCodeInitial();
  }
}
