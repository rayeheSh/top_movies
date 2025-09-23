import 'package:flutter/material.dart';
import 'package:top_movies/models/movie_details.dart';
import 'package:top_movies/services/api_service.dart';

class DetailProvider extends ChangeNotifier {
  ApiService apiService = ApiService();
  MovieDetails? movieDetails;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadDetails(int id) async {
    setLoading(true);

    try {
      movieDetails = await apiService.getMovieDetails(id);
    } catch (e) {
      print('Error loading data: $e');
      /* ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error in loading details: $e'))); */
    } finally {
      setLoading(false);
    }
    notifyListeners();
  }

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> refreshData(int id) async {
    await loadDetails(id);
  }
}
