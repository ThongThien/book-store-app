import 'package:book_store/controller/cart_controller.dart';
import 'package:book_store/controller/user_controller.dart';
import 'package:book_store/model/cart.dart';
import 'package:book_store/view/successfulnotification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class ConfirmationCheck extends StatefulWidget {
  ConfirmationCheck({super.key});
  @override
  State<ConfirmationCheck> createState() => _ConfirmationCheckState();
}

class _ConfirmationCheckState extends State<ConfirmationCheck> {
  final CartController controller = Get.put(CartController());
  final UserController userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Kiểm tra đơn hàng",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25,color: Colors.white),textAlign: TextAlign.center,),
        iconTheme: IconThemeData(
            color: Colors.white,
            size: 40
        ),
        backgroundColor: Colors.orange,
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 5),
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tổng số tiền",style: TextStyle(fontSize: 20),),
                  Text("${controller.totalPrice()+12.00}",style: TextStyle(fontSize: 20,color: Colors.orange))
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: FutureBuilder<void>(
                    future: Cart_SnapShot.insert(controller.cart,(userController.userId.value),controller.address,),
                    builder: (context, snapshot) {
                      return  ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(Colors.orange)
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SuccessNotification(),));
                          },
                          child: Text("Xác nhận đơn hàng",style: TextStyle(color: Colors.white,fontSize: 20),)
                      );
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
            width: mediaQuery.size.width,
            height: (mediaQuery.size.height -
                mediaQuery.padding.top),
            color: Colors.blueGrey[50],
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          child: Icon(Icons.check,
                            color: Colors.white,
                            size: 30,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 5,
                            width: 100,
                            child: ColoredBox(
                              color: Colors.orange,
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          child: Icon(Icons.check,color: Colors.white,),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 5,
                            width: 100,
                            child: ColoredBox(
                              color: Colors.orange,
                            ),
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          child: Text("3",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                          decoration: BoxDecoration(
                            color: Colors.orange,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Giao hàng",style: TextStyle(fontSize: 20),),
                        Text("Thanh toán",style: TextStyle(fontSize: 20)),
                        Text("Kiểm tra",style: TextStyle(fontSize: 20))
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                  child: Row(
                    children: [
                      Text("Kiểm tra lại đơn hàng",style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: controller.cart.length,
                    separatorBuilder: (context, index) => SizedBox(height: 20,),
                    itemBuilder:
                        (context, index) {
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.all(12),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Image.network("${controller.cart[index].book.image}")
                                ),
                                SizedBox(width: 20,),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${controller.cart[index].book.nameBook}",style: TextStyle(fontSize: 20),),

                                      SizedBox(height: 20,),
                                      Row(
                                        children: [
                                          Text("${controller.cart[index].book.price} \$",style: TextStyle(color: Colors.orange,fontSize: 20),),
                                          SizedBox(width: 10,),
                                          Text("99.000 đ",style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 17,),),
                                        ],
                                      ),
                                      Text("${controller.cart[index].sl}",style: TextStyle(fontSize: 20)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text("Tôi đồng ý với các điều kiện, chính sách của cửa hàng"),
                  value: true,
                  onChanged: (value) {

                  },
                ),
              ],
            ),
          )
      ),
    );
  }
}
