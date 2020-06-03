import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoadingAuth extends AuthEvent {
  LoadingAuth();

  @override
  List<Object> get props => [];
}

class PhoneAuth extends AuthEvent {
  String phone;

  PhoneAuth(this.phone);

  @override
  List<Object> get props => [];
}

class PhoneCodeAuth extends AuthEvent {
  String phone;
  String code;

  PhoneCodeAuth(this.phone, this.code);

  @override
  List<Object> get props => [];
}
