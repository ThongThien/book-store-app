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
      _userData; // lưu trữ dữ liệu người dùng và danh sách đơn hàng tu ham _userDataSnapshot
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
          title: const Text('Thông tin người dùng'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin người dùng'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                          'ID: ${userController.userId.value}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Tên: ${_userData!['user'].name}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Email: ${_userData!['user'].email}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Địa Chỉ: ${_userData!['user'].address}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Số Điện Thoại: ${_userData!['user'].phoneNumber}',
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
                      child: const Text("Đăng xuất"),
                    ),
                  ],
                ),
              ],
            ),

            const Divider(),
            const SizedBox(height: 10),
            const Text(
              'Hóa đơn đã đặt:',
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
                      title: Text('Mã hóa đơn: ${order['id']}'),
                      subtitle: Text(
                        'Tổng giá: ${order['total_price']} VND\n'
                        'Địa chỉ giao hàng: ${order['shipping_address']} \n'
                        'Ngày đặt: ${order['created_at']}',
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
