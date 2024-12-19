import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/book.dart';
class BookController {
  final SupabaseClient _client = Supabase.instance.client;
  Future<List<Book>> Book_Snapshot() async {
    final book_supabase = await _client
        .from('book')
        .select("*");
    if (book_supabase == null) {
      throw Exception('Không tìm thấy dữ lieu');
    }
    final data = book_supabase as List;
    return data.map((json) => Book.fromMap(json)).toList();
  }

  Future<List<Book>> searchBooks(String query) async {
    final data = await _client
        .from('book')
        .select('*')
        .ilike('nameBook', '%$query%'); // Tìm kiếm gần đúng theo "nameBook"
    return (data as List).map((e) => Book.fromMap(e)).toList();
  }
}