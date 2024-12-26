import 'package:book_store/model/book.dart';
import 'package:book_store/model/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final List<CartItem> cart = [];
  final List<String> address = [];

  static CartController get controller => Get.find<CartController>();

  double totalPrice() {
    double sum = 0;
    for (CartItem cartItem in cart) {
      if (cartItem.selected) {
        sum += cartItem.sl * cartItem.book.price;
      }
    }
    return sum;
  }

  void increase(int index) {
    cart[index].sl++;
    update(['count']);
    update(['totalPrice']);
  }

  void addressHandle(List<TextEditingController> addressList) {
    for (int i = 0; i < addressList.length; i++) {
      address.insert(i, addressList[i].text.toString());
    }
  }

  void decrease(int index) {
    cart[index].sl++;
    update(['count']);
    update(['totalPrice']);
  }

  void addToCart(Book book, int sum) {
    for (var item in cart) {
      if (item.book.id == book.id) {
        item.sl += sum;
        Get.snackbar("Đã thêm vào giỏ hàng", "");
        return;
      }
    }
    cart.add(CartItem(book: book, sl: sum, selected: true));
    Get.snackbar("Đã thêm vào giỏ hàng", "");
  }

  void selectedHandle(int index) {
    cart[index].selected = !cart[index].selected;
    update(['selected$index']);
    update(['totalPrice']);
  }
}

class GetXControllerIDCart extends GetxController {
  int count = 1;

  void increase() {
    count++;
    update(['count']);
  }

  void decrease() {
    if (count > 1) count--;
    update(['count']);
  }

  void setStart() {
    count = 1;
    update(['count']);
  }
}
