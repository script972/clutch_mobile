import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileLoading extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoaded extends ProfileState {
  final String photo;
  final String name;
  final String lastName;
  final int birthday;


  const ProfileLoaded(this.photo, this.name, this.lastName, this.birthday);

  @override
  List<Object> get props => [photo, name, lastName];
}

class ProfileError extends ProfileState {
  final String error;

  const ProfileError(this.error);

  @override
  List<Object> get props => [error];
}