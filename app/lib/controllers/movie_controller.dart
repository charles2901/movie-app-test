import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/movie_service.dart';

import '../models/movie.dart';

class MovieController extends GetxController {
  var page = 1.obs;
  var isLoading = false.obs;
  var isErrorMessage = ''.obs;
  final _movies = [].obs;
  final _filterMovies = [].obs;
  final searchInput = TextEditingController().obs;

  List<dynamic> get filterMovie {
    return [..._filterMovies];
  }

  void clearInput() {
    if (searchInput.value.text.isEmpty) return;
    searchInput.value.clear();
    fetchPopularMovie();
  }

  void handleChangeInput() {
    if (searchInput.value.text.isEmpty) {
      return;
    }

    _filterMovies.value = [..._movies]
        .where((movie) => movie.title
            .toLowerCase()
            .contains(searchInput.value.text.toLowerCase()))
        .toList();
  }

  Future<void> fetchPopularMovie() async {
    isLoading.value = true;
    try {
      final movies = [];
      final response = await MovieService.getPopularMovie(page.value);

      response['results'].forEach(
        (movie) => movies.add(
          Movie(
            id: movie['id'].toString(),
            title: movie['title'],
            year: movie['release_date'].split('-')[0],
            posterPath: movie['poster_path'] == null
                ? null
                : 'http://image.tmdb.org/t/p/w500/${movie["poster_path"]}',
            backdropPath:
                'http://image.tmdb.org/t/p/w780/${movie["backdrop_path"]}',
          ),
        ),
      );
      _movies.assignAll(movies);
      _filterMovies.assignAll(movies);

      isLoading.value = false;
    } catch (errors) {
      isErrorMessage.value = errors.toString();
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> searchMoviesByTitle() async {
    isLoading.value = true;

    if (searchInput.value.text.isEmpty) {
      fetchPopularMovie();
      return;
    }

    try {
      final movies = [];
      final response =
          await MovieService.searchmovieByKeyword(searchInput.value.text);

      response['results'].forEach(
        (movie) => movies.add(
          Movie(
            id: movie['id'].toString(),
            title: movie['title'],
            year: movie['release_date'] == null
                ? 'Soon'
                : movie['release_date'].split('-')[0],
            posterPath: movie['poster_path'] == null
                ? null
                : 'http://image.tmdb.org/t/p/w500/${movie["poster_path"]}',
            backdropPath:
                'http://image.tmdb.org/t/p/w780/${movie["backdrop_path"]}',
          ),
        ),
      );
      _movies.assignAll(movies);
      _filterMovies.assignAll(movies);
    } catch (errors) {
      isErrorMessage.value = errors.toString();
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> nextPage() async {
    searchInput.value.text = '';
    page++;
    try {
      await fetchPopularMovie();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> previousPage() async {
    if (page.value == 1) return;
    searchInput.value.text = '';
    page--;

    try {
      await fetchPopularMovie();
    } catch (error) {
      rethrow;
    }
  }
}
