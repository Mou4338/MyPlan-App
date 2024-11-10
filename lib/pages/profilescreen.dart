import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  // Sample user data
  final String userName = "John Doe";
  final String email = "john.doe@example.com";
  final String profileImageUrl = "https://via.placeholder.com/150";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Handle profile edit
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(profileImageUrl),
            ),
            SizedBox(height: 20),
            Text(
              userName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              email,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            // Profile Options
            ListTile(
              title: Text("To-Do List Settings"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to settings or another screen
              },
            ),
            ListTile(
              title: Text("Notifications"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to notification settings
              },
            ),
            ListTile(
              title: Text("Log Out"),
              trailing: Icon(Icons.logout),
              onTap: () {
                // Handle log out action
              },
            ),
          ],
        ),
      ),
    );
  }
}