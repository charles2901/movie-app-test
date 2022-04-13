import 'package:app/views/full_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/gallery_controller.dart';

class MovieGalleryScreen extends StatefulWidget {
  static const routeName = '/movie-gallery';

  @override
  State<MovieGalleryScreen> createState() => _MovieGalleryScreenState();
}

class _MovieGalleryScreenState extends State<MovieGalleryScreen> {
  final id = int.parse(Get.arguments);

  final GalleryController _controller = GalleryController();

  _buildGridView(items) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1 / 1.8,
      ),
      itemCount: items.length,
      itemBuilder: (ctx, idx) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => FullImageScreen(id, items[idx]),
            ),
          ),
          child: Hero(
            tag: items[idx],
            child: FadeInImage(
              placeholder:
                  const AssetImage('assets/images/movie-placeholder.png'),
              image: NetworkImage(items[idx]),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Gallery'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'BACKDROPS',
              ),
              Tab(
                text: 'POSTERS',
              )
            ],
          ),
        ),
        body: FutureBuilder(
          future: _controller.fetchBackdropsPostersMovie(id),
          builder: ((_, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : TabBarView(
                      children: [
                        _buildGridView(_controller.backdropsUrl),
                        _buildGridView(_controller.postersUrl),
                      ],
                    )),
        ),
      ),
    );
  }
}
