import 'package:book_store/chitietsanpham/xacnhan.dart';
import 'package:book_store/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<TextEditingController> addressList=[];

class PageThanhtoan extends StatelessWidget {
  PageThanhtoan({super.key});
  final controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.orange),
              padding: WidgetStatePropertyAll(EdgeInsets.all(20))
            ),

            onPressed: () {
              controller.addressHandle(addressList);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Pagexacnhan(),));
            },
            child: Text("Xác nhận địa chỉ",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.white),)),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
           size: 40
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.orange,
        title: Text("Thông tin giao hàng",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 25,color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child:
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text("1",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
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
                      child: Text("2",textAlign: TextAlign.center,style: TextStyle(fontSize: 25,color: Colors.orange,fontWeight: FontWeight.bold),),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 3,
                          color: Colors.orange
                        ),
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
                    Text("Địa chỉ đặt hàng",style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
              ),
              textfield("Họ và tên người nhận",0),
              textfield("SDT",1),
              textfield("Quốc gia",2),
              textfield("Tỉnh / Thành phố",3),
              textfield("Quận / Huyện",4 ),
              textfield("Phường / Xã",5),
              textfield("Địa chỉ ",6),
            ],
          ),
      ),
    );
  }
  // Widget dropdown(String title){
  //   var result;
  //   result=DropdownButtonFormField<String>(
  //     decoration: InputDecoration(
  //         focusedBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(5),
  //             borderSide: BorderSide(
  //               width: 3,
  //               color: Colors.grey,
  //             )
  //         ),
  //         enabledBorder: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(5),
  //             borderSide: BorderSide(
  //               width: 1,
  //               color: Colors.grey,
  //             )
  //         )
  //     ),
  //     items: <String>['A', 'B', 'C', 'D'].map((String value) {
  //       return DropdownMenuItem<String>(
  //         value: value,
  //         child: Text(value),
  //       );
  //     }).toList(),
  //     onChanged: (_) {},
  //   );
  //   return Container(
  //     child: ListTile(
  //         title: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
  //         subtitle: result
  //     ),
  //   );
  // }
  Widget textfield(String title,int index){
    var result;
    addressList.insert(index,TextEditingController());
      result= TextField(
        controller: addressList[index],
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  width: 3,
                  color: Colors.grey,
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.grey,
                )
            )
        ),
      );
    return Container(
      child: ListTile(
        title: Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
        subtitle: result
      ),
    );
  }
}
