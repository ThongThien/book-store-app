import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class KiemTraXacNhan extends StatelessWidget {
  KiemTraXacNhan({super.key});
  @override
  Widget build(BuildContext context) {
    var data=Get.arguments;
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
                  Text("170.600đ",style: TextStyle(fontSize: 20,color: Colors.orange))
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.orange)
                      ),
                      onPressed: () {
                  
                      },
                      child: Text("Xác nhận đơn hàng",style: TextStyle(color: Colors.white,fontSize: 20),)
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
              Container(
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
                            child: Image.network(data[0].anh)
                        ),
                        SizedBox(width: 20,),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[0].ten,style: TextStyle(fontSize: 20),),

                              SizedBox(height: 20,),
                              Row(
                                children: [
                                  Text("${data[0].gia} \$",style: TextStyle(color: Colors.orange,fontSize: 20),),
                                  SizedBox(width: 10,),
                                  Text("99.000 đ",style: TextStyle(decoration: TextDecoration.lineThrough,fontSize: 17,),),
                                ],
                              ),
                              Text("Số lượng: 2",style: TextStyle(fontSize: 20)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
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
        ),
      ),
    );
  }
}
