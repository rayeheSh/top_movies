import 'dart:async';
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
  String? _errorMessage;

  // New Search properties
  List<Movie> _searchResults = [];
  bool _isSearching = false; // To determine if the user is in search mode
  String? _searchQuery;
  Timer? _debounce;
  String? get errorMessage => _errorMessage;

  List<Movie> get searchResults => _searchResults;
  bool get isSearching => _isSearching;
  String? get searchQuery => _searchQuery;

  // The updated searchMovies method
  void searchMovies(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _searchQuery = query;

    if (query.isEmpty) {
      _isSearching = false;
      _searchResults = [];
      _errorMessage = '';
      notifyListeners();
      return;
    }

    _isSearching = true; // Enter search mode
    notifyListeners();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      _isLoading = true;
      _errorMessage = '';
      notifyListeners();

      try {
        //_searchResults = await apiService.searchMovies(query);
        _searchResults = movieList
            .where((element) => element.title.contains(_searchQuery!))
            .toList();
        _errorMessage = ''; // Clear any previous error
      } catch (e) {
        _errorMessage = 'Failed to load movies. Please try again.';
        _searchResults = [];
        print('Error loading movies: $e');
      } finally {
        _isLoading = false;
        notifyListeners();
      }
    });
  }

  // Other methods like refreshData, changeSelected..

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
