import 'package:flutter/material.dart';
import 'package:top_movies/models/genres.dart';
import 'package:top_movies/models/movie.dart';
import 'package:top_movies/services/api_service.dart';

class HomeProvider extends ChangeNotifier {
  ApiService apiService = ApiService();
  List<Movie> movieList = [];
  List<GenreList> genreList = [];
  List<Movie> filteredMovies = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String selectedFilter = 'All Categories';

  Future<void> loadMovies() async {
    setLoading(true);
    try {
      movieList = await apiService.getMovies();
      filteredMovies = movieList;
      genreList = await apiService.getGenres();
    } catch (e) {
      // Handle potential errors here
      print('Error loading movies: $e');
    } finally {
      setLoading(false); // Turn off loading, regardless of success or failure
    }
    notifyListeners();
  }

  void changeSelected(String newFilter) {
    selectedFilter = newFilter;
    if (selectedFilter == 'All Categories') {
      filteredMovies = movieList;
    } else {
      filteredMovies = movieList
          .where((movie) => movie.genres.contains(selectedFilter))
          .toList();
    }

    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> refreshData() async {
    await loadMovies();
  }
}
