import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/user_controller.dart';
import '../provider/user_provider.dart';
import 'login.dart';
import 'orderDetails.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final UserController _controller = UserController();
  Map<String, dynamic>? _userData; // Chứa thông tin user và hóa đơn

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  void _fetchUserData() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final data =
          await _controller.getUserWithOrders(int.parse(userProvider.id));
      setState(() {
        _userData = data;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching user data: $e')),
      );
    }
  }

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
            // Thông tin user
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                const SizedBox(height: 20),
                Text(
                  'User ID: ${userProvider.id}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
                Text(
                  'Name: ${_userData!['user'].name}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
                Text(
                  'Email: ${_userData!['user'].email}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
                Text(
                  'Address: ${_userData!['user'].address}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
                Text(
                  'Phone Number: ${_userData!['user'].phoneNumber}',
                  style: const TextStyle(fontSize: 18),
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
                                OrderDetailPage(orderId: order['id']),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                userProvider.clearUser();
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
      ),
    );
  }
}
