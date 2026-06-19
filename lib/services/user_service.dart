import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:protfolio_app/exceptions/not_found_exception.dart';
import '../utils/constants.dart';
import 'package:protfolio_app/Models/user.dart';

class UserService {
  //step1 ----> here I will Create function to get all users :
  Future<List<User>> getAllUsers() async {
    final response = await http.get(Uri.parse("${Constants.baseUrl}/users"));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((user) => User.fromJson(user)).toList();
    }
    throw Exception("Failed");
  }

  //step2 ----> here I will Create function to get specific user :
  Future<User> getUserById(int id) async {
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}/users/id/$id"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User.fromJson(data);
    }

    if (response.statusCode == 404) {
      throw NotFoundException("User not fuond");
    }

    throw Exception("User not found");
  }
}
