
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

class NavigationPath extends InviteCodeState {
  String route;


  NavigationPath(this.route);

  @override
  List<Object> get props => [route];


}
