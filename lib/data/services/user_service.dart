import 'dart:convert';

import 'package:cps_soft/data/model/user_model.dart';
import 'package:cps_soft/utils/api_const.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String baseUrl;
  UserService({required this.baseUrl});

  final String endpoint = ApiConstants.users;

  Future<List<UserModel>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));
    print('UserService : ${response.body}');
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => UserModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load user');
    }
  }
}
