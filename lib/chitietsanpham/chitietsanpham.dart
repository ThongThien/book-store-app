import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Chitietsanpham extends StatelessWidget {
  const Chitietsanpham({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: Container(
              height: 100,
              color: Colors.white,
              child:Text("Số lượng") ,
            )
          ),
          Expanded(
              child: Container(
                height: 100,
                color: Colors.red,
                child:Text("Thêm vào giỏ hàng") ,
              )
          ),
          Expanded(
              child: Container(
                height: 100,
                color: Colors.orange,
                child:Text("Mua ngay") ,
              )
          ),
        ],
      ),
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.search)
          ),
          IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.home_outlined)
          ),
          IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.shopping_cart_checkout_outlined)
          ),
          IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.menu)
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 5,right: 5,top: 0,bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(height: 400.0),
                items: [1,2,3,4,5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.amber
                          ),
                          child: FittedBox(
                              child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQssqDqtb8e2Xu3B44Nxoir1bFp2o4dq_VouQ&s"),
                              fit: BoxFit.fill,
                          )
                      );
                    },
                  );
                }).toList(),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  children: [
                    Text("129.940 đ",style: TextStyle(fontSize: 30,color: Colors.red,fontWeight: FontWeight.w900),),
                    Text("178.000",style: TextStyle(fontSize:20,color: CupertinoColors.systemGrey2,decoration: TextDecoration.lineThrough),),
                    Text("-27%",style: TextStyle(color: Colors.red),)
                  ],
                ),
              ),
              Text("Destination B1 - Grammar And Vocabulary With Answer Key (Tái bản 2024)"),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 10),
                child: Row(
                  children: [
                    Text("(0)"),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text("Đã bán 76"),
                      flex: 2,
                    ),
                    IconButton(
                      onPressed: () {
                        
                      }, 
                      icon: Icon(Icons.favorite_border)
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20,bottom: 20),
                child: Wrap(
                  direction: Axis.vertical,
                  spacing: 20,
                  children: [
                    Text("Thông tin sản phẩm",style: TextStyle(fontWeight: FontWeight.bold),),
                    infor("Mã hàng", "123456789"),
                    infor("Nhà cung cấp", "MC Books"),
                    infor("Tác giả", "Steve"),
                    infor("Người dịch", "Nguyễn Thanh Vân"),
                    infor("Nhà xuất bản", "Hồng Đức"),
                  ],
                ),
              ),
              Text("Đánh giá sản phẩm"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                  ),
                  side: BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  )
                ),
                onPressed: () {
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit,color: Colors.red,),
                      SizedBox(width: 10,),
                      Text("Viết đánh giá",style: TextStyle(color: Colors.red),)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Padding infor(String w1,String w2){
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            child: Text(w1),
            width: 200,
          ),
          SizedBox(
            child: Text(w2),
          )
        ],
      ),
    );
  }
}

