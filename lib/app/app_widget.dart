import 'package:dindin/app/pages/home_page.dart';
import 'package:dindin/app/pages/login_page.dart';
import 'package:dindin/app/pages/splash_page.dart';
import 'package:dindin/data/user_repository.dart';
import 'package:flutter/material.dart';

final userRepository = UserRepository();

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(
              userRepository: userRepository,
            ),
        '/login': (context) => LoginPage(
              userRepository: userRepository,
            ),
        '/home': (context) => HomePage(
              userRepository: userRepository,
            ),
      },
    );
  }
}
