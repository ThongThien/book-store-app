import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/user_controller.dart';
import 'login.dart';
import 'orderDetails.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final UserController userController = Get.put(UserController());
  Map<String, dynamic>?
      _userData; // lưu trữ dữ liệu người dùng và danh sách đơn hàng
//_userData = {
//   'user': UserModel, // Thông tin người dùng
//   'orders': List<Map<String, dynamic>> // Danh sách đơn hàng
// };
  @override
  void initState() {
    super.initState();
    _userDataSnapshot();
  }

  void _userDataSnapshot() async {
    final data =
        await userController.getUserWithOrders(userController.userId.value);
    setState(() {
      _userData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_userData == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('User Information'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thông tin user
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: const NetworkImage(
                          'https://static.vecteezy.com/system/resources/previews/019/896/008/original/male-user-avatar-icon-in-flat-design-style-person-signs-illustration-png.png',
                        ),
                        backgroundColor: Colors.grey[200],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User ID: ${userController.userId.value}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Name: ${_userData!['user'].name}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Email: ${_userData!['user'].email}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Address: ${_userData!['user'].address}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Phone Number: ${_userData!['user'].phoneNumber}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        userController.clearUser();
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      child: const Text("Logout"),
                    ),
                  ],
                ),
              ],
            ),

            const Divider(),
            const SizedBox(height: 10),
            const Text(
              'Orders:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _userData!['orders'].length,
                itemBuilder: (context, index) {
                  final order = _userData!['orders'][index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text('Order ID: ${order['id']}'),
                      subtitle: Text(
                        'Total Price: ${order['total_price']} VND\n'
                        'Shipping Address: ${order['shipping_address']} \n'
                        'Order date: ${order['created_at']}',
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OrderDetailPage(orderID: order['id']),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
