import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/movie_detail_screen.dart';

import '../models/movie.dart';

class GridItemMovie extends StatelessWidget {
  final Movie movie;

  const GridItemMovie(this.movie);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: movie.posterPath != null
                ? GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      Get.toNamed(
                        MovieDetailScreen.routeName,
                        arguments: movie,
                      );
                    },
                    child: Hero(
                      tag: movie.id,
                      child: FadeInImage(
                        placeholder: const AssetImage(
                            'assets/images/movie-placeholder.png'),
                        image: NetworkImage(movie.posterPath.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : const Center(
                    child: Text('Poster not found'),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 5,
            ),
            child: Container(
              constraints: const BoxConstraints(minHeight: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.titleSmall,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    movie.year.isEmpty ? 'TBD' : movie.year,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
