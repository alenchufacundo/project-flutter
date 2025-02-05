class Movie {
  final String title;
  final String posterPath;
  final int id;
  final int voteCount;
  final double voteAverage;

  Movie({
    required this.title,
    required this.posterPath,
    required this.id,
    required this.voteCount,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      posterPath: json['poster_path'],
      id: json['id'],
      voteCount: json['vote_count'],
      voteAverage: json['vote_average'].toDouble(),
    );
  }
}
