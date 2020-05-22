import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class OfferDetailsEvent extends Equatable {
  const OfferDetailsEvent();
}

class LoadOfferDetails extends OfferDetailsEvent {
  int id;

  LoadOfferDetails(this.id);

  @override
  List<Object> get props => [];
}
