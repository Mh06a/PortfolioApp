import 'package:flutter/material.dart';
import 'package:protfolio_app/features/profile/controller/profile_controller.dart';
import 'package:protfolio_app/features/profile/model/profile.dart';
import 'package:protfolio_app/features/projects/controller/project_controller.dart';
import 'package:protfolio_app/features/projects/model/project.dart';
import 'package:protfolio_app/features/skills/controller/skill_controller.dart';
import 'package:protfolio_app/features/skills/model/skill.dart';

class HomeProvider extends ChangeNotifier {
  //step1 ----> create Class variables :
  final ProfileController _profileController = ProfileController();
  final SkillController _skillController = SkillController();
  final ProjectController _projectController = ProjectController();

  // State
  bool get isLoading =>
      _profileController.isLoading ||
      _skillController.isLoading ||
      _projectController.isLoading;

  String? get errorMessage =>
      _profileController.errorMessage ??
      _skillController.errorMessage ??
      _projectController.errorMessage;

  // Models
  Profile? get profile => _profileController.profile;
  List<Skill> get skills => _skillController.skills;
  List<Project> get projects => _projectController.projects;

  // UI Data
  String get yearsExperience => (profile?.yearsOfExperience ?? 0).toString();
  String get projectsCount => projects.length.toString();
  String get skillsCount => skills.length.toString();

  //step2 ----> here I will Create a function to laod data :
  Future<void> loadData() async {
    await Future.wait([
      _profileController.loadProfile(3),
      _skillController.loadSkills(),
      _projectController.loadProjects(),
    ]);

    notifyListeners();
  }
}
