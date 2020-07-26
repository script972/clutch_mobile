import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class LoadProfile extends ProfileEvent {
  LoadProfile();

  @override
  List<Object> get props => [];
}

class ChangePhoto extends ProfileEvent {
  const ChangePhoto();

  @override
  List<Object> get props => [];
}

class ChangeName extends ProfileEvent {
  final String name;

  const ChangeName(this.name);

  @override
  List<Object> get props => [name];
}

class ChangeLastName extends ProfileEvent {
  final String lastName;

  const ChangeLastName(this.lastName);

  @override
  List<Object> get props => [lastName];
}

class ChangeBirthday extends ProfileEvent {
  final int birhday;

  const ChangeBirthday(this.birhday);

  @override
  List<Object> get props => [birhday];
}

class ChangeSex extends ProfileEvent {
  final String sex;

  const ChangeSex(this.sex);

  @override
  List<Object> get props => [sex];
}

class SaveProfile extends ProfileEvent {
  @override
  List<Object> get props => [];
}
