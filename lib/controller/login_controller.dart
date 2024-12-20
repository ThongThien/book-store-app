import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../view/home.dart';
import 'user_controller.dart';

class LoginController extends GetxController {
  var username = ''.obs;
  var password = ''.obs;
  final supabase = Supabase.instance.client;

  Future<void> login() async {
    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('Lỗi', 'Vui lòng điền đầy đủ thông tin');
      return;
    }

    try {
      final login_user_pass_supabase = await supabase
          .from('user')
          .select()
          .eq('username', username.value)
          .eq('password', password.value)
          .maybeSingle();

      if (login_user_pass_supabase != null) {
        final id = login_user_pass_supabase['id'].toString();
        Get.find<UserController>().setUser(id);
        Get.snackbar('Thành công', 'Đăng nhập thành công');
        Get.to(() => HomePage());
      } else {
        Get.snackbar('Lỗi', 'Tên đăng nhập hoặc mật khẩu không đúng');
      }
    } catch (error) {
      Get.snackbar('Lỗi', 'Có lỗi xảy ra: $error');
    }
  }
}
