import '../services/movie_service.dart';

class GalleryController {
  List<String> backdropsUrl = [];
  List<String> postersUrl = [];

  Future<void> fetchBackdropsPostersMovie(int id) async {
    try {
      final response = await MovieService.getPostersAndBackdropsMovie(id);

      response['backdrops'].forEach((el) => backdropsUrl
          .add('http://image.tmdb.org/t/p/w780/${el['file_path']}'));
      response['posters'].forEach((el) =>
          postersUrl.add('http://image.tmdb.org/t/p/w500/${el['file_path']}'));
    } catch (error) {
      rethrow;
    }
  }
}
