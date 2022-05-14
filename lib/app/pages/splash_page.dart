import 'package:flutter/material.dart';

import 'package:dindin/data/user_repository.dart';

class SplashPage extends StatefulWidget {
  final UserRepository userRepository;

  const SplashPage({
    Key? key,
    required this.userRepository,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void loadUser() async {
    await Future.delayed(const Duration(seconds: 3));
    if (await widget.userRepository.hasUser()) {
      Navigator.of(context).popAndPushNamed('/home');
    } else {
      Navigator.of(context).popAndPushNamed('/login');
    }
  }

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Icon(
          Icons.flutter_dash,
          color: Colors.white,
          size: 72.0,
        ),
      ),
    );
  }
}
