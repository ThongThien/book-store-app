import 'package:book_store/view/confirmationchecking.dart';
import 'package:book_store/view/details.dart';
import 'package:book_store/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'controller/user_controller.dart';
import 'view/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://fbsdpcrhczcwxslxautx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZic2RwY3JoY3pjd3hzbHhhdXR4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM4ODE0NTEsImV4cCI6MjA0OTQ1NzQ1MX0.WYzHb2UW6Jl99B9GRCmn8sFc5xmaJd52uN54QdtOdtY',
  );

  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(UserController()); // Đảm bảo UserController được khởi tạo
      }),
      debugShowCheckedModeBanner: false,
      title: 'Book Store',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
      routes: {
        'chitiet':(context)=>Detail(),
        'kiemtraxacnhan':(context)=>ConfirmationCheck(),
        '/home':(context)=>HomePage()
      },
    );
  }
}
