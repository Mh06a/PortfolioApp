import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:protfolio_app/Models/profile.dart';
import 'package:protfolio_app/exceptions/not_found_exception.dart';
import 'package:protfolio_app/utils/constants.dart';

class ProfileService {
  //step1 ----> here I will Create function to get profile by id  :
  Future<Profile> getProfileById(int id) async {
    final response = await http.get(
      Uri.parse("${Constants.baseUrl}/profiles/$id"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Profile.fromJson(data);
    }

    if (response.statusCode == 404) {
      throw NotFoundException("Profile not found");
    }

    throw Exception("Failed");
  }

  //step2 ----> here I will Create a function to insert Profile :
  Future<Profile> addProfile(Profile profile) async {
    final response = await http.post(
      Uri.parse("${Constants.baseUrl}/profiles"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "fullName": profile.fullName,
        "specialization": profile.specialization,
        "bio": profile.bio,
        "yearsOfExperience": profile.yearsOfExperience,
        "email": profile.email,
        "githubLink": profile.githubLink,
        "linkedinLink": profile.linkedinLink,
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Profile.fromJson(jsonDecode(response.body));
    }

    throw Exception("Failed to add profile");
  }

  //step3 ----> here I will Create a function to update profile :
  Future<Profile> updateProfile(int id, Profile profile) async {
    final response = await http.put(
      Uri.parse("${Constants.baseUrl}/profiles/$id"),

      headers: {"Content-Type": "application/json"},

      body: jsonEncode({
        "fullName": profile.fullName,
        "specialization": profile.specialization,
        "bio": profile.bio,
        "yearsOfExperience": profile.yearsOfExperience,
        "email": profile.email,
        "githubLink": profile.githubLink,
        "linkedinLink": profile.linkedinLink,
      }),
    );

    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return Profile.fromJson(jsonDecode(response.body));
    }

    throw Exception("Failed to update profile");
  }

  //step4 ----> here I will Create a function to delete profile :
  Future<void> deleteProfile(int id) async {
    final response = await http.delete(
      Uri.parse("${Constants.baseUrl}/profiles/$id"),
    );
    if (response.statusCode == 200 || response.statusCode == 204) {
      return;
    }
    throw Exception("Failed to delete profile");
  }
}
