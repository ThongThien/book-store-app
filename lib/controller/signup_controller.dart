import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpController {
  final supabase = Supabase.instance.client;

  Future<bool> signUp({
    required String username,
    required String password,
    required String confirmPassword,
    required String email,
  }) async {
    if (username.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        email.isEmpty) {
      return Future.error('Điền vào các thông tin yêu cầu để đăng ký');
    }

    if (password != confirmPassword) {
      return Future.error('Passwords không khớp');
    }
    try {
      final response = await supabase.from('user').select('id');
      final count = (response as List).length;
      final newId = count + 1;

      await supabase.from('user').insert({
        'id': newId,
        'username': username,
        'password': password,
        'email': email,
        'role': 'user',
      });

      return true;
    }  catch (error) {
      return Future.error('Đăng ký thất bại: $error');
    }
  }
}
