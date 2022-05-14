import 'package:flutter/material.dart';

import 'package:dindin/data/user_repository.dart';

class LoginPage extends StatefulWidget {
  final UserRepository userRepository;

  const LoginPage({
    Key? key,
    required this.userRepository,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool loading = false;

  void submit() async {
    try {
      if (formKey.currentState?.validate() ?? false) {
        formKey.currentState?.save();
        setState(() => loading = true);
        await widget.userRepository.login(
          email: email.trim(),
          password: password.trim(),
        );
        Navigator.of(context).popAndPushNamed('/home');
      }
    } catch (error) {
      setState(() => loading = false);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: Text(error.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  initialValue: email,
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'E-mail invalido';
                    }
                    return null;
                  },
                  onSaved: (value) => email = value ?? '',
                ),
                TextFormField(
                  initialValue: password,
                  decoration: const InputDecoration(labelText: 'Senha'),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) {
                      return 'Senha invalida';
                    }
                    return null;
                  },
                  onSaved: (value) => password = value ?? '',
                ),
                const SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: loading ? null : submit,
                  child: Text(loading ? 'Entrando' : 'Entrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
