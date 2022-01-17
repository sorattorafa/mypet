import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:petshop/models/user.dart';
import 'package:petshop/services/user.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required UserService myService,
  }) : super(const _Initial()) {
    on<LoginEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<_Started>((event, emit) async {
      try {
        emit(const _Loading());
        final user = await myService.getLoggedInUser();
        if (user != null) {
          emit(_LoggedIn(user));
        } else {
          emit(const _Initial());
        }
      } catch (e) {
        emit(_Error(e.toString()));
      }
    });

    on<_Login>((event, emit) async {
      try {
        emit(const _Loading());
        final user = await myService.logIn(
          event.credential,
          event.password,
        );
        if (user != null) {
          emit(_LoggedIn(user));
        } else {
          emit(const _Error('Service error'));
        }
      } catch (e) {
        emit(_Error(e.toString()));
      }
    });

    on<_Logout>((event, emit) async {
      try {
        emit(const _Loading());
        await myService.logOut();
        emit(const _Initial());
      } catch (e) {
        emit(_Error(e.toString()));
      }
    });
  }
}
