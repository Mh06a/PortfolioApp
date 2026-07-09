import 'package:flutter/material.dart';
import 'package:protfolio_app/features/skills/controller/skill_controller.dart';
import 'package:protfolio_app/features/skills/model/skill.dart';

class SkillsProvider extends ChangeNotifier {
  //step1 ----> here I will Create the class's variables :

  // Step2 ----> create getter
  List<Skill> get skills => _skillController.skills;
  final SkillController _skillController = SkillController();
  bool get isLoading => _skillController.isLoading;
  String? get errorMessage => _skillController.errorMessage;
  int get skillsCount => skills.length;
  bool get isEmpty => skills.isEmpty;
  String get skillsSubtitle => "${skills.length} technologies mastered";

  //step3 ----> here I will create load function :
  Future<void> loadData() async {
    await _skillController.loadSkills();
    notifyListeners();
  }

  //step4 ----> here I will create function  to Add Skill  :
  Future<bool> addSkill(Skill skill) async {
    await _skillController.addSkill(skill);

    if (_skillController.errorMessage == null) {
      await loadData();
      return true;
    }

    notifyListeners();
    return false;
  }

  //step5 ----> here I will create function  To Edit Skill :
  Future<bool> updateSkill(String oldName, Skill skill) async {
    await _skillController.updateSkill(oldName, skill);

    if (_skillController.errorMessage == null) {
      await loadData();
      return true;
    }

    notifyListeners();
    return false;
  }

  //step6 ----> here I will create function to delete Skill :
  Future<bool> deleteSkill(int id) async {
    await _skillController.deleteSkill(id);

    if (_skillController.errorMessage == null) {
      await loadData();
      return true;
    }

    notifyListeners();
    return false;
  }
}
