import 'package:flutter/material.dart';

class GioHang extends StatelessWidget {
  const GioHang({super.key});

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
              children: [
                  Container(
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
                          child: CheckboxListTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            title: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQssqDqtb8e2Xu3B44Nxoir1bFp2o4dq_VouQ&s"),
                            value: true, onChanged: (value) {

                          },)
                        ),
                        SizedBox(width: 10,),
                        Expanded(child: Column(
                          children: [
                            Text("Sức mạnh của EQ - Đánh Thức Trí Tuệ Cảm Xúc - Lmà Chủ Ngôn Ngữ - Thu Phục Lòng Người"),
                            SizedBox(height: 20,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("69.300 đ",style: TextStyle(fontSize: 17,color: Colors.orangeAccent,),),
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
                                      child: Text("100"),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
