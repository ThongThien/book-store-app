import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CategoryController extends GetxController {
  bool show = false;
  List<Map<String, dynamic>> selectedCategory = [];
  List<Map<String, dynamic>> categoryList = [];

  static CategoryController get categoryController =>
      Get.find<CategoryController>();

  Future<void> getData() async {
    if (categoryList.isEmpty) {
      final supabase = Supabase.instance.client;
      await supabase.from("category").select().then(
        (value) {
          for (var i in value) {
            categoryList.add(i);
          }
        },
      );
    }
  }

  void setShow() {
    show = !show;
    update(['show']);
  }

  Future<void> getCategory(int id) async {
    final supabase = Supabase.instance.client;
    await supabase.from("book").select().eq('categoryID', id).then(
      (value) {
        selectedCategory = [];
        for (var i in value) {
          selectedCategory.add(i);
        }
      },
    );
  }
}
