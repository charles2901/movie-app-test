import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/detail_controller.dart';

import '../views/movie_gallery_screen.dart';

import '../models/movie.dart';

import '../widgets/content_detail.dart';

class MovieDetailScreen extends StatelessWidget {
  static const routeName = '/movie-detail';

  final Movie movie = Get.arguments;
  final _controller = Get.put(MovieDetailController());

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    const radiusContainer = 30.0;

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
            top: MediaQuery.of(context).viewPadding.top + 12,
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
                  height: deviceSize.height * 0.55,
                  width: deviceSize.width - 30,
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
            bottom: deviceSize.height * 0.55 - radiusContainer,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(radiusContainer),
              ),
              child: IconButton(
                icon: const Icon(Icons.photo_library_outlined),
                color: Colors.white,
                onPressed: () => Get.toNamed(
                  MovieGalleryScreen.routeName,
                  arguments: movie.id,
                ),
                iconSize: 25,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
