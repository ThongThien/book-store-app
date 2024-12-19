import 'package:book_store/model/book.dart';
import 'package:book_store/model/cart.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  final List<CartItem> cart=[];
  static CartController get controller => Get.find<CartController>();
  void addToCart(Book book,int sum){
    for(var item in cart){
      if(item.book.id==book.id){
        item.sl++;
        return ;
      }
    }
    cart.add(CartItem(book: book, sl: sum));
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