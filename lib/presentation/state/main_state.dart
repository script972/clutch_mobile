import 'package:clutch/domain/network/model/response/company_short_mobile.dart';
import 'package:clutch/domain/network/model/response/offers_short_mobile_dto.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class MainState extends Equatable {
  const MainState();
}

class MainLoading extends MainState {
  @override
  List<Object> get props => [];
}

class MainLoaded extends MainState {
  final List<CompanyShortMobile> company;
  final List<OffersShortMobileDto> offer;

  const MainLoaded(this.company, this.offer);

  @override
  List<Object> get props => [company];
}

class MainError extends MainState {
  final String error;

  const MainError(this.error);

  @override
  List<Object> get props => [error];
}