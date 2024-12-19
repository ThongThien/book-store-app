import 'package:book_store/chitietsanpham/category.dart';
import 'package:book_store/model/book.dart';
import 'package:flutter/material.dart';
List<String> listEx=["Sách trong nước","FOREIGN BOOKS","VPP - Dụng cụ học sinh","Đồ chơi","Làm đẹp - Sức khỏe","Hành trang đến trường","Mô hình đồ chơi","Thể thao"];
List<String> dropdown=["Nhân vật -Bài học Kinh doanh","Quản trị - Lãnh đạo","Marketing - Bán hàng","Phân tích kinh tế","Xem tất cả"];
List<String> listBook=[];
class Danhmuc extends StatefulWidget {
  const Danhmuc({super.key});

  @override
  State<Danhmuc> createState() => _DanhmucState();
}

class _DanhmucState extends State<Danhmuc> {
  String gt="";
  int idx=0;
  bool show=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Danh mục sản phẩm",style: TextStyle(color: Colors.white),),
        iconTheme: IconThemeData(
          color: Colors.white
        ),
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder<List<Category_Snapshot>>(
        future: Category_Snapshot.getAll(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          var list=snapshot.data!;
          for (var element in list) {
            if(!listBook.contains(element.category.ten)){
              listBook.add( element.category.ten);
            }
          }

          return Row(
            children: [
              Expanded(
                  flex: 1,
                  child: ListView.separated(

                    itemBuilder: (context, index) {
                      return ListTile(
                        tileColor: idx==index?Colors.orange:Colors.white,
                        title: Icon(Icons.access_time_filled),
                        subtitle: Text(listEx[index],textAlign: TextAlign.center,),
                        onTap: () {
                          setState(() {
                            idx=index;
                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) => Divider(height: 0,thickness: 1,),
                    itemCount: listEx.length,

                  )
              ),
              SizedBox(width: 10,),
              Expanded(
                  flex: 2,
                  child:Column(
                    children: [
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      padding: WidgetStatePropertyAll(EdgeInsets.only(left: 15,right:10,top:15,bottom: 15)),
                                      alignment: Alignment.centerLeft,
                                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ))
                                  ),
                                  onPressed: () {

                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Tất cả"),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              show=!show;
                                            });
                                          },
                                          icon: show==true?Icon(Icons.keyboard_arrow_up):Icon(Icons.keyboard_arrow_down)
                                      )
                                    ],
                                  )
                              ),
                            ),
                          ],
                        ),
                      ),
                      if(show)...[
                        Divider(height: 0,),
                        ListView.separated(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ElevatedButton(
                                  style: ButtonStyle(
                                      padding: WidgetStatePropertyAll(EdgeInsets.only(left: 15,right:10,top:20,bottom: 20)),
                                      alignment: Alignment.centerLeft,
                                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,))
                                  ),
                                  onPressed: () {

                                  },
                                  child: Text("${listBook[index]}")
                              );
                            },
                            separatorBuilder: (context, index) => Divider(height: 0,),
                            itemCount: listBook.length
                        )
                      ],

                      // Container(
                      //   color: Colors.white,
                      //   margin: EdgeInsets.only(top: 10),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         child: ElevatedButton(
                      //             style: ButtonStyle(
                      //                 padding: WidgetStatePropertyAll(EdgeInsets.only(left: 15,right:10,top:15,bottom: 15)),
                      //                 alignment: Alignment.centerLeft,
                      //                 shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      //                   borderRadius: BorderRadius.zero,
                      //                 ))
                      //             ),
                      //             onPressed: () {
                      //
                      //             },
                      //             child: Row(
                      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Text("Tất cả"),
                      //                 IconButton(
                      //                     onPressed: () {
                      //                       setState(() {
                      //                         show=!show;
                      //                       });
                      //                     },
                      //                     icon: show==true?Icon(Icons.keyboard_arrow_up):Icon(Icons.keyboard_arrow_down)
                      //                 )
                      //               ],
                      //             )
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // if(show)...[
                      //   Divider(height: 0,),
                      //   ListView.separated(
                      //       shrinkWrap: true,
                      //       itemBuilder: (context, index) {
                      //         return ElevatedButton(
                      //             style: ButtonStyle(
                      //                 padding: WidgetStatePropertyAll(EdgeInsets.only(left: 15,right:10,top:20,bottom: 20)),
                      //                 alignment: Alignment.centerLeft,
                      //                 shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      //                   borderRadius: BorderRadius.zero,))
                      //             ),
                      //             onPressed: () {
                      //
                      //             },
                      //             child: Text(dropdown[index])
                      //         );
                      //       },
                      //       separatorBuilder: (context, index) => Divider(height: 0,),
                      //       itemCount: dropdown.length
                      //   )
                      // ]
                    ],
                  )
              )
            ],
          );
        },
      ),
    );
  }
}
