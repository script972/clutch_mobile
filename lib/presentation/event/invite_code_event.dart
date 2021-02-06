import 'package:equatable/equatable.dart';

abstract class InviteCodeEvent extends Equatable {
  const InviteCodeEvent();
}

class SendInviteCode extends InviteCodeEvent {
  final String inviteCode;

  const SendInviteCode(this.inviteCode);

  @override
  List<Object> get props => [inviteCode];
}
