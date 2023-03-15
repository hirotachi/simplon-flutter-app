import 'package:flutter/material.dart';
import 'package:simplonline/models/skill.dart';

class SkillCard extends StatelessWidget {
  final Skill skill;

  SkillCard({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(skill.name),
        onTap: () {
          // Navigate to skill details screen
        },
      ),
    );
  }
}
