import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FullImageScreen extends StatelessWidget {
  final int id;
  final String path;

  const FullImageScreen(this.id, this.path);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Hero(
          tag: path,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.network(
              path,
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        onTap: () => Get.back(),
      ),
    );
  }
}
