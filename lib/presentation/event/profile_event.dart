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

class SaveProfile extends ProfileEvent {
  @override
  List<Object> get props => [];
}