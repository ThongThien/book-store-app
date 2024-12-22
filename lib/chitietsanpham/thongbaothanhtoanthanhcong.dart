import 'package:flutter/material.dart';

class Thongbaothanhtoanthanhcong extends StatelessWidget {
  const Thongbaothanhtoanthanhcong({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Thanh Toán",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
        backgroundColor: Colors.orange,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 30,right: 30),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline_sharp,size: 150,color: Colors.orange,),
            Text("CẢM ƠN BẠN ĐÃ MUA HÀNG",style: TextStyle(fontSize: 25,color: Colors.orange),),
            SizedBox(height: 30,),
            Text("Bạn đã đặt hàng thành công",style: TextStyle(fontSize: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Số đơn hàng: ",style: TextStyle(fontSize: 20)),
                Text("#402316442",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 20,),
            Text("Bạn sẽ sớm nhận được email xác nhận đơn hàng từ chúng tôi",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
            SizedBox(height: 20,),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.orange),
                        padding: WidgetStatePropertyAll(EdgeInsets.all(15))
                    ),
                      onPressed: () {

                      },
                      child: Text("Tiếp tục mua hàng",style: TextStyle(fontSize: 20,color: Colors.white),),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                      side: WidgetStatePropertyAll(BorderSide(width: 3,color: Colors.orange)),
                      padding: WidgetStatePropertyAll(EdgeInsets.all(15))
                    ),
                      onPressed: () {

                      },
                      child: Text("Xem chi tiết đơn hàng",style: TextStyle(fontSize: 20,color: Colors.orange),)
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            IconButton(
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                  textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 20))
              ),
                onPressed: () {

                },
                icon: Text("Thay đổi phương thức thanh toán >",style: TextStyle(color: Colors.blue),),
            ),

            SizedBox(height: 30,),
            Text("Bạn cần hỗ trợ, vui lòng liên hệ",style: TextStyle(fontSize: 18,color: Colors.grey),),
            Text("1900.63.64.67",style: TextStyle(fontSize: 18,color: Colors.orange,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
