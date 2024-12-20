import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/user.dart';

class UserController extends GetxController {
  var userId = ''.obs;
  void setUser(String id) {
    userId.value = id;
  }
  void clearUser() {
    userId.value = '';
  }

  final SupabaseClient _client = Supabase.instance.client;

  Future<Map<String, dynamic>> getUserWithOrders(int userId) async {
    try {
      final userData =
          await _client.from('user').select('*').eq('id', userId).single();

      if (userData == null) {
        throw Exception('Không tìm thấy thông tin người dùng');
      }

      final ordersData = await _client
          .from('order')
          .select('id, created_at, total_price, shipping_address, '
              'order_item(id, book_id, quantity, price, book(nameBook, image))')
          .eq('user_id', userId);

      return {
        'user': AppUser.fromMap(userData),
        'orders': ordersData as List,
      };
    } catch (e) {
      throw Exception('Lỗi khi lấy dữ liệu: $e');
    }
  }
  Future<List<Map<String, dynamic>>> getOrderDetails(int orderId) async {
    try {
      final orderDetails = await _client
          .from('order_item')
          .select('id, quantity, price, book(id, nameBook, author, publisher, price, image, description)')
          .eq('order_id', orderId);

      return orderDetails as List<Map<String, dynamic>>;
    } catch (e) {
      throw Exception('Lỗi khi lấy chi tiết hóa đơn: $e');
    }
  }

}
