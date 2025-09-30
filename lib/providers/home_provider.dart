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
  String? _searchQuery;
  String? get searchQuery => _searchQuery;
  Timer? _debounce;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  List<Movie> _searchResults = [];
  List<Movie> get searchResults => _searchResults;
  bool _isSearching = false;
  bool get isSearching => _isSearching;

  List<Movie> _previousSearchResults = [];
  String? get previousSearchQuery => _previousSearchQuery;
  String? _previousSearchQuery;

  Future<void> searchMovies(String query) async {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _searchQuery = query;

    if (query.isEmpty) {
      _isSearching = false;
      _searchResults = [];
      _previousSearchResults = [];
      _errorMessage = '';
      notifyListeners();
      return;
    }

    _isSearching = true;
    notifyListeners();

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      _isLoading = true;
      _errorMessage = '';
      notifyListeners();

      try {
        if (query.toLowerCase().startsWith(
          _previousSearchQuery?.toLowerCase() ?? '',
        )) {
          _searchResults = _previousSearchResults
              .where(
                (movie) =>
                    movie.title.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
        } else {
          _searchResults = movieList
              .where(
                (movie) =>
                    movie.title.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
        }
        _previousSearchResults = _searchResults;
        _previousSearchQuery = query;

        _errorMessage = '';
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

  Future<void> loadMovies() async {
    setLoading(true);
    try {
      movieList = await apiService.getMovies();
      filteredMovies = movieList;
      genreList = await apiService.getGenres();
    } catch (e) {
      print('Error loading movies: $e');
    } finally {
      setLoading(false);
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

  void onCancelSearch() {
    _isSearching = false; // <-- This is the most important flag
    _searchQuery = '';
    _searchResults = [];
    _previousSearchResults = [];
    _previousSearchQuery = null;
    _errorMessage = '';
    // Optional: Cancel the debounce timer if it's running
    _debounce?.cancel();
    notifyListeners();
  }
}
