import 'package:base_response_flutter/RickyMorties/ricky_morties.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.lightBlue,
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.black),
          appBarTheme: const AppBarTheme(
            color: Colors.black,
          )),
      home: const RickyMorties(),
    );
  }
}
