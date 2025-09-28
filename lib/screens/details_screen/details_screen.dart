import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:top_movies/providers/detail_provider.dart';
import 'package:top_movies/widgets/genre_widget.dart';

class DetailsScreen extends StatefulWidget {
  final int movieId;
  const DetailsScreen({super.key, required this.movieId});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DetailProvider>(
        context,
        listen: false,
      ).loadDetails(widget.movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Consumer<DetailProvider>(
      builder: (context, detailProvider, child) {
        if (detailProvider.isLoading || detailProvider.movieDetails == null) {
          return const Scaffold(
            backgroundColor: Color.fromRGBO(52, 52, 74, 1),
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          final movie = detailProvider.movieDetails!;
          return RefreshIndicator(
            onRefresh: () => detailProvider.refreshData(widget.movieId),
            child: Scaffold(
              backgroundColor: Color.fromRGBO(52, 52, 74, 1),
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Hero(
                      tag: movie.title,
                      child: Container(
                        width: screenSize.width,
                        height: screenSize.height * 0.49,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(movie.poster),
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
                              movie.title,
                              style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),

                            Row(
                              children: [
                                SizedBox(
                                  width: screenSize.width * 0.5,
                                  height: 50,
                                  child: ListView.builder(
                                    itemCount: 2,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GenreWidget(
                                        lable: movie.genres[index],
                                      );
                                    },
                                  ),
                                ),

                                Spacer(),

                                Icon(Icons.timer_outlined, color: Colors.white),

                                const SizedBox(width: 2),

                                Text(
                                  movie.runtime,
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
                                      movie.year,
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
                                      movie.imdbRating,
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
                              movie.plot,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w300,
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
                                        ':  ${movie.country}',
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
                                        ':  ${detailProvider.movieDetails!.released}',
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
                                        ':  ${movie.director}',
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
      },
    );
  }
}
