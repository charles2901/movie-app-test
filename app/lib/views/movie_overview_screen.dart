import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../controllers/movie_controller.dart';

import '../widgets/grid_item_movie.dart';

class MovieOverviewScreen extends StatefulWidget {
  @override
  State<MovieOverviewScreen> createState() => _MovieOverviewScreenState();
}

class _MovieOverviewScreenState extends State<MovieOverviewScreen> {
  final _controller = Get.put(MovieController());

  @override
  void initState() {
    _controller.fetchPopularMovie();
    super.initState();
  }

  _buildGridView(movies) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1 / 2.25,
      ),
      itemCount: movies.length,
      itemBuilder: (ctx, idx) => GridItemMovie(
        movies[idx],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDb'),
        actions: [
          Obx(
            () => _controller.page > 1
                ? IconButton(
                    onPressed: () => _controller.previousPage(),
                    icon: const Icon(Icons.arrow_back_ios),
                  )
                : const SizedBox(),
          ),
          IconButton(
            onPressed: () => _controller.nextPage(),
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      body: Column(
        children: [
          Obx(
            () => TextField(
              textAlignVertical: TextAlignVertical.center,
              controller: _controller.searchInput.value,
              decoration: InputDecoration(
                hintText: 'Search by title',
                prefixIcon: const Icon(
                  Icons.search,
                ),
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.close,
                  ),
                  onPressed: () => _controller.clearInput(),
                ),
              ),
              textInputAction: TextInputAction.done,
              onEditingComplete: () => _controller.searchMoviesByTitle(),
              onChanged: (_) => _controller.handleChangeInput(),
            ),
          ),
          Obx(
            () => Expanded(
              child: _controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : _controller.filterMovie.isEmpty
                      ? const Center(
                          child: Text('Could not find movies with that title'),
                        )
                      : _buildGridView(_controller.filterMovie),
            ),
          ),
        ],
      ),
    );
  }
}
