import 'package:flutter/material.dart';
import 'package:petshop/view/login.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.dark,
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: Colors.cyan.shade600,
        appBarTheme: AppBarTheme(
          color: Colors.lightBlue,
          iconTheme: IconThemeData(color: Colors.grey[800]),
          elevation: 1.5,
        ),
        inputDecorationTheme: const InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.all(8),
            filled: true,
            fillColor: Color(0x0A000000),
        ),
      ),
      home: const LoginScreen(title: 'Petshop'),
    );
  }
}
