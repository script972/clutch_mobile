import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class EmailVerificationEvent extends Equatable {
  const EmailVerificationEvent();
}

class SendEmailEvent extends EmailVerificationEvent {
  final String email;

  SendEmailEvent(this.email);

  @override
  List<Object> get props => [email];
}
