import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/user.dart';

class UserController extends GetxController {
  var userId = 0.obs; // RxInt với giá trị mặc định là 0
  void setUser(int id) {
    userId.value = id; // Gán giá trị mới
    print("User ID đã được thiết lập: $id");
  }

  void clearUser() {
    userId.value = 0; // Reset về giá trị mặc định
    print("User ID đã được xóa: 0");
  }

  final SupabaseClient _client = Supabase.instance.client;

  Future<Map<String, dynamic>> getUserWithOrders(int userId) async {
    try {
      print('Bắt đầu lấy thông tin người dùng cho User ID: $userId');

      // Lấy thông tin người dùng từ bảng `user`
      final userData =
          await _client.from('user').select('*').eq('id', userId).maybeSingle();

      if (userData == null) {
        print('Không tìm thấy thông tin người dùng.');
        return {
          'user': null,
          'orders': [],
        };
      }

      // Lấy danh sách đơn hàng và sản phẩm liên quan từ bảng `order` và `order_item`
      final ordersData = await _client
          .from('order')
          .select('id, created_at, total_price, shipping_address, '
              'order_item(book_id, quantity, price)')
          .eq('user_id', userId);

      print('Kết quả ordersData: $ordersData');

      return {
        'user': AppUser.fromMap(userData),
        'orders': ordersData ?? [],
        // Nếu không có đơn hàng, trả về danh sách rỗng
      };
    } catch (e) {
      print('Lỗi khi lấy thông tin người dùng: $e');
      throw Exception('Không thể tải thông tin người dùng');
    }
  }

  Future<List<Map<String, dynamic>>> getOrderDetails(int orderId) async {
    try {
      // Lấy thông tin chi tiết đơn hàng
      final orderDetails = await _client
          .from('order_item')
          .select(
              'id, quantity, price, book(id, nameBook, author, publisher, price, image, description)')
          .eq('order_id', orderId) as List<dynamic>?;

      return orderDetails?.map((e) => e as Map<String, dynamic>).toList() ?? [];
    } catch (e) {
      print('Lỗi khi lấy chi tiết đơn hàng: $e');
      throw Exception('Không thể tải chi tiết đơn hàng');
    }
  }
}
