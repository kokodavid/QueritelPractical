import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:queritel/bindings/home_binding.dart';
import 'package:queritel/pages/pets_screen.dart';
import 'package:queritel/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomeBinding(),
      title: 'Pet App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home:  SplashScreen(),
    );
  }
}

