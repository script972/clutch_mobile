import 'package:equatable/equatable.dart';

abstract class InviteCodeState extends Equatable {
  const InviteCodeState();
}

class InviteCodeInitial extends InviteCodeState {
  String blocMessage;

  InviteCodeInitial({this.blocMessage = ""});
  @override
  List<Object> get props => [blocMessage];
}

class LoadingState extends InviteCodeState {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class InviteCodeBaseActionBox extends InviteCodeState {
  final String route;
  String message = '';

  InviteCodeBaseActionBox({this.route, this.message = ''});

  @override
  List<Object> get props => [route, message];
}
