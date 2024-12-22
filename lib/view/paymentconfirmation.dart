import 'package:book_store/controller/cart_controller.dart';
import 'package:book_store/view/confirmationchecking.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentConfirmation extends StatelessWidget {
  PaymentConfirmation({super.key});
  final CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        backgroundColor: Colors.orange,
        title: Text("Thông tin giao hàng",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25,color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.orange),
                padding: WidgetStatePropertyAll(EdgeInsets.all(10))
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConfirmationCheck(),));
            },
            child: Text("Thanh toán",style: TextStyle(color: Colors.white,fontSize: 25),)
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 5,left: 5),
          child: Column(
            children: [
              Padding(
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
                      child: Text("2",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
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
                      child: Text("3",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,color: Colors.orange,fontWeight: FontWeight.bold),),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 3,
                            color: Colors.orange
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
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
              Container(
                padding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                color: Colors.blueGrey[50],
                child: Row(
                  children: [
                    Text("Phương thức vận chuyển",style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
              RadioListTile(

                fillColor: WidgetStatePropertyAll(Colors.orange),
                title: Text("Giao hàng tiêu chuẩn: 12",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                subtitle: Text("Dự kiến giao: Sau 5 ngày từ lúc xuất hàng",style: TextStyle(fontSize: 17),),
                value: true,
                groupValue: true,
                onChanged: (value) {

                },),
              Container(
                padding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                color: Colors.blueGrey[50],
                child: Row(
                  children: [
                    Text("Phương thức thanh toán",style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
              RadioListTile(
                fillColor: WidgetStatePropertyAll(Colors.orange),
                title: Text("Thanh toán bằng tiền mặt khi nhận hàng",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                value: true,
                groupValue: true,
                onChanged: (value) {

                },),
              Container(
                padding: EdgeInsets.only(left: 15,top: 20,bottom: 20),
                color: Colors.blueGrey[50],
                child: Row(
                  children: [
                    Text("Giá trị đơn hàng",style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Thành tiền",style: TextStyle(fontSize: 20)),
                  Text("${controller.totalPrice()}",style: TextStyle(fontSize: 20))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Phí vận chuyển",style: TextStyle(fontSize: 20)),
                  Text("12",style: TextStyle(fontSize: 20))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tổng số tiền",style: TextStyle(fontSize: 20),),
                  Text("${controller.totalPrice()+(12.00)}",style: TextStyle(color: Colors.orange,fontSize: 20),)
                ],
              )
            ],
          ),
        ),
      ),
    );

  }
}

