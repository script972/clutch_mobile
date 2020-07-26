import 'package:equatable/equatable.dart';

abstract class InviteCodeState extends Equatable {
  const InviteCodeState();
}

class InviteCodeInitial extends InviteCodeState {
  @override
  List<Object> get props => [];
}

class LoadingState extends InviteCodeState {
  @override
  List<Object> get props => [];
}

class InviteCodeBaseActionBox extends InviteCodeState {
  String route;
  String message = "";

  InviteCodeBaseActionBox({this.route, this.message = ""});

  @override
  List<Object> get props => [route, message];
}
