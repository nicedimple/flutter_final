import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // TextEditingControllers to manage the input fields
  TextEditingController _usernameController =
      TextEditingController(text: 'Nice Dimple Sagarino');
  TextEditingController _emailController =
      TextEditingController(text: 'nicedimplesagarino@gmail.com');

  // Function to update the profile
  void _editProfile() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Dismiss the dialog
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  // Update the profile data here
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              elevation: 8,
              child: ListTile(
                title:
                    Text(_usernameController.text), // Use the controller's text
                subtitle:
                    Text(_emailController.text), // Use the controller's text
                leading: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _editProfile, // Show the dialog to edit profile
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
