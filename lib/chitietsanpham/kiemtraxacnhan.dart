import 'package:book_store/controller/book_controller.dart';
import 'package:book_store/model/book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
List<dynamic> listBook=[];
class KiemTraXacNhan extends StatefulWidget {
  KiemTraXacNhan({super.key});

  @override
  State<KiemTraXacNhan> createState() => _KiemTraXacNhanState();
}

class _KiemTraXacNhanState extends State<KiemTraXacNhan> {
  final BookController _controller = BookController();

  late Future<List<Book>> _bookFuture;

  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchBooks();
  }

  void _fetchBooks() {
    setState(() {
      if (_searchQuery.isEmpty) {
        _bookFuture = _controller.Book_Snapshot(); // Lấy tất cả sách
      } else {
        _bookFuture = _controller.searchBooks(_searchQuery); // Tìm kiếm sách
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<int> data=Get.arguments;
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
        child: FutureBuilder<List<Book>>(
          future: _bookFuture,
          builder:
              (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No books found."));
                }
                final books = snapshot.data!;
                books.forEach((element) {
                  if(data.contains(element.id)){
                    listBook.add(element);
                  }
                },);
                return Container(
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
                          itemCount: listBook.length,
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
                                            child: Image.network("${listBook[index].image}")
                                        ),
                                        SizedBox(width: 20,),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("${listBook[index].nameBook}",style: TextStyle(fontSize: 20),),

                                              SizedBox(height: 20,),
                                              Row(
                                                children: [
                                                  Text("${listBook[index].price} \$",style: TextStyle(color: Colors.orange,fontSize: 20),),
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
                );
              }
        ),
      ),
    );
  }
}
