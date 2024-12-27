import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/user.dart';

class UserController extends GetxController {
  var userId = 0.obs; // type RxInt
  void setUser(int id) {
    userId.value = id;
  }

  void clearUser() {
    userId.value = 0;
  }

  final SupabaseClient _client = Supabase.instance.client;

  Future<Map<String, dynamic>> getUserWithOrders(int userId) async {
    try {
      final userData =
          await _client.from('user').select('*').eq('id', userId).maybeSingle();
      if (userData == null) {
        return {
          'user': null,
          'orders': [],
        };
      }

      final ordersData = await _client
          .from('order')
          .select('id, created_at, total_price, shipping_address, '
              'order_item(book_id, quantity, price)')
          .eq('user_id', userId);
      return {
        'user': UserModel.fromMap(userData),
        'orders': ordersData,
      };
    } catch (e) {
      throw Exception('Không thể tải thông tin người dùng');
    }
  }

  Future<List<Map<String, dynamic>>> getOrderDetails(int orderId) async {
    try {
      final orderDetails = await _client
          .from('order_item')
          .select(
              'id, quantity, price,state, book(id, nameBook, author, publisher, price, image, description)')
          .eq('order_id', orderId) as List<dynamic>?;

      // Duyệt qua orderDetails (nếu có), chuyển đổi mỗi phần tử thành Map<String, dynamic>, và trả về một danh sách.
      return orderDetails?.map((e) => e as Map<String, dynamic>).toList() ?? [];
    } catch (e) {
      throw Exception('Không thể tải chi tiết đơn hàng');
    }
  }

  Future<void> updateState(int orderItemId, String newState) async {
    try {
      await _client
          .from('order_item')
          .update({'state': newState}).eq('id', orderItemId);
    } catch (e) {
      throw Exception('Không thể cập nhật trạng thái: $e');
    }
  }
}
