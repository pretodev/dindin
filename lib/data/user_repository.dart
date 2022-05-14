import 'dart:convert';

import 'package:dindin/data/user_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  final _storage = const FlutterSecureStorage();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse('https://authapi.pretodev.repl.co/login');
    final response = await http.post(
      url,
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
      headers: {'content-type': 'application/json'},
    );

    if (response.statusCode > 400) {
      throw Exception('Credenciais incorretas');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    final token = json['data']['token'];
    await _storage.write(key: 'token', value: token);
  }

  Future<UserModel> getInfos() async {
    final token = await _storage.read(key: 'token');
    final url = Uri.parse('https://authapi.pretodev.repl.co/users/infos');
    final response = await http.get(
      url,
      headers: {'Authorization': token ?? ''},
    );
    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return UserModel.fromMap(json);
  }

  Future<bool> hasUser() {
    return _storage.containsKey(key: 'token');
  }

  Future<void> logout() {
    return _storage.delete(key: 'token');
  }
}
