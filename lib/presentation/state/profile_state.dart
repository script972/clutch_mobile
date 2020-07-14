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
  final bool photoExternal;

  final String name;
  final String lastName;
  final int birthday;
  final String sex;

  const ProfileLoaded(
      {this.photo,
      this.photoExternal,
      this.name,
      this.lastName,
      this.birthday,
      this.sex});

  ProfileLoaded copyWith(
      {String photo,
      bool photoExternal,
      String name,
      String lastName,
      String sex,
      int birthday}) {
    return ProfileLoaded(
        photo: photo ?? this.photo,
        photoExternal: photoExternal ?? this.photoExternal,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        sex: sex ?? this.sex,
        birthday: birthday ?? this.birthday);
  }

  @override
  List<Object> get props => [photo, name, lastName];
}

class ProfileError extends ProfileState {
  final String error;

  const ProfileError(this.error);

  @override
  List<Object> get props => [error];
}
