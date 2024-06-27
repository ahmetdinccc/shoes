import 'package:flutter/material.dart';
import 'package:shoes/Theme/dark_theme.dart';
import 'package:shoes/Theme/light_theme.dart';
import 'package:shoes/data/product_service.dart';
import 'package:shoes/pages/home.dart';

void main() {
    ProductService.getALL();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body:const Home()));
  }
}
