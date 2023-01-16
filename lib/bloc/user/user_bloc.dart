import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:polidrome/model/user_model.dart';
import 'package:polidrome/services/user_service.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      if (event is UserGet) {
        try {
          emit(UserLoading());

          final users = await UserService().getUsers();

          emit(UserSuccess(users));
        } catch (e) {
          emit(UserFailed(e.toString()));
        }
      }
    });
  }
}
