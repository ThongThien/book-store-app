import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/user.dart';


class UserController {
  final SupabaseClient _client = Supabase.instance.client;
  // Hàm lấy thông tin user kèm hóa đơn và sách
  Future<Map<String, dynamic>> getUserWithOrders(int userId) async {
    try {
      final userData = await _client
          .from('user')
          .select('*')
          .eq('id', userId)
          .single();

      if (userData == null) {
        throw Exception('Không tìm thấy thông tin người dùng');
      }

      final ordersData = await _client
          .from('order')
          .select('id, created_at, total_price, shipping_address, order_item(id, book_id, quantity, price, book(nameBook, image))')
          .eq('user_id', userId);

      return {
        'user': AppUser.fromMap(userData),
        'orders': ordersData as List,
      };
    } catch (e) {
      throw Exception('Lỗi khi lấy dữ liệu: $e');
    }
  }
}
