import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CompanyDetailsEvent extends Equatable {
  const CompanyDetailsEvent();
}

@immutable
class LoadCompanyDetails extends CompanyDetailsEvent {
  final int id;
  const LoadCompanyDetails(this.id);

  @override
  List<Object> get props => [];
}
