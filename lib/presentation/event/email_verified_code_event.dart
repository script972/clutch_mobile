part of '../bloc/email_verified_code_bloc.dart';

abstract class EmailVerifiedCodeEvent extends Equatable {
  const EmailVerifiedCodeEvent();
}

class SendCodeFromEmailEvent extends EmailVerifiedCodeEvent {
  final String codeFromEmail;

  const SendCodeFromEmailEvent(this.codeFromEmail);

  @override
  List<Object> get props => [codeFromEmail];
}
