import 'package:book_store/view/home.dart';
import 'package:flutter/material.dart';

class SuccessNotification extends StatelessWidget {
  const SuccessNotification({super.key});
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Thanh Toán",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),),
        backgroundColor: Colors.orange,
        leading: IconTheme(
          data: IconThemeData(
            color: Colors.white,
            size: 40.0,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                    (Route<dynamic> route) => false,
              );
            },
          ),
        ),
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text("Số đơn hàng: ",style: TextStyle(fontSize: 20)),
            //     Text("#402316442",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            //   ],
            // ),
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
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                            (Route<dynamic> route) => false,
                      );
                    },
                    child: Text("Tiếp tục mua hàng",style: TextStyle(fontSize: 20,color: Colors.white),),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(height: 10,),
            SizedBox(height: 30,),
            Text("Bạn cần hỗ trợ, vui lòng liên hệ",style: TextStyle(fontSize: 18,color: Colors.grey),),
            Text("1900.63.64.67",style: TextStyle(fontSize: 18,color: Colors.orange,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
