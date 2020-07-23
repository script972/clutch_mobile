import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class EmailVerificationState extends Equatable {
  const EmailVerificationState();
}

class EmailVerificationLoading extends EmailVerificationState {
  @override
  List<Object> get props => [];
}

class EmailVerificationInitial extends EmailVerificationState {
  @override
  List<Object> get props => [];
}

class EmailVerificationBaseActionBox extends EmailVerificationState {
  bool successScreen;
  String message = "";

  EmailVerificationBaseActionBox({this.successScreen, this.message});

  @override
  List<Object> get props => [successScreen, message];
}
