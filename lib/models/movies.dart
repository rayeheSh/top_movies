// To parse this JSON data, do
//
//     final movieList = movieListFromJson(jsonString);

import 'dart:convert';
import 'package:top_movies/models/movie.dart';

MovieList movieListFromJson(String str) => MovieList.fromJson(json.decode(str));

String movieListToJson(MovieList data) => json.encode(data.toJson());

class MovieList {
  final List<Movie> data;
  final Metadata metadata;

  MovieList({required this.data, required this.metadata});

  factory MovieList.fromJson(Map<String, dynamic> json) => MovieList(
    data: List<Movie>.from(json["data"].map((x) => Movie.fromJson(x))),
    metadata: Metadata.fromJson(json["metadata"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "metadata": metadata.toJson(),
  };
}

class Metadata {
  final String currentPage;
  final int perPage;
  final int pageCount;
  final int totalCount;

  Metadata({
    required this.currentPage,
    required this.perPage,
    required this.pageCount,
    required this.totalCount,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    currentPage: json["current_page"],
    perPage: json["per_page"],
    pageCount: json["page_count"],
    totalCount: json["total_count"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "per_page": perPage,
    "page_count": pageCount,
    "total_count": totalCount,
  };
}
