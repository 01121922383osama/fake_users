import 'dart:convert';

import 'package:bloc_app/models/users_models.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  final baseUrl = Uri.parse('https://jsonplaceholder.typicode.com/users');
  Future<List<UsersModels>> getUsers() async {
    final response = await http.get(baseUrl);
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      final users = data.map((user) {
        return UsersModels.fromJson(user);
      }).toList();
      return users;
    } else {
      throw Exception('Failed to load users');
    }
  }
}
