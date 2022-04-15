import 'package:app/controllers/detail_controller.dart';
import 'package:flutter/material.dart';

import '../models/movie.dart';

class ContentDetail extends StatelessWidget {
  final MovieDetailController controller;
  final Movie movie;

  const ContentDetail(this.controller, this.movie);

  _buildRowTwo(IconData icon, String text, BuildContext ctx) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 35),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                text,
                style: Theme.of(ctx).textTheme.bodySmall,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
        const SizedBox(height: 20)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.fetchDetailMovie(int.parse(movie.id)),
      builder: (_, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildRowTwo(
                                Icons.calendar_month,
                                movie.year.isEmpty ? 'TBD..' : movie.year,
                                context),
                            _buildRowTwo(
                                Icons.contact_support,
                                controller.movie!.website.toString().isEmpty
                                    ? 'Coming soon..'
                                    : controller.movie!.website.toString(),
                                context),
                            _buildRowTwo(
                                Icons.home,
                                controller.movie!.productionCompanies!.isEmpty
                                    ? 'Updated soon...'
                                    : controller.movie!.productionCompanies!
                                        .join(', '),
                                context),
                            Text(
                              'TAGLINE',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                controller.movie!.tagline.toString().isEmpty
                                    ? 'To be updated...'
                                    : '"${controller.movie!.tagline.toString()}"',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontStyle: FontStyle.italic,
                                    ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
    );
  }
}
