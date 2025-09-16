import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_movies/models/movie_details.dart';
import 'package:top_movies/services/api_service.dart';
import 'package:top_movies/widgets/filter_widget.dart';
import 'package:top_movies/widgets/genre_widget.dart';

class DetailsScreen extends StatefulWidget {
  final int movieId;
  const DetailsScreen({super.key, required this.movieId});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  ApiService apiService = ApiService();
  late MovieDetails movieDetails;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadDetails();
  }

  Future<void> loadDetails() async {
    if (!mounted) return;

    setState(() {
      isLoading = true;
    });

    try {
      movieDetails = await apiService.getMovieDetails(widget.movieId);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error in loading details: $e')));
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
    final screenSize = MediaQuery.of(context).size;
    return isLoading
        ? Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            onRefresh: loadDetails,
            child: Scaffold(
              backgroundColor: Color.fromRGBO(52, 52, 74, 1),
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Hero(
                      tag: movieDetails.title,
                      child: Container(
                        width: screenSize.width,
                        height: screenSize.height * 0.49,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(movieDetails.poster),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: screenSize.height * 0.49),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 12,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 18,
                          children: [
                            Text(
                              movieDetails.title,
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),

                            Row(
                              children: [
                                SizedBox(
                                  width: 250,
                                  height: 50,
                                  child: ListView.builder(
                                    itemCount: movieDetails.genres.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GenreWidget(
                                        lable: movieDetails.genres[index],
                                      );
                                    },
                                  ),
                                ),

                                Spacer(),

                                Icon(Icons.timer_outlined, color: Colors.white),

                                Text(
                                  movieDetails.runtime,
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              spacing: 18,
                              children: [
                                Row(
                                  spacing: 4,
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      color: Colors.white,
                                    ),

                                    Text(
                                      movieDetails.year,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  spacing: 2,
                                  children: [
                                    Icon(
                                      Icons.star_rounded,
                                      color: Colors.white,
                                    ),

                                    Text(
                                      movieDetails.imdbRating,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Text(
                              movieDetails.plot,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),

                            Text(
                              'Details',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),

                            Table(
                              children: [
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Text(
                                        'Country',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        ': ${movieDetails.country}',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Text(
                                        'Genre',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        ': ${movieDetails.genres[0]}, ${movieDetails.genres[1]}',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Text(
                                        'Release Data',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        ': ${movieDetails.released}',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                TableRow(
                                  children: [
                                    TableCell(
                                      child: Text(
                                        'Director',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Text(
                                        ': ${movieDetails.director}',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: AppBar(
                          backgroundColor: Colors.transparent,
                          actionsIconTheme: IconThemeData(
                            color: Colors.white,
                            size: 30,
                          ),
                          actions: [
                            IconButton(
                              icon: Icon(Icons.notifications_outlined),
                              onPressed: () {},
                            ),
                          ],
                          leading: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
