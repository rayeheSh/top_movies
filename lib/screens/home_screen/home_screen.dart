import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_movies/models/genres.dart';
import 'package:top_movies/models/movie.dart';
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
                            lable: 'All categories',
                            selected: false,
                            onTap: () {},
                          ),
                          FilterWidget(
                            lable: genreList[0].name,
                            selected: false,
                            onTap: () {},
                          ),
                          FilterWidget(
                            lable: genreList[1].name,
                            selected: false,
                            onTap: () {},
                          ),

                          FilterWidget(
                            lable: genreList[2].name,
                            selected: false,
                            onTap: () {},
                          ),

                          FilterWidget(
                            lable: genreList[3].name,
                            selected: false,
                            onTap: () {},
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
                            itemCount: movieList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return TrendingWidget(
                                movie: movieList[index],
                                onTap: () {
                                  
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
