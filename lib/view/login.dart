import 'package:book_store/chitietsanpham/chitietsanpham.dart';
import 'package:book_store/chitietsanpham/danhmuc.dart';
import 'package:book_store/chitietsanpham/giohang.dart';
import 'package:book_store/chitietsanpham/kiemtraxacnhan.dart';
import 'package:book_store/chitietsanpham/supabase.dart';
import 'package:book_store/chitietsanpham/thanhtoan.dart';
import 'package:book_store/chitietsanpham/thongbaothanhtoanthanhcong.dart';
import 'package:book_store/chitietsanpham/xacnhanthanhtoan.dart';
import 'package:book_store/view/signUp.dart';
import 'package:flutter/material.dart';
import 'package:book_store/controller/login_controller.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final LoginController _loginController = LoginController();

  void _handleLogin() async {
    if (_usernameController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vui lòng điền đầy đủ thông tin')),
      );
      return;
    }
    try {
      await _loginController.login(
        username: _usernameController.text.trim(),
        password: _passwordController.text.trim(),
        context: context,
      );
      // Chuyển hướng đến HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
          buildNavigateButton(context,title: "Chi tiết sản phẩm",destination:Chitietsanpham()),
          buildNavigateButton(context,title: "Giỏ hàng",destination:GioHang()),
          buildNavigateButton(context,title: "Thanh toán",destination:PageThanhtoan()),
          buildNavigateButton(context,title: "Xác nhận Thanh toán",destination:PageXacNhanThanhToan()),
          buildNavigateButton(context,title: "Kiểm tra xác nhận Thanh toán",destination:KiemTraXacNhan()),
          buildNavigateButton(context,title: "Thông báo đặt hàng thành công",destination:Thongbaothanhtoanthanhcong()),
            buildNavigateButton(context,title: "Danh mục",destination:Danhmuc()),
            buildNavigateButton(context,title: "Home",destination:HomePage()),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _handleLogin,
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: Text('Create an Account'),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildNavigateButton(BuildContext context,{required String title,required Widget destination}) {
    return Container(
      width: 250,

      child: ElevatedButton(
          onPressed: (){
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => destination,)
            )   ;
          },
          child:  Text(title)
      ),
    );
  }
}
