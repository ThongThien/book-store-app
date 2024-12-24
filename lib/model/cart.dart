import 'package:book_store/model/book.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartItem{
  int sl;
  Book book;
  bool selected;
  CartItem({required this.book, required this.sl,required this.selected});

  Map<String, dynamic> toMap(int code) {
    int newCode=DateTime.now().millisecondsSinceEpoch;
    return {
      'id':newCode,
      'order_id': code,
      'book_id': book.id,
      'quantity': sl,
      'price': book.price
    };
  }


}



class Cart_SnapShot{
    static Map<String, dynamic> addOrder(double sum,String s,int code,int user) {
      return {
        'id':code,
        'user_id': user,
        'created_at':DateTime.now().toIso8601String().split('T')[0],
        'total_price':sum,
        'shipping_address':s
      };
    }
  static Future<void> insert(List<CartItem> list, int userId,List<String> address) async {
    final supabase = Supabase.instance.client;
    String addr="";
    int code=DateTime.now().millisecondsSinceEpoch;
    for(int i=3;i<address.length;i++) {
      addr+=address[i]+" ";
    }
    double sum=0;
    for (CartItem i in list){
      sum+=i.book.price*i.sl;
    }
    await supabase.from("order").insert(Cart_SnapShot.addOrder(sum, addr,code,userId)).then((value) => print("đã thêm order"),).catchError((error) {
      print("Lỗi: $error");
    });
    for(CartItem i in list){
      await supabase.from("order_item").insert(i.toMap(code)).then((value) => print("đã thêm order_item"),).catchError((error) {
        print("Lỗi: $error");
      });
    }
  }
}