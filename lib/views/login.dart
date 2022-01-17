import 'package:flutter/material.dart';
import 'package:petshop/theme/theme_cubit.dart';
import 'package:petshop/views/widgets/formitem.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController senhaController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
       floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.brightness_6),
            onPressed: () {
              context.read<ThemeCubit>().toggleTheme();
            },
          ),
        ],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
              constraints.maxWidth / 5, 30, constraints.maxWidth / 5, 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FormItem(
                  formFieldName: 'email',
                  controller: emailController,
                  suffix: Visibility(
                    visible: true,
                    child: IconButton(
                      icon: const Icon(Icons.cancel),
                      color: Colors.orange.shade500,
                      onPressed: () {
                        setState(() {
                          emailController = TextEditingController(text: '');
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                FormItem(
                  formFieldName: 'password',
                  controller: senhaController,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            //TODO: DO SOMETHING
                          }
                        }, //login,
                        child: const Text('Login'),
                      ),
                      const SizedBox(width: 12),
                      ElevatedButton(
                        onPressed: () async {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          currentFocus.unfocus();
                          if (_formKey.currentState!.validate()) {
                            //TODO: DO SOMETHING
                          }
                        },
                        child: const Text('Sign up'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
