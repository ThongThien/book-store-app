import 'package:supabase_flutter/supabase_flutter.dart';
import '../model/book.dart';

class BookController {
  final SupabaseClient _client = Supabase.instance.client;

  Future<List<Book>> Book_Snapshot() async {
    final book_data = await _client
        .from('book')
        .select('id, nameBook,publicationDate, author,publisher,category, price, description, stock_quantity, image,language');

    if (book_data == null) {
      throw Exception('Không tìm thấy dữ lieu');
    }

    final data = book_data as List;
    return data.map((json) => Book.fromMap(json)).toList();
  }
}
