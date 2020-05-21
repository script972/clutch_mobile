import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CompanyDetailsEvent extends Equatable {
  const CompanyDetailsEvent();
}

class LoadCompanyDetails extends CompanyDetailsEvent {

  int id;
  LoadCompanyDetails(this.id);

  @override
  List<Object> get props => [];
}