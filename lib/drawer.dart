import 'package:flutter/material.dart';
import 'package:gemini/privacy.dart';
import 'package:gemini/terms.dart';

class CustomDrawer extends StatelessWidget {
  final VoidCallback onStartNewChat;

  // Accept a callback function in the constructor
  CustomDrawer({required this.onStartNewChat});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey.shade800,
        child: ListView(
          padding: EdgeInsets.only(top: 100.0),  // Move the text down with padding
          shrinkWrap: true,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.edit_calendar_outlined, color: Colors.white, size: 20,),
              title: Text(
                'New chat',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.pop(context);  // Close the drawer
                onStartNewChat();  // Trigger the callback function
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'Terms of Use',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermsOfUsePage()),
                );
              },
            ),
            ListTile(
              title: Text(
                'Privacy Policy',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
