import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:polidrome/model/user_model.dart';

class UserService {
  final String baseUrl = 'https://reqres.in/api/users?page=2';

  Future<List<UserModel>> getUsers() async {
    try {
      final res = await http.get(
        Uri.parse('$baseUrl'),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      print(res.body);

      if (res.statusCode == 200) {
        List<UserModel> users = List<UserModel>.from(
          jsonDecode(res.body)['data'].map(
            (user) => UserModel.fromJson(user),
          ),
        ).toList();

        return users;
      }

      return throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
