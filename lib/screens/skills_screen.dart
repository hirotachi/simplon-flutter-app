import 'package:flutter/material.dart';
import 'package:simplonline/models/skill.dart';
import 'package:simplonline/widgets/skill_card.dart';

class SkillsScreen extends StatefulWidget {
  @override
  _SkillsScreenState createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  List<Skill> _skills = []; // Placeholder data, replace with actual data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skills'),
      ),
      body: ListView.builder(
        itemCount: _skills.length,
        itemBuilder: (context, index) {
          return SkillCard(skill: _skills[index]);
        },
      ),
    );
  }
}
