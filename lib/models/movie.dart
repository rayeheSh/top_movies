class Movie {
  final int id;
  final String title;
  final String poster;
  final String year;
  final String country;
  final String imdbRating;
  final List<String> genres;
  final List<String> images;

  Movie({
    required this.id,
    required this.title,
    required this.poster,
    required this.year,
    required this.country,
    required this.imdbRating,
    required this.genres,
    required this.images,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    id: json["id"],
    title: json["title"],
    poster: json["poster"],
    year: json["year"],
    country: json["country"],
    imdbRating: json["imdb_rating"],
    genres: List<String>.from(json["genres"].map((x) => x)),
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "poster": poster,
    "year": year,
    "country": country,
    "imdb_rating": imdbRating,
    "genres": List<dynamic>.from(genres.map((x) => x)),
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}
