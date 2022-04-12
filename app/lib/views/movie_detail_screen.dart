import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

import '../models/movie.dart';

import '../widgets/content_detail.dart';

class MovieDetailScreen extends StatelessWidget {
  static const routeName = '/movie-detail';

  final Movie movie = Get.arguments;
  final _controller = Get.put(MovieDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: movie.id,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.network(
                movie.posterPath.toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 12,
            top: 25,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(25),
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () => Get.back(),
                iconSize: 30,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  width: MediaQuery.of(context).size.width - 30,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(25, 35, 25, 0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: ContentDetail(_controller, movie),
                ),
              ],
            ),
          ),
          Positioned(
            right: 40,
            bottom: MediaQuery.of(context).size.height * 0.55 - 25,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: IconButton(
                icon: const Icon(Icons.photo_library_outlined),
                color: Colors.white,
                onPressed: () => Get.back(),
                iconSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
