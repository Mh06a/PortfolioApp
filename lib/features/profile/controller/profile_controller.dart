import 'package:flutter/material.dart';
import 'package:protfolio_app/core/helpers/error_handler.dart';
import 'package:protfolio_app/features/profile/model/profile.dart';
import 'package:protfolio_app/features/profile/service/profile_service.dart';

class ProfileController extends ChangeNotifier {
  //step1 ----> here I will Create the class's variables :
  final ProfileService _service = ProfileService();
  Profile? _profile;
  bool _isLoading = false;
  String? _errorMessage;

  //step2 ----> here I will Create a getter && setter  :
  Profile? get profile => _profile;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  //step3 ----> here I will Create a function to load profile  :
  Future<void> loadProfile(int id) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();
      _profile = await _service.getProfileById(id);
    } catch (e) {
      _errorMessage = ErrorHandler.getMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //step4 ----> here I will Create a function to add profile :
  Future<void> addProfile(Profile profile) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();
      _profile = await _service.addProfile(profile);
    } catch (e) {
      _errorMessage = ErrorHandler.getMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //step5 ----> here I will Create a function to update profile :
  Future<void> updateProfile(int id, Profile profile) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();
      _profile = await _service.updateProfile(id, profile);
    } catch (e) {
      _errorMessage = ErrorHandler.getMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //step6 ----> here I will Create a function to delete profile :
  Future<void> deleteProfile(int id) async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();
      await _service.deleteProfile(id);
      _profile = null;
    } catch (e) {
      _errorMessage = ErrorHandler.getMessage(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
