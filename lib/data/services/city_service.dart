import 'dart:convert';

import 'package:cps_soft/data/model/city_model.dart';
import 'package:cps_soft/utils/api_const.dart';
import 'package:http/http.dart' as http;

class CityService {
  final String baseUrl;
  CityService({required this.baseUrl});

  final String endpoint = ApiConstants.city;

  Future<List<CityModel>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));
    print('UserService : ${response.body}');
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => CityModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load user');
    }
  }
}
