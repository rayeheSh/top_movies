class GenreMovie {
  final int id;
  final String title;
  final String poster;
  final List<String> genres;
  final List<String> images;

  GenreMovie({
    required this.id,
    required this.title,
    required this.poster,
    required this.genres,
    required this.images,
  });

  factory GenreMovie.fromJson(Map<String, dynamic> json) => GenreMovie(
    id: json["id"],
    title: json["title"],
    poster: json["poster"],
    genres: List<String>.from(json["genres"].map((x) => x)),
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "poster": poster,
    "genres": List<dynamic>.from(genres.map((x) => x)),
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}
