import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final String userRole; // Student, Parent, Teacher

  SettingsScreen({required this.userRole});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        children: [
          if (userRole == "Parent" || userRole == "Teacher")
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {},
            ),
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text("Dark Mode"),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Notifications"),
            trailing: Switch(value: true, onChanged: (val) {}),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text("Language"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.volume_up),
            title: Text("Volume"),
            onTap: () {},
          ),
          if (userRole == "Parent")
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text("Student Progress"),
              onTap: () {},
            ),
          if (userRole == "Teacher")
            ListTile(
              leading: Icon(Icons.class_),
              title: Text("Classroom Management"),
              onTap: () {},
            ),
          if (userRole == "Parent" || userRole == "Teacher")
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {},
            ),
        ],
      ),
    );
  }
}
