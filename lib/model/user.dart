import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppUser {
  final int id;
  final String username;
  final String password;
  final String email;
  final String role;
  final String name;
  final String address;
  final String phoneNumber;

  const AppUser({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.role,
    required this.name,
    required this.address,
    required this.phoneNumber,
  });

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] as int,
      username: map['username'] ?? '',
      password: map['password'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? '',
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'email': email,
      'role': role,
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
    };
  }
}
class SignUpController {
  final supabase = Supabase.instance.client;
  static SignUpController get controller => Get.put(SignUpController());
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
      final checkUsername = await supabase
          .from('user')
          .select('id')
          .eq('username', username)
          .limit(1)
          .maybeSingle();

      if (checkUsername != null) {
        return Future.error(
            'Tên đăng nhập đã tồn tại. Vui lòng chọn tên khác.');
      }

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
    } catch (error) {
      return Future.error('Đăng ký thất bại: $error');
    }
  }
}
