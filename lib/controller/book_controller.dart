import 'package:book_store/model/cart.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/book.dart';

class BookController extends GetxController {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<Book>>? futureBooks;

  Future<List<Book>> Book_Snapshot() async {
    final book_supabase = await _client.from('book').select("*");
    if (book_supabase == null) {
      throw Exception('Không tìm thấy dữ liệu');
    }
    final data = book_supabase as List;
    //Chuyển đổi dữ liệu từ JSON (book_supabase) thành danh sách các đối tượng Book bằng Book.fromMap.
    return data.map((e) => Book.fromMap(e)).toList();
  }

  Future<List<Book>> searchBooks(String query) async {
    final result =
        await _client.from('book').select('*').ilike('nameBook', '%$query%');
    if (result == null || (result as List).isEmpty) {
      return [];
    }

    final data = result as List;
    return data.map((e) => Book.fromMap(e)).toList();
  }

  void updateSearch(String query) {
    futureBooks = query.isEmpty ? Book_Snapshot() : searchBooks(query);
    update();
  }
}
