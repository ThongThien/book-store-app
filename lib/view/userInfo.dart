import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';
import 'login.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User ID: ${userProvider.id}',
                style: const TextStyle(fontSize: 18)),
            Text('User Role: ${userProvider.role}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final userProvider =
                    Provider.of<UserProvider>(context, listen: false);
                userProvider.clearUser(); // Xóa thông tin user

                // Điều hướng về trang Login và xóa tất cả màn hình trước đó
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (Route<dynamic> route) =>
                      false, // Xóa tất cả các route trước đó
                );
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
