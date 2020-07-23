part of '../bloc/email_verified_code_bloc.dart';

abstract class EmailVerifiedCodeState extends Equatable {
  const EmailVerifiedCodeState();
}

class EmailVerifiedCodeInitial extends EmailVerifiedCodeState {
  @override
  List<Object> get props => [];
}

class EmailVerifiedCodeLoading extends EmailVerifiedCodeState {
  @override
  List<Object> get props => [];
}
