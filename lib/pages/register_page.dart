import 'package:flutter/material.dart';
import '../services/auth_services.dart';

class RegisterPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final userController = TextEditingController();

  RegisterPage({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: userController,
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                try {
                  await AuthService().register(
                    emailController.text.trim(),
                    passController.text.trim(),
                  );

                  Navigator.pop(context);
                } catch (e) {
                  print(e);
                }
              },
              child: Text("Create Account"),
            )
          ],
        ),
      ),
    );
  }
}
