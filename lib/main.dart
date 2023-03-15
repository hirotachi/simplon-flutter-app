import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simplonline/providers/briefs_provider.dart';
import 'package:simplonline/providers/deliverables_provider.dart';
import 'package:simplonline/providers/skills_provider.dart';
import 'package:simplonline/screens/briefs_screen.dart';
import 'package:simplonline/screens/deliverables_screen.dart';
import 'package:simplonline/screens/login_screen.dart';
import 'package:simplonline/screens/skills_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => BriefsProvider()),
      ChangeNotifierProvider(create: (context) => DeliverablesProvider()),
      ChangeNotifierProvider(create: (context) => SkillsProvider()),
    ],
    child: SimplonlineApp(),
  ));
}

class SimplonlineApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simplonline',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes: {
        '/briefs': (context) => BriefsScreen(),
        '/deliverables': (context) => DeliverablesScreen(),
        '/skills': (context) => SkillsScreen(),
      },
    );
  }
}
