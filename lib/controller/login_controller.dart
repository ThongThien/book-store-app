import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_store/provider/user_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController {
  final supabase = Supabase.instance.client;

  Future<void> login({
    required String username,
    required String password,
    required BuildContext context,
  }) async {
    if (username.isEmpty || password.isEmpty) {
      throw Exception('Vui lòng điền đầy đủ thông tin');
    }

    try {
      final response = await supabase
          .from('user')
          .select()
          .eq('username', username)
          .eq('password', password)
          .single();

      if (response != null) {
        final role = response['role'];
        final id = response['id'].toString();
        // Lưu thông tin vào UserProvider
        Provider.of<UserProvider>(context, listen: false).setUser(role, id);
      } else {
        throw Exception('Tên đăng nhập hoặc mật khẩu không đúng');
      }
    } catch (error) {
      throw Exception('Có lỗi xảy ra: $error');
    }
  }
}
