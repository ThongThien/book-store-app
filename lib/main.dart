import 'package:book_store/view/home.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'view/login.dart';
import 'package:provider/provider.dart';
import 'provider/user_provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://fbsdpcrhczcwxslxautx.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZic2RwY3JoY3pjd3hzbHhhdXR4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM4ODE0NTEsImV4cCI6MjA0OTQ1NzQ1MX0.WYzHb2UW6Jl99B9GRCmn8sFc5xmaJd52uN54QdtOdtY',
  );

  runApp(
    MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider()),
    ],
    child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Book Store',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
