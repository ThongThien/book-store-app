import 'package:book_store/chitietsanpham/thanhtoan.dart';
import 'package:book_store/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CartApp extends StatelessWidget {
  const CartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: GioHang(),
    );
  }
}

class GioHang extends StatelessWidget {
  GioHang({super.key});
  final controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giỏ hàng"),
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
            width: 1,
            color: Colors.black12)
          ),
          padding: const EdgeInsets.all(20),
          child: Row(
              children: [
                Expanded(
                      child: Container(
                        height: 50,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text("Thành tiền"),
                            Text("138.000 đ")
                          ],
                        )
                      ),
                  ),
                Expanded(
                  child: ElevatedButton(onPressed:() {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PageThanhtoan(),));
                  },
                  child: Text("Thanh toán")
                  )
                )
              ],
          ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black38,
          child: Padding(padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                width: 1,
                                color: Colors.black12
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  child: GetBuilder(
                                    builder: (controller) {
                                      return CheckboxListTile(
                                        controlAffinity: ListTileControlAffinity.leading,
                                        title: Image.network("${controller.cart[index].book.image}",height: 200,),
                                        value: controller.cart[index].selected,
                                        onChanged: (value) {
                                          controller.selectedHandle(index);
                                        },
                                      );
                                    },
                                  id: 'selected$index',
                                  init: controller,
                                  )
                              ),
                              SizedBox(width: 10,),
                              Expanded(child: Column(
                                children: [
                                  Text("${controller.cart[index].book.nameBook}"),
                                  SizedBox(height: 20,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${controller.cart[index].book.price}",style: TextStyle(fontSize: 17,color: Colors.orangeAccent,),),
                                      SizedBox(width: 15,),
                                      Text("99.000 đ",style: TextStyle(fontSize: 14,color: Colors.grey,decoration: TextDecoration.lineThrough),),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child:Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                shape: BoxShape.rectangle,
                                                color: Colors.black38
                                            ),
                                            child: IconButton(
                                              onPressed: () {
                                                controller.increase(index);
                                              },
                                              icon: Text("+",style: TextStyle(
                                                  fontSize: 20
                                              ),),

                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Container(
                                            padding: EdgeInsets.only(left: 10,right: 10,bottom: 6,top: 6),
                                            color: Colors.white,
                                            child: GetBuilder(
                                              id: 'count',
                                              init:controller,
                                                builder:(controller) {
                                                  return Text("${controller.cart[index].sl}");
                                                },
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child:Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5),
                                                shape: BoxShape.rectangle,
                                                color: Colors.black38
                                            ),
                                            child: IconButton(
                                                onPressed: () {
                                                  controller.decrease(index);
                                                },
                                                icon: Text("-",style: TextStyle(
                                                    fontSize: 20
                                                ),)

                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: IconButton(
                                              onPressed: () {
                                              },
                                              icon: Icon(Icons.delete,size: 40,)),
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
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
