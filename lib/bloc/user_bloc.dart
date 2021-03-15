import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttix_app/models/models.dart';
import 'package:fluttix_app/services/services.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      Users user = await UserServices.getUser(event.id);
      yield UserLoaded(user);
    } else if (event is SignOut) {
      yield UserInitial();
    }
  }

  @override
  // TODO: implement initialState
  UserState get initialState => UserInitial();
}
