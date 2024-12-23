import 'package:book_store/controller/login_controller.dart';
import 'package:book_store/controller/user_controller.dart';
import 'package:book_store/view/signUp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final UserController userController = Get.put(UserController());

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LOGIN"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                  labelText: "Username", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: "Password", border: OutlineInputBorder()),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => loginController.login(
                  usernameController.text, passwordController.text),
              child: Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => SignUpPage());
              },
              child: Text("Sign Up"),
            )
          ],
        ),
      ),
    );
  }
}
