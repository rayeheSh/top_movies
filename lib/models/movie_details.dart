// To parse this JSON data, do
//
//     final movieDetails = movieDetailsFromJson(jsonString);

import 'dart:convert';

MovieDetails movieDetailsFromJson(String str) =>
    MovieDetails.fromJson(json.decode(str));

String movieDetailsToJson(MovieDetails data) => json.encode(data.toJson());

class MovieDetails {
  final int id;
  final String title;
  final String poster;
  final String year;
  final String rated;
  final String released;
  final String runtime;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String country;
  final String awards;
  final String metascore;
  final String imdbRating;
  final String imdbVotes;
  final String imdbId;
  final String type;
  final List<String> genres;
  final List<String> images;

  MovieDetails({
    required this.id,
    required this.title,
    required this.poster,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.country,
    required this.awards,
    required this.metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.imdbId,
    required this.type,
    required this.genres,
    required this.images,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) => MovieDetails(
    id: json["id"],
    title: json["title"],
    poster: json["poster"],
    year: json["year"],
    rated: json["rated"],
    released: json["released"],
    runtime: json["runtime"],
    director: json["director"],
    writer: json["writer"],
    actors: json["actors"],
    plot: json["plot"],
    country: json["country"],
    awards: json["awards"],
    metascore: json["metascore"],
    imdbRating: json["imdb_rating"],
    imdbVotes: json["imdb_votes"],
    imdbId: json["imdb_id"],
    type: json["type"],
    genres: List<String>.from(json["genres"].map((x) => x)),
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "poster": poster,
    "year": year,
    "rated": rated,
    "released": released,
    "runtime": runtime,
    "director": director,
    "writer": writer,
    "actors": actors,
    "plot": plot,
    "country": country,
    "awards": awards,
    "metascore": metascore,
    "imdb_rating": imdbRating,
    "imdb_votes": imdbVotes,
    "imdb_id": imdbId,
    "type": type,
    "genres": List<dynamic>.from(genres.map((x) => x)),
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}
