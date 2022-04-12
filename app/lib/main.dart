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
        ),
        primarySwatch: Colors.deepPurple,
        textTheme: const TextTheme(
          titleSmall: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 17,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
