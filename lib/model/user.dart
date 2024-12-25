import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserModel {
  final int id;
  final String username;
  final String password;
  final String email;
  final String role;
  final String name;
  final String address;
  final String phoneNumber;

  const UserModel({
    required this.id,
    required this.username,
    required this.password,
    required this.email,
    required this.role,
    required this.name,
    required this.address,
    required this.phoneNumber,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
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
