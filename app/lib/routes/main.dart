import 'package:get/get.dart';

import '../views/splash_screen.dart';
import '../views/movie_detail_screen.dart';
import '../views/movie_overview_screen.dart';
import '../views/movie_gallery_screen.dart';

var routes = [
  GetPage(
    name: '/',
    page: () => SplashScreen(),
  ),
  GetPage(
    name: MovieOverviewScreen.routeName,
    page: () => MovieOverviewScreen(),
    transition: Transition.fadeIn,
    transitionDuration: const Duration(milliseconds: 500),
  ),
  GetPage(
    name: MovieDetailScreen.routeName,
    page: () => MovieDetailScreen(),
  ),
  GetPage(
    name: MovieGalleryScreen.routeName,
    page: () => MovieGalleryScreen(),
  ),
];
