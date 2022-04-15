import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

import './routes/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: routes,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        primarySwatch: Colors.deepPurple,
        textTheme: const TextTheme(
          titleSmall: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 32,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
