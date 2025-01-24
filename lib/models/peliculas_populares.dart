class Movie {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      adult: json['adult'] ?? false, // Manejo de valor nulo
      backdropPath: json['backdrop_path'] ?? '', // Manejo de valor nulo
      genreIds: List<int>.from(json['genre_ids'] ?? []), // Manejo de valor nulo
      id: json['id'] ?? 0, // Manejo de valor nulo
      originalLanguage: json['original_language'] ?? '', // Manejo de valor nulo
      originalTitle: json['original_title'] ?? '', // Manejo de valor nulo
      overview: json['overview'] ?? '', // Manejo de valor nulo
      popularity:
          (json['popularity'] ?? 0.0).toDouble(), // Manejo de valor nulo
      posterPath: json['poster_path'] ?? '', // Manejo de valor nulo
      releaseDate: json['release_date'] ?? '', // Manejo de valor nulo
      title: json['title'] ?? '', // Manejo de valor nulo
      video: json['video'] ?? false, // Manejo de valor nulo
      voteAverage:
          (json['vote_average'] ?? 0.0).toDouble(), // Manejo de valor nulo
      voteCount: json['vote_count'] ?? 0, // Manejo de valor nulo
    );
  }
}
