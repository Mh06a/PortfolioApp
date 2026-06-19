import 'package:flutter/material.dart';
import 'package:protfolio_app/Models/user.dart';
import 'package:protfolio_app/services/user_service.dart';

class UserController extends ChangeNotifier {
  //step1 ----> here I will Create the class's variables :
  final UserService _service = UserService();
  User? _user;
  bool _isLoading = false;
  String? _errorMessage;

  //step2 ----> here I will Create a getter && setter  :
  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  //step3 ----> here I will Create a function to load User's data :
  Future<void> loadUser(int id) async {
    try {
      _isLoading = true;
      _errorMessage = null;

      notifyListeners();

      _user = await _service.getUserById(id);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
