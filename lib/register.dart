import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


// this is the email ***** eve.holt@reqres.in *****
// this is the password ***** 123456 ***** or you can type any password
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String responseMessage = '';
  bool isLoading = false;

  Future<void> registerUser() async {
    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() => responseMessage = 'All fields are required.');
      return;
    }

    setState(() => isLoading = true);

    final url = Uri.parse('https://reqres.in/api/register');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': 'reqres-free-v1',
        },
        body: jsonEncode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() => responseMessage = 'Success: ${data.toString()}');
      } else {
        setState(() => responseMessage = 'Error: ${response.body}');
      }
      print('Api hit successfully');
    } catch (e) {
      setState(() => responseMessage = 'Failed: $e');
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register with API Key')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading ? null : registerUser,
              child: Text(isLoading ? 'Loading...' : 'Register'),
            ),
            const SizedBox(height: 20),
            Text(responseMessage),
          ],
        ),
      ),
    );
  }
}
