import 'dart:convert';

import 'package:http/http.dart' as http;

import '../utils/constants.dart';
import '../models/user.dart';

class UserService {
  //step1 ----> here I will Create function to get all user :
  Future<List<User>> getAllUsers() async {
    final response = await http.get(Uri.parse("${Constants.baseUrl}/users"));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((user) => User.fromJson(user)).toList();
    }
    throw Exception("Failed");
  }
}
