import 'package:flutter/material.dart';
import 'package:protfolio_app/features/profile/controller/profile_controller.dart';
import 'package:protfolio_app/features/profile/model/profile.dart';

class ProfileProvider extends ChangeNotifier {
  //step1 ----> here I will Create the class's variables :
  final ProfileController _profileController = ProfileController();

  // Step2 ----> create getter
  Profile? get profile => _profileController.profile;
  bool get isLoading => _profileController.isLoading;
  String? get errorMessage => _profileController.errorMessage;

  //step3 ----> here I will create load function :
  Future<void> loadData() async {
    await _profileController.loadProfile(3);
    notifyListeners();
  }

  //step4 ----> here I will create function  To Edit profile :
  Future<bool> updateProfile(Profile profile) async {
    await _profileController.updateProfile(3, profile);

    if (_profileController.errorMessage == null) {
      await loadData();
      return true;
    }

    notifyListeners();
    return false;
  }
}
