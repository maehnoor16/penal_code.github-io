import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateInformationPage extends StatefulWidget {
  final User user;
  final VoidCallback? onProfileImageUpdated; // Callback to notify profile image update

  const UpdateInformationPage({Key? key, required this.user, this.onProfileImageUpdated})
      : super(key: key);

  @override
  _UpdateInformationPageState createState() => _UpdateInformationPageState();
}

class _UpdateInformationPageState extends State<UpdateInformationPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  File? _pickedImage;

  @override
  void initState() {
    super.initState();
    _usernameController.text = widget.user.displayName ?? '';
    _emailController.text = widget.user.email ?? '';
  }

  Future<void> _updateProfile() async {
    try {
      await widget.user.updateDisplayName(_usernameController.text);
      await widget.user.updateEmail(_emailController.text);

      // Check if the password field is not empty before updating
      if (_passwordController.text.isNotEmpty) {
        await widget.user.updatePassword(_passwordController.text);
      }

      // Update the profile image if a new image is picked
      if (_pickedImage != null) {
        await widget.user.updatePhotoURL('');
        await widget.user.updatePhotoURL(_pickedImage!.path);
        widget.onProfileImageUpdated?.call(); // Notify profile image update
      }

      // Reload the user to get the updated information
      await widget.user.reload();
      User? updatedUser = widget.user;
      if (updatedUser != null) {
        setState(() {
          // Update the UI with the new user information
          _usernameController.text = updatedUser.displayName ?? '';
          _emailController.text = updatedUser.email ?? '';
        });
      }

      // Show a success message or navigate to another screen
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Profile updated successfully!'),
        ),
      );
    } catch (e) {
      print("Error updating profile: $e");
      // Handle the error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update profile. Please try again.'),
        ),
      );
    }
  }

  Future<void> _pickImage() async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _pickedImage = File(pickedImage.path);
        });
      }
    } catch (e) {
      print("Error picking profile picture: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: _pickedImage != null
                    ? FileImage(_pickedImage!)
                    : (widget.user.photoURL != null
                    ? NetworkImage(widget.user.photoURL!)
                    : AssetImage('assets/logo.png') as ImageProvider),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Update Information for ${widget.user.displayName ?? 'User'}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password (optional)'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextFormField(
              readOnly: true,
              controller: _dobController,
              onTap: () async {
                DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );

                if (selectedDate != null) {
                  setState(() {
                    _dobController.text = selectedDate.toLocal().toString().split(' ')[0];
                  });
                }
              },
              decoration: InputDecoration(
                labelText: 'Date of Birth',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _updateProfile,
              child: Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
