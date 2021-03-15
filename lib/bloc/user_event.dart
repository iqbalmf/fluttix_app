part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadUser extends UserEvent{
  final String id;

  LoadUser(this.id);

  @override
  // TODO: implement props
  List<Object> get props => [id];
}

class SignOut extends UserEvent{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
