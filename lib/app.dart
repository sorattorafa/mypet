import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petshop/bloc/login/login_bloc.dart';
import 'package:petshop/providers/theme/theme_cubit.dart';
import 'package:petshop/services/user.dart';
import 'package:petshop/views/login.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MultiProvider(
        providers: [
          BlocProvider(
            create: (_) => ThemeCubit(),
          ),
          BlocProvider(
            create: (_) => LoginBloc(myService: UserService())
              ..add(const LoginEvent.started()),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeData>(builder: (_, theme) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: theme,
            home: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
              return state.when(
                initial: () => const LoginScreen(title: 'PetShop'),
                loading: () => const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                loggedIn: (user) => const Home(),
                error: (e) => Scaffold(
                  body: Center(
                    child: Text(e.toString()),
                  ),
                ),
              );
            }),
          );
        }),
      );
    });
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Seja bem vindo!'),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.exit_to_app),
          onPressed: () {
            return context
                .read<LoginBloc>()
                .add(const LoginEvent.logout());
          }),
    );
  }
}
