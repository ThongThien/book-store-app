import 'package:book_store/model/book.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartItem{
  int sl;
  Book book;
  bool selected;
  CartItem({required this.book, required this.sl,required this.selected});

  Map<String, dynamic> toMap() {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    return {
      'id':DateTime.now().millisecondsSinceEpoch,
      'order_id':1,
      // 'created_at':date.toString().replaceAll("00:00:00.000", ""),
      'book_id':book.id,
      // 'total_price':130,
      'quantity':sl,
      // 'shipping_address':'dien khánh'
      'price':book.price
    };
  }
}

class Cart_SnapShot{
  CartItem cartItem;
  Cart_SnapShot({required this.cartItem});
  static Future<void> insert(List<CartItem> list)async{
    final supabase=Supabase.instance.client;
    for(CartItem i in list){
      await supabase.from("order_item").insert(i.toMap());
    }

  }
}