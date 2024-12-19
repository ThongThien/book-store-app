import 'package:supabase_flutter/supabase_flutter.dart';

class Book{
  int id;
  String ten;

  Book({
    required this.id,
    required this.ten,
  });
  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'] as int,
      ten: map['shipping_address'] as String,
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'id':this.id,
      'shipping_address':this.ten,
    };
  }


}

class Book_Snapshot{
  Book book;
  Book_Snapshot({required this.book});
  Future<void> delete () async{
    final supabase=Supabase.instance.client;
    await supabase.from("order").delete().eq("id",book.id);
  }
  Future<void> update(Book nFruit)async{
    final supabase=Supabase.instance.client;
    await supabase.from("order").update(nFruit.toMap()).eq("id",book.id);
  }
  static Future<void> insert(Book nfruit)async{
    final supabase=Supabase.instance.client;
    await supabase.from("order").insert(nfruit.toMap());
  }
  static Future<List<Book_Snapshot>> getAll()async{
    final supabase=Supabase.instance.client;
    var data=await supabase.from("order").select();
    return data.map((e) => Book_Snapshot(book: Book.fromMap(e)),).toList();
  }
}

