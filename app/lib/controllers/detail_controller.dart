import '../services/movie_service.dart';

import '../models/movie.dart';

class MovieDetailController {
  Movie? movie;

  Future<void> fetchDetailMovie(int id) async {
    try {
      final response = await MovieService.getMovieDetail(id);
      movie = Movie(
        id: response['id'].toString(),
        title: response['title'],
        year: response['release_date'].split('-')[0],
        posterPath: response['poster_path'] == null
            ? null
            : 'http://image.tmdb.org/t/p/w500/${response["poster_path"]}',
        backdropPath:
            'http://image.tmdb.org/t/p/w780/${response["backdrop_path"]}',
        website: response['homepage'],
        tagline: response['tagline'],
        productionCompanies: response['production_companies']
            .map((company) => company['name'])
            .toList(),
      );
    } catch (error) {
      rethrow;
    }
  }
}
