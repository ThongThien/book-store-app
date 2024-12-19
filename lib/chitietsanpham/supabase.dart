import 'package:book_store/chitietsanpham/kiemtraxacnhan.dart';
import 'package:book_store/chitietsanpham/thongbaothanhtoanthanhcong.dart';
import 'package:book_store/model/book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
List<String> listTheloai=["quang"];
class SupabaseApp extends StatelessWidget {
  const SupabaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:SupbaseHome(),
    );
  }
}

class SupbaseHome extends StatelessWidget {
  const SupbaseHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Supabase App"),
      ),
      body: FutureBuilder<List<Book_Snapshot>>(
        future: Book_Snapshot.getAll(),
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
          list.forEach((element) {
            if(!listTheloai.contains(element.book.ten )){
              listTheloai.add(element.book.ten);
            }
          },);

          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children:
                listTheloai.map(
                  (e) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(Thongbaothanhtoanthanhcong());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                            title: Text("${e} ${list.length}",textAlign: TextAlign.center,),
                            subtitle: Divider(),
                        ),
                      ),
                    );
                  },
                ).toList()
            ),
            // child: GridView.extent(
            //   maxCrossAxisExtent: 200,
            //   mainAxisSpacing: 5,
            //   crossAxisSpacing: 5,
            //   childAspectRatio: 0.75,
            //   children: listTheloai.map(
            //         (e) {
            //             return GestureDetector(
            //               onTap: () {
            //                 // Get.to(KiemTraXacNhan(),arguments: [e.book]);
            //               },
            //               child: Column(children: [
            //                 Text(e)
            //                 // Text("${e.book.id}"),
            //                 // Text("${e.book.ten}"),
            //                 // Text("${e.book.gia}"),
            //                 // Text("${e.book.theloai}"),
            //                 // SizedBox(
            //                 //     width: 100,
            //                 //     height: 100,
            //                 //     child: Image.network("${e.book.anh}",fit: BoxFit.fill,)
            //                 // ),
            //               ],
            //               ),
            //             );
            //     },
            //   ).toList(),
            // ),
          );
        },
      ),
    );
  }
}
