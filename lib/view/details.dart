import 'package:book_store/controller/cart_controller.dart';
import 'package:book_store/model/book.dart';
import 'package:book_store/view/cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Detail extends StatelessWidget {
  Detail({super.key});

  final controller = Get.put(GetXControllerIDCart());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    final arg = (ModalRoute.of(context)!.settings.arguments) as Book;
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: 20,
                            height: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                shape: BoxShape.rectangle,
                                color: Colors.black38),
                            child: IconButton(
                                iconSize: 20,
                                onPressed: () {
                                  controller.decrease();
                                },
                                icon: const Icon(Icons.remove)),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 6, top: 6),
                            color: Colors.white,
                            child: GetBuilder(
                              init: controller,
                              id: "count",
                              builder: (controller) {
                                return Text("${controller.count}");
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 30,
                            width: 20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              shape: BoxShape.rectangle,
                              color: Colors.black38,
                            ),
                            child: IconButton(
                                iconSize: 20,
                                onPressed: () {
                                  controller.increase();
                                },
                                icon: const Icon(Icons.add)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
              Expanded(
                  child: Container(
                alignment: Alignment.center,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.white,
                ),
                child: GestureDetector(
                  onTap: () {
                    cartController.addToCart(arg, controller.count);
                  },
                  child: const Text("Thêm vào giỏ",
                      style: TextStyle(fontSize: 20, color: Colors.orange)),
                ),
              )),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actionsIconTheme: const IconThemeData(),
        leading: IconTheme(
          data: const IconThemeData(
            color: Colors.white,
            size: 40.0,
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              controller.setStart();
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Cart(),
                ));
              },
              icon: const Icon(Icons.shopping_cart_checkout_outlined),color: Colors.white,iconSize: 30,),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(height: 400.0),
                items: [1].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(color: Colors.white),
                          child: FittedBox(
                            child: Image.network(arg.image),
                          ));
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(5),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  children: [
                    Text(
                      "${arg.price} \$ ",
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.red,
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
              ),
              Text(
                arg.nameBook,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Wrap(
                  direction: Axis.vertical,
                  spacing: 20,
                  children: [
                    const Text(
                      "Thông tin sản phẩm",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    infor("Mã hàng", "${arg.id}"),
                    infor("Tác giả", arg.author),
                    infor("Nhà xuất bản", arg.publisher),
                    infor("Ngày xuất bản",
                        DateFormat('dd-MM-yyyy').format(arg.publicationDate)),
                    infor("Ngôn ngữ", arg.language),
                    infor("Thể loại", "${arg.categoryID}"),
                    infor("Mô tả", arg.description),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding infor(String w1, String w2) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 200,
            child: Text(w1),
          ),
          SizedBox(
            child: Text(w2),
          )
        ],
      ),
    );
  }
}
