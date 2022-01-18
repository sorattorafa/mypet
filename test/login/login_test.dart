import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:petshop/bloc/login/login_bloc.dart';

import 'mocked_service.dart';

void main() {
  mainBloc();
}

void mainBloc() {
  group('Started event test \n', () {
    blocTest<LoginBloc, LoginState>(
      'should emits loading and logged in state when exist logged in user \n',
      build: () => LoginBloc(myService: MockedService()),
      act: (bloc) {
        bloc.add(const LoginEvent.started());
      },
      expect: () => const [
        LoginState.loading(),
        LoginState.loggedIn(MockedService.user),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should emits loading and logged in state when exist logged in user \n',
      build: () => LoginBloc(myService: MockedServiceWithouLoggedUser()),
      act: (bloc) {
        bloc.add(const LoginEvent.started());
      },
      expect: () => const [
        LoginState.loading(),
        LoginState.initial(),
      ],
    );
  });

  group('Login event test \n', () {
    blocTest<LoginBloc, LoginState>(
      'should emits loading and logged in state when exist logged in user \n',
      build: () => LoginBloc(myService: MockedService()),
      act: (bloc) {
        bloc.add(LoginEvent.login(
            MockedService.user.credential, MockedService.user.password));
      },
      expect: () => const [
        LoginState.loading(),
        LoginState.loggedIn(MockedService.user),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should emits loading and logged in state when exist logged in user \n',
      build: () => LoginBloc(myService: MockedServiceWithouLoggedUser()),
      act: (bloc) {
          bloc.add(LoginEvent.login(
            MockedService.user.credential, MockedService.user.password));
      },
      expect: () => const [
        LoginState.loading(),
        LoginState.loggedIn(MockedService.user),
      ],
    );
  });

  group('Logout event test \n', () {
    blocTest<LoginBloc, LoginState>(
      'should emits loading and logged in state when exist logged in user \n',
      build: () => LoginBloc(myService: MockedService()),
      act: (bloc) {
        bloc.add(const LoginEvent.logout());
      },
      expect: () => const [
        LoginState.loading(),
        LoginState.initial(),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'should emits loading and logged in state when exist logged in user \n',
      build: () => LoginBloc(myService: MockedServiceWithouLoggedUser()),
      act: (bloc) {
          bloc.add(const LoginEvent.logout());
      },
      expect: () => const [
        LoginState.loading(),
        LoginState.initial(),
      ],
    );
  });
}
