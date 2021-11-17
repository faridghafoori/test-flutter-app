import 'package:flutter/material.dart';
import 'package:test_flutter/pages/home/home.dart';
import 'package:test_flutter/pages/world_time/choose_location.dart';
import 'package:test_flutter/pages/world_time/loading.dart';
import 'package:test_flutter/pages/world_time/world_time.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
          backgroundColor: Colors.black),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/loading': (context) => LoadingPage(),
        '/worldTime': (context) => WorldTimePage(),
        '/location': (context) => ChooseLocationPage()
      },
    );
  }
}
