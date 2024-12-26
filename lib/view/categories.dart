import 'package:book_store/controller/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<String> listEx = [
  "Sách trong nước",
  "FOREIGN BOOKS",
  "VPP - Dụng cụ học sinh",
  "Đồ chơi",
  "Làm đẹp - Sức khỏe",
  "Hành trang đến trường",
  "Mô hình đồ chơi",
  "Thể thao"
];
List<String> dropdown = [
  "Nhân vật -Bài học Kinh doanh",
  "Quản trị - Lãnh đạo",
  "Marketing - Bán hàng",
  "Phân tích kinh tế",
  "Xem tất cả"
];

class Danhmuc extends StatefulWidget {
  const Danhmuc({super.key});

  @override
  State<Danhmuc> createState() => _DanhmucState();
}

class _DanhmucState extends State<Danhmuc> {
  CategoryController controller = Get.put(CategoryController());
  String gt = "";
  int idx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Danh mục sản phẩm",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.orange,
      ),
      body: FutureBuilder<void>(
        future: controller.getData(),
        builder: (context, snapshot) {
          return Row(
            children: [
              Expanded(
                  flex: 1,
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        tileColor: idx == index ? Colors.orange : Colors.white,
                        title: const Icon(Icons.access_time_filled),
                        subtitle: Text(
                          listEx[index],
                          textAlign: TextAlign.center,
                        ),
                        onTap: () {
                          setState(() {
                            idx = index;
                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      height: 0,
                      thickness: 1,
                    ),
                    itemCount: listEx.length,
                  )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.white,
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: const ButtonStyle(
                                      padding: WidgetStatePropertyAll(
                                          EdgeInsets.only(
                                              left: 15,
                                              right: 10,
                                              top: 15,
                                              bottom: 15)),
                                      alignment: Alignment.centerLeft,
                                      shape: WidgetStatePropertyAll(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.zero,
                                      ))),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Tất cả"),
                                      GetBuilder(
                                        id: 'show',
                                        init: controller,
                                        builder: (controller) {
                                          return IconButton(
                                              onPressed: () {
                                                controller.setShow();
                                              },
                                              icon: controller.show == true
                                                  ? const Icon(
                                                      Icons.keyboard_arrow_up)
                                                  : const Icon(Icons
                                                      .keyboard_arrow_down));
                                        },
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                      const Divider(height: 0),
                      GetBuilder(
                        init: controller,
                        id: 'show',
                        builder: (controller) {
                          if (controller.show == true) {
                            return ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ElevatedButton(
                                  style: ButtonStyle(
                                    padding: WidgetStateProperty.all(
                                        const EdgeInsets.only(
                                            left: 15,
                                            right: 10,
                                            top: 20,
                                            bottom: 20)),
                                    alignment: Alignment.centerLeft,
                                    shape: WidgetStateProperty.all(
                                        const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    )),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, 'categoryselection',
                                        arguments: controller
                                            .categoryList[index]['id']);
                                  },
                                  child: Text(
                                      "${controller.categoryList[index]['name']}"),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const Divider(height: 0),
                              itemCount: controller.categoryList.length,
                            );
                          } else {
                            return Container();
                          }
                        },
                      )
                    ],
                  ))
            ],
          );
        },
      ),
    );
  }
}
