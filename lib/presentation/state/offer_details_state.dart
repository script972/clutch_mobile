import 'package:clutch/presentation/model/offer_details_model_ui.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class OfferDetailsState extends Equatable {
  const OfferDetailsState();
}

class OfferDetailsLoading extends OfferDetailsState {
  @override
  List<Object> get props => [];
}

class OfferDetailsLoaded extends OfferDetailsState {

  final OfferDetailsModelUi offerDetailsModelUi;

  const OfferDetailsLoaded(this.offerDetailsModelUi);

  @override
  List<Object> get props => [];
}

class OfferDetailsError extends OfferDetailsState {
  final String error;

  const OfferDetailsError(this.error);

  @override
  List<Object> get props => [error];
}
