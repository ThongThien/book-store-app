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
      // Mỗi response xem như 1 dòng dữ liệu trong table user
      final response = await supabase.from('user').select('id'); // Lấy tất cả ID
      final count = (response as List).length; // Đếm số lượng ID
      final newId = count + 1; // Tạo ID mới bằng số lượng hiện tại + 1

      await supabase.from('user').insert({
        'id': newId,
        'username': username,
        'password': password,
        'email': email,
        'role': 'user',
      });

      return true;
    } catch (error) {
      return Future.error('Đăng ký Thất bại');
    }
  }
}
