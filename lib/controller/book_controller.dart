import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/book.dart';

class BookController extends GetxController {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<Book>>? futureBooks;

  Future<List<Book>> bookSnapshot() async {
    final bookSupabase = await _client.from('book').select("*");
    final data = bookSupabase as List;
    //Chuyển đổi dữ liệu từ JSON (book_supabase) thành danh sách các đối tượng Book bằng Book.fromMap.
    return data.map((e) => Book.fromMap(e)).toList();
  }

  Future<List<Book>> searchBooks(String query) async {
    final result =
        await _client.from('book').select('*').ilike('nameBook', '%$query%');
    if ((result as List).isEmpty) {
      return [];
    }

    final data = result as List;
    return data.map((e) => Book.fromMap(e)).toList();
  }

  void updateSearch(String query) {
    futureBooks = query.isEmpty ? bookSnapshot() : searchBooks(query);
    update();
  }
}
