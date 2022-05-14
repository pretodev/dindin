import 'package:flutter/material.dart';

import 'package:dindin/data/user_repository.dart';

class HomePage extends StatefulWidget {
  final UserRepository userRepository;

  const HomePage({
    Key? key,
    required this.userRepository,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? name;
  int? ballance;
  bool loading = false;

  void logout() async {
    try {
      await widget.userRepository.logout();
      Navigator.of(context).popAndPushNamed('/login');
    } catch (error) {
      print('$error');
    }
  }

  void loadInfos() async {
    setState(() => loading = true);
    final user = await widget.userRepository.getInfos();
    setState(() {
      loading = false;
      name = user.name;
      ballance = user.ballance;
    });
  }

  @override
  void initState() {
    super.initState();
    loadInfos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: logout,
          )
        ],
      ),
      body: Column(children: [
        if (loading) const CircularProgressIndicator(),
        if (name != null) Text(name!),
        if (ballance != null) Text('${ballance!}'),
      ]),
    );
  }
}
