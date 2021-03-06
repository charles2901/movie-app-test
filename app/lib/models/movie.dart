class Movie {
  final String id;
  final String title;
  final String year;
  final String? posterPath;
  final String? backdropPath;
  final String? tagline;
  final String? website;
  final List<dynamic>? productionCompanies;

  const Movie({
    required this.id,
    required this.title,
    required this.year,
    required this.posterPath,
    required this.backdropPath,
    this.tagline,
    this.website,
    this.productionCompanies,
  });
}
