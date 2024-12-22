import 'package:book_store/model/book.dart';
import 'package:book_store/model/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CartController extends GetxController{
  final List<CartItem> cart=[];
  final List<String> address=[];
  static CartController get controller => Get.find<CartController>();
  void increase(int index){
    cart[index].sl++;
    update(['count']);
  }
  void addressHandle(List<TextEditingController> addressList){
    for(int i=0;i<addressList.length;i++){
      address.insert(i, addressList[i].text.toString());
    }
    for(String i in address){
      print("${i}");
    }
  }
  void decrease(int index){
    cart[index].sl++;
    update(['count']);
  }
  void addToCart(Book book,int sum){
    for(var item in cart){
      if(item.book.id==book.id){
        item.sl++;
        return ;
      }
    }
    cart.add(CartItem(book: book, sl: sum,selected: true));
  }
  void selectedHandle(int index){
    cart[index].selected=!cart[index].selected;
    update(['selected$index']);
  }
}
class CartBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(CartController());
  }
}

class GetXControllerIDCart extends GetxController{
  int count=0;
  void increase(){
    count++;
    update(['count']);
  }
  void decrease(){
    if(count!=0) count--;
    update(['count']);
  }
}