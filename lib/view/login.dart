import 'package:book_store/controller/login_controller.dart';
import 'package:book_store/controller/user_controller.dart';
import 'package:book_store/view/signUp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final UserController userController = Get.put(UserController());

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
              onChanged: (value) => loginController.username.value = value,
              decoration: InputDecoration(
                  labelText: "Username", border: OutlineInputBorder()),
            ),
            SizedBox(height: 20,),
            TextField(
              onChanged: (value) => loginController.password.value = value,
              decoration: InputDecoration(labelText: "Password",border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => loginController.login(),
              child: Text("Login"),
            ),
            TextButton(
                onPressed: () {
                  Get.to(() => SignUpPage());
                },
                child: Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}
