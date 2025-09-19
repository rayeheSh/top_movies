import 'package:dio/dio.dart';
import 'package:top_movies/constants/constants.dart';
import 'package:top_movies/models/genres.dart';
import 'package:top_movies/models/movie.dart';
import 'package:top_movies/models/movie_details.dart';

class ApiService {
  Dio dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<List<Movie>> getMovies() async {
    try {
      Response response = await dio.get('/movies');
      List<dynamic> data = response.data['data'];

      return data.map((json) => Movie.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load list of movies: $e');
    }
  }

  Future<MovieDetails> getMovieDetails(int id) async {
    try {
      Response response = await dio.get('/movies/$id');
      return MovieDetails.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load movie details: $e');
    }
  }

  Future<List<GenreList>> getGenres() async {
    try {
      Response response = await dio.get('/genres');
      List<dynamic> data = response.data;
      return data.map((json) => GenreList.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load list of genres: $e');
    }
  }

  Future<List<Movie>> searchMovies(String title) async {
    try {
      Response respons = await dio.get('movies?q=$title');
      List<dynamic> data = respons.data['data'];

      return data.map((json) => Movie.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load list of movies: $e');
    }
  }
}
