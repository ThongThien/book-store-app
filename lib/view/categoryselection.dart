import 'package:book_store/controller/category_controller.dart';
import 'package:book_store/model/book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorySelection extends StatefulWidget {
  const CategorySelection({super.key});

  @override
  State<CategorySelection> createState() => _CategorySelectionState();
}

class _CategorySelectionState extends State<CategorySelection> {
  CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    final id = (ModalRoute.of(context)!.settings.arguments) as int;
    return Scaffold(
        appBar: AppBar(
            title: const Text("Sách thuộc thể loại được chọn"),
        ),
        body: FutureBuilder<void>(
          future: controller.getCategory(id),
          builder: (context, snapshot) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.6,
              ),
              itemCount: controller.selectedCategory.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'chitiet',
                        arguments: Book(
                            id: controller.selectedCategory[index]['id'],
                            nameBook: controller.selectedCategory[index]
                                ['nameBook'],
                            publicationDate: DateTime.parse(controller
                                .selectedCategory[index]['publicationDate']),
                            author: controller.selectedCategory[index]
                                ['author'],
                            publisher: controller.selectedCategory[index]
                                ['publisher'],
                            categoryID: controller.selectedCategory[index]
                                ['categoryID'],
                            price: controller.selectedCategory[index]['price'],
                            description: controller.selectedCategory[index]
                                ['description'],
                            stockQuantity: controller.selectedCategory[index]
                                ['stock_quantity'],
                            image: controller.selectedCategory[index]['image'],
                            language: controller.selectedCategory[index]
                                ['language']));
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Image.network(
                            controller.selectedCategory[index]['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            controller.selectedCategory[index]['nameBook'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            controller.selectedCategory[index]['author'],
                            style: const TextStyle(fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "${controller.selectedCategory[index]['price']}",
                            style: const TextStyle(fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
