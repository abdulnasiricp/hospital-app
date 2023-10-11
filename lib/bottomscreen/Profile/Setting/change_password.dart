// ignore_for_file: camel_case_types

import 'package:TezHealthCare/utils/colors.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Change_Password extends StatefulWidget {
  const Change_Password({Key? key}) : super(key: key);

  // const Change_Password({super.key});

  @override
  State<Change_Password> createState() => _Change_PasswordState();
}

class _Change_PasswordState extends State<Change_Password> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmNewPasswordController = TextEditingController();

  String _errorMessage = '';

  Future<void> _changePassword() async {
    final currentPassword = _currentPasswordController.text;
    final newPassword = _newPasswordController.text;
    final confirmNewPassword = _confirmNewPasswordController.text;

    if (newPassword != confirmNewPassword) {
      setState(() {
        _errorMessage = 'New Passwords do not match.';
      });
      return;
    }

    // Replace 'YOUR_API_ENDPOINT' with your actual API endpoint
    final apiUrl =
        Uri.parse('https://uat.tez.hospital/xzy/auth/update_password');
    final response = await http.post(
      apiUrl,
      body: {
        'current_password': currentPassword,
        'new_password': newPassword,
      },
    );

    if (response.statusCode == 200) {
      Navigator.of(context).pop(); // Close the dialog
      // You can display a success message or handle it as needed
    } else {
      setState(() {
        _errorMessage =
            'Password change failed. Please check your current password.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Change Password'),
      content: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              controller: _currentPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Current Password'),
            ),
            TextField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'New Password'),
            ),
            TextField(
              controller: _confirmNewPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Confirm New Password'),
            ),
            const SizedBox(height: 20),
            Text(
              _errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel', style: TextStyle(color: darkYellow)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: yellow, // Change the background color
          ),
          onPressed: _changePassword,
          child: const Text('Change Password'),
        ),
      ],
    );
  }
}
