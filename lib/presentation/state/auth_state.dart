import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoaded extends AuthState {
  final String phone;
  final String error;

  const AuthLoaded(this.phone, this.error);

  @override
  List<Object> get props => [phone];
}

class PhoneAndCodeValid extends AuthState {
  @override
  List<Object> get props => [];
}

class PhoneAndCodeInvalid extends AuthState {
  final String error;

  const PhoneAndCodeInvalid(this.error);

  @override
  List<Object> get props => [error];
}

class AuthError extends AuthState {
  final String error;

  const AuthError(this.error);

  @override
  List<Object> get props => [error];
}
