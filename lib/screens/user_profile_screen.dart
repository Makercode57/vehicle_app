import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import your login page file

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final TextEditingController nameController = TextEditingController(text: "John Doe");
  final TextEditingController emailController = TextEditingController(text: "johndoe@example.com");
  final TextEditingController phoneController = TextEditingController(text: "+1 234 567 890");
  final TextEditingController locationController = TextEditingController(text: "New York, USA");

  bool isEditing = false;

  void saveProfile() {
    setState(() {
      isEditing = false;
    });
  }

  void logout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Logged Out"),
        content: Text("You have been logged out successfully."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Profile"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: logout,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_pic.png'),
            ),
            SizedBox(height: 20),
            isEditing
                ? TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: "Name"),
                  )
                : Text(nameController.text, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            isEditing
                ? TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: "Email"),
                  )
                : Text(emailController.text, style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 10),
            isEditing
                ? TextField(
                    controller: phoneController,
                    decoration: InputDecoration(labelText: "Phone Number"),
                  )
                : Text(phoneController.text, style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 10),
            isEditing
                ? TextField(
                    controller: locationController,
                    decoration: InputDecoration(labelText: "Location"),
                  )
                : Text(locationController.text, style: TextStyle(fontSize: 16, color: Colors.grey)),
            SizedBox(height: 30),
            isEditing
                ? ElevatedButton(
                    onPressed: saveProfile,
                    child: Text("Save Profile"),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                  )
                : ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isEditing = true;
                      });
                    },
                    child: Text("Edit Profile"),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}