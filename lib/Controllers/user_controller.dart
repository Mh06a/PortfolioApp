import 'package:flutter/material.dart';
import 'package:protfolio_app/Models/user.dart';
import 'package:protfolio_app/services/user_service.dart';

class UserController  extends ChangeNotifier{
  //step1 ----> here I will Create the class's variables : 
  final UserService _service = UserService(); 
  User? user ; 
  bool isLoading = false ; 
  String? errorMessage; 
  
  //step2 ----> here I will Create a function to load User's data : 
  Future<void> loadUser() async{
    try {
          isLoading = true ; 
    errorMessage = null ; 
    notifyListeners();

    user = (await _service.getUserById(1)) as User? ; 
    }
    catch(e) {
      errorMessage = e.toString(); 
    } 
    finally {
      isLoading = false ; 
      notifyListeners(); 
    }
    
  }
}