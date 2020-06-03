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

 /* final CompanyDetailsModelUi companyDetailsModelUi;

  const CompanyDetailsLoaded(this.companyDetailsModelUi);*/

  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {
  final String error;

  const AuthError(this.error);

  @override
  List<Object> get props => [error];
}