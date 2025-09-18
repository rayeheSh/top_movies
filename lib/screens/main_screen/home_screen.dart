import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_movies/models/genre_movie.dart';
import 'package:top_movies/models/genres.dart';
import 'package:top_movies/models/movie.dart';
import 'package:top_movies/screens/details_screen/details_screen.dart';
import 'package:top_movies/services/api_service.dart';
import 'package:top_movies/widgets/filter_widget.dart';
import 'package:top_movies/widgets/playing_widget.dart';
import 'package:top_movies/widgets/search_widget.dart';
import 'package:top_movies/widgets/trending_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService apiService = ApiService();
  List<Movie> movieList = [];
  List<GenreList> genreList = [];
  List<Movie> filteredMovies = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadMovies();
    loadGenres();
  }

  Future<void> loadMovies() async {
    if (!mounted) return;

    setState(() {
      isLoading = true;
    });

    try {
      movieList = await apiService.getMovies();
      filteredMovies = movieList;
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error in loading data: $e')));
      }
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> loadGenres() async {
    if (!mounted) return;

    setState(() {
      isLoading = true;
    });

    try {
      genreList = await apiService.getGenres();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error in loading data: $e')));
      }
    }

    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  String selectedFilter = 'All Categories';
  void changeSelected(String newFilter) {
    setState(() {
      selectedFilter = newFilter;
      if (selectedFilter == 'All Categories') {
        filteredMovies = movieList;
      } else {
        filteredMovies = movieList
            .where((movie) => movie.genres.contains(selectedFilter))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(52, 52, 74, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actionsIconTheme: IconThemeData(color: Colors.white, size: 30),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white, size: 40),
          onPressed: () {},
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: loadMovies,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(18),
                child: Column(
                  children: [
                    SearchWidget(),

                    SizedBox(height: 16),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 8,
                        children: [
                          MainFilterWidget(
                            lable: 'All Categories',
                            selected: selectedFilter == 'All Categories',
                            onTap: () => changeSelected('All Categories'),
                          ),

                          SizedBox(
                            width: 1000,
                            height: 50,
                            child: ListView.builder(
                              itemCount: genreList.length - 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return FilterWidget(
                                  lable: genreList[index].name,
                                  selected:
                                      selectedFilter == genreList[index].name,
                                  onTap: () =>
                                      changeSelected(genreList[index].name),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Now playing',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 12),

                        PlayingWidget(
                          img: 'assets/images/john_wick.jpg',
                          title: 'John Wick:Chapter 4',
                          rating: '8.5',
                        ),
                      ],
                    ),

                    SizedBox(height: 16),

                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Trending',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'View all',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 250,
                          child: ListView.builder(
                            itemCount: filteredMovies.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return TrendingWidget(
                                movie: filteredMovies[index],
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                        movieId: filteredMovies[index].id,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
