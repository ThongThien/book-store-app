import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../view/home.dart';
import 'user_controller.dart';

class LoginController extends GetxController {
  final supabase = Supabase.instance.client;

  Future<void> login(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('Lỗi', 'Vui lòng điền đầy đủ thông tin');
      return;
    }

    try {
      final loginUser = await supabase
          .from('user')
          .select()
          .eq('username', username)
          .eq('password', password)
          .maybeSingle();

      if (loginUser != null) {
        final id = loginUser['id'];
        Get.find<UserController>().setUser(id); // Đặt userId
        Get.snackbar('Thành công', 'Đăng nhập thành công');
        Get.to(() => HomePage());
      } else {
        Get.snackbar('Lỗi', 'Tên đăng nhập hoặc mật khẩu không đúng');
      }
    } catch (error) {
      print('Lỗi khi đăng nhập: $error');
      Get.snackbar('Lỗi', 'Có lỗi xảy ra: $error');
    }
  }
}
