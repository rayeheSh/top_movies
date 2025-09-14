// To parse this JSON data, do
//
//     final genreList = genreListFromJson(jsonString);
import 'dart:convert';

List<GenreList> genreListFromJson(String str) =>
    List<GenreList>.from(json.decode(str).map((x) => GenreList.fromJson(x)));

String genreListToJson(List<GenreList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GenreList {
  final int id;
  final String name;

  GenreList({required this.id, required this.name});

  factory GenreList.fromJson(Map<String, dynamic> json) =>
      GenreList(id: json["id"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}
