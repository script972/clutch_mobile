import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MainEvent extends Equatable {
  const MainEvent();
}

class LoadMain extends MainEvent {

  LoadMain();

  @override
  List<Object> get props => [];
}