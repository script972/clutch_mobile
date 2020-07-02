import 'package:clutch/presentation/model/company_details_model_ui.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@immutable
abstract class CompanyDetailsState extends Equatable {
  const CompanyDetailsState();
}

class CompanyDetailsLoading extends CompanyDetailsState {
  @override
  List<Object> get props => [];
}

class CompanyDetailsLoaded extends CompanyDetailsState {

  final CompanyDetailsModelUi companyDetailsModelUi;
  final LatLng camera;

  const CompanyDetailsLoaded(this.companyDetailsModelUi, this.camera);

  @override
  List<Object> get props => [companyDetailsModelUi, camera];
}

class CompanyDetailsError extends CompanyDetailsState {
  final String error;

  const CompanyDetailsError(this.error);

  @override
  List<Object> get props => [error];
}
