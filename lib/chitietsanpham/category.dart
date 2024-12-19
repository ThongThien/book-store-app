import 'package:supabase_flutter/supabase_flutter.dart';

class Category{
  int id;
  String ten;
  Category({
    required this.id,
    required this.ten,
  });
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      ten: map['name'] as String,
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'name':ten,
    };
  }


}

class Category_Snapshot{
  Category category;
  Category_Snapshot({required this.category});
  Future<void> delete () async{
    final supabase=Supabase.instance.client;
    await supabase.from("category").delete().eq("id",category.id);
  }
  Future<void> update(Category nFruit)async{
    final supabase=Supabase.instance.client;
    await supabase.from("category").update(nFruit.toMap()).eq("id",category.id);
  }
  static Future<void> insert(Category nfruit)async{
    final supabase=Supabase.instance.client;
    await supabase.from("category").insert(nfruit.toMap());
  }
  static Future<List<Category_Snapshot>> getAll()async{
    final supabase=Supabase.instance.client;
    var data=await supabase.from("category").select();
    return data.map((e) => Category_Snapshot(category: Category.fromMap(e)),).toList();
  }
}

