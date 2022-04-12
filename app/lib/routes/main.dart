import 'package:get/get.dart';

import '../views/movie_detail_screen.dart';
import '../views/movie_overview_screen.dart';

var routes = [
  GetPage(
    name: '/',
    page: () => MovieOverviewScreen(),
  ),
  GetPage(
    name: MovieDetailScreen.routeName,
    page: () => MovieDetailScreen(),
  ),
];
