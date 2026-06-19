import 'package:flutter/material.dart';
import 'package:protfolio_app/Models/skill.dart';
import 'package:protfolio_app/services/skill_service.dart';

class SkillController extends ChangeNotifier {
  //step1 ----> here I will Create the class's variables :
  final SkillService _service = SkillService();
  List<Skill> _skills = [];
  bool _isLoading = false;
  String? _errorMessage;

  //step2 ----> here I will Create a getter && setter  :
  List<Skill> get skills => _skills;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  //step3 ----> here I will Create a function to load skills <get all skills> :
  Future<void> loadSkills() async {
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      _skills = await _service.getAllSkills();
    } catch (exception) {
      _errorMessage = exception.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //step4 ----> here I will Create a function to add skill :
  Future<void> addSkill(Skill skill) async {
    try {
      _isLoading = true;
      _errorMessage = null;

      notifyListeners();

      final newSkill = await _service.addSkill(skill);
      _skills.add(newSkill);
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //step5 ----> here I will Create a function to update skill :
  Future<void> updateSkill(String name, Skill skill) async {
    try {
      _isLoading = true;
      _errorMessage = null;

      notifyListeners();

      final updatedSkill = await _service.updateSkill(name, skill);
      final index = _skills.indexWhere((s) => s.name == name);

      if (index != -1) {
        _skills[index] = updatedSkill;
      }
    } catch (exception) {
      _errorMessage = exception.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  //step6 ----> here I will Create a function to delete skill :
  Future<void> deleteSkill(int id) async {
    try {
      _isLoading = true;
      _errorMessage = null;

      notifyListeners();

      await _service.deleteSkill(id);

      _skills.removeWhere((skill) => skill.id == id);
    } catch (exception) {
      _errorMessage = exception.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
