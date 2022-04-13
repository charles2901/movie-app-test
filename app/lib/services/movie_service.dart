import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class MovieService {
  static const apiKey = '7d200361aec3960ee41bf91bdd301fa3';
  static const baseUrl = 'https://api.themoviedb.org/3';

  static Future getPopularMovie(int page) async {
    final url = Uri.parse(
        '$baseUrl/movie/popular?api_key=$apiKey&language=en-US&page=$page');

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw HttpException('Could not fetch movie. Please try again later.');
    }

    return json.decode(response.body);
  }

  static Future getMovieDetail(int id) async {
    print(id);
    final url = Uri.parse('$baseUrl/movie/$id?api_key=$apiKey&language=en-US');

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw HttpException(
          'Could not fetch movie detail. Please try again later.');
    }

    return json.decode(response.body);
  }

  static Future searchmovieByKeyword(String keyword) async {
    final formatKeyword = keyword.split(' ').join('%20');
    final url = Uri.parse(
        '$baseUrl/search/movie?api_key=$apiKey&language=en-US&query=$formatKeyword');

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw HttpException('Something went erorr. Please try again later');
    }

    return json.decode(response.body);
  }

  static Future getPostersAndBackdropsMovie(int id) async {
    final url = Uri.parse('$baseUrl/movie/$id/images?api_key=$apiKey');

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw HttpException('Something went erorr. Please try again later');
    }

    return json.decode(response.body);
  }
}
