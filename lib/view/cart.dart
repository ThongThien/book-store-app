import 'package:book_store/controller/cart_controller.dart';
import 'package:book_store/view/address.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  final controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giỏ hàng"),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.black12)),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                  height: 50,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text("Thành tiền"),
                      GetBuilder(
                        id: 'totalPrice',
                        init: controller,
                        builder: (controller) {
                          return Text("${controller.totalPrice()}");
                        },
                      ),
                    ],
                  )),
            ),
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      if(controller.totalPrice()==0){
                        Get.snackbar("Thông báo", "Qúy khách chưa chọn sản phẩm");
                      }else {
                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddressPage(),
                      ));
                      }
                    },
                    child: const Text("Thanh toán")))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black38,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                GetBuilder(
                  init: controller,
                  id:'cart',
                  builder: (controller) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 1, color: Colors.black12),
                              borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    child: GetBuilder(
                                      builder: (controller) {
                                        return CheckboxListTile(
                                          controlAffinity:
                                          ListTileControlAffinity.leading,
                                          title: Image.network(
                                            controller.cart[index].book.image,
                                            height: 200,
                                          ),
                                          value: controller.cart[index].selected,
                                          onChanged: (value) {
                                            controller.selectedHandle(index);
                                          },
                                        );
                                      },
                                      id: 'selected$index',
                                      init: controller,
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Column(
                                      children: [
                                        Text(controller.cart[index].book.nameBook),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${controller.cart[index].book.price} \$",
                                              style: const TextStyle(
                                                fontSize: 17,
                                                color: Colors.orangeAccent,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 20),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(5),
                                                      shape: BoxShape.rectangle,
                                                      color: Colors.black38),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      controller.increase(index);
                                                    },
                                                    icon: const Text(
                                                      "+",
                                                      style: TextStyle(fontSize: 20),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 3,
                                                child: Container(
                                                  padding: const EdgeInsets.only(
                                                      left: 10,
                                                      right: 10,
                                                      bottom: 6,
                                                      top: 6),
                                                  color: Colors.white,
                                                  child: GetBuilder(
                                                    id: 'count',
                                                    init: controller,
                                                    builder: (controller) {
                                                      return Text(
                                                          "${controller.cart[index].sl}");
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(5),
                                                      shape: BoxShape.rectangle,
                                                      color: Colors.black38),
                                                  child: IconButton(
                                                      onPressed: () {
                                                        controller.decrease(index);
                                                      },
                                                      icon: const Text(
                                                        "-",
                                                        style: TextStyle(fontSize: 20),
                                                      )),
                                                ),
                                              ),
                                              Expanded(
                                                child: IconButton(
                                                    onPressed: () {
                                                      controller.removeItem(controller.cart[index].book);
                                                    },
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      size: 40,
                                                    )),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: CartController.controller.cart.length,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
