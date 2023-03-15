import 'package:flutter/material.dart';
import 'package:simplonline/models/brief.dart';
import 'package:simplonline/models/role.dart';
import 'package:simplonline/screens/briefs_screen.dart';
import 'package:simplonline/screens/deliverables_screen.dart';
import 'package:simplonline/screens/forms/brief_form_screen.dart';
import 'package:simplonline/screens/login_screen.dart';
import 'package:simplonline/screens/skills_screen.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;
  List<Brief> _briefs = [];
  final List<Widget> _screens = [
    BriefsScreen(),
    DeliverablesScreen(),
    SkillsScreen(),
    LoginScreen(),
  ];

  Role _role = Role.teacher;

  void _addBrief(Brief brief) {
    setState(() {
      _briefs.add(brief);
    });
  }

  Widget? _buildFAB() {
    if (_role == Role.teacher && _selectedIndex == 0) {
      return FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BriefFormScreen(
                      title: "Create Brief",
                    )),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      );
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      floatingActionButton: _buildFAB(),
      bottomNavigationBar: SlidingClippedNavBar(
        inactiveColor: Colors.grey,
        barItems: [
          BarItem(icon: Icons.assignment, title: 'Briefs'),
          BarItem(icon: Icons.file_upload, title: 'Deliverables'),
          BarItem(icon: Icons.stars, title: 'Skills'),
          BarItem(icon: Icons.logout, title: 'Logout'),
        ],
        onButtonPressed: (index) {
          if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
            return;
          }
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedIndex: _selectedIndex,
        activeColor: Colors.blue,
      ),
    );
  }
}
