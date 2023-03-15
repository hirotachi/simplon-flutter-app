import 'package:flutter/foundation.dart';
import 'package:simplonline/models/skill.dart';

class SkillsProvider with ChangeNotifier {
  List<Skill> _skills = [];

  List<Skill> get skills => _skills;

  void addSkill(Skill skill) {
    if (!_skills.contains(skill)) {
      _skills.add(skill);
      notifyListeners();
    }
  }
}
