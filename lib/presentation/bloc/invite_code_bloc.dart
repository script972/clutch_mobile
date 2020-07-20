import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clutch/presentation/event/invite_code_event.dart';
import 'package:clutch/presentation/state/invite_code_state.dart';


class InviteCodeBloc extends Bloc<InviteCodeEvent, InviteCodeState> {

  InviteCodeBloc() : super();

  InviteCodeState get initialState => InviteCodeInitial();


  @override
  Stream<InviteCodeState> mapEventToState(InviteCodeEvent event,) async* {
    if (event is LoadMain) {
      yield* _mapLoadMainToState(event);
    }
  }

}
