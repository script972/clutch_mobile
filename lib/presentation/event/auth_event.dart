import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

@immutable
class LoadingAuth extends AuthEvent {
  const LoadingAuth();

  @override
  List<Object> get props => [];
}

@immutable
class PhoneAuth extends AuthEvent {
  final String phone;

  const PhoneAuth(this.phone);

  @override
  List<Object> get props => [];
}

@immutable
class PhoneCodeAuth extends AuthEvent {
  final String phone;
  final String code;

  const PhoneCodeAuth(this.phone, this.code);

  @override
  List<Object> get props => [];
}
