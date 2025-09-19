import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:top_movies/providers/home_provider.dart';
import 'package:top_movies/screens/details_screen/details_screen.dart';
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
  @override
  void initState() {
    super.initState();
    // Delay the call to the provider method until the next frame.
    // This allows the current build process to complete.
    Future.microtask(() {
      final homeProvider = Provider.of<HomeProvider>(context, listen: false);
      homeProvider.refreshData();
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
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          if (homeProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            onRefresh: homeProvider.refreshData,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SearchWidget(),

                  SizedBox(height: 16),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsetsGeometry.only(right: 12),
                    child: Row(
                      children: [
                        MainFilterWidget(
                          lable: 'All Categories',
                          selected:
                              homeProvider.selectedFilter == 'All Categories',
                          onTap: () =>
                              homeProvider.changeSelected('All Categories'),
                        ),

                        SizedBox(
                          width: 1000,
                          height: 50,
                          child: ListView.builder(
                            itemCount: homeProvider.genreList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return FilterWidget(
                                lable: homeProvider.genreList[index].name,
                                selected:
                                    homeProvider.selectedFilter ==
                                    homeProvider.genreList[index].name,
                                onTap: () => homeProvider.changeSelected(
                                  homeProvider.genreList[index].name,
                                ),
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
                          itemCount: homeProvider.filteredMovies.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return TrendingWidget(
                              movie: homeProvider.filteredMovies[index],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                      movieId:
                                          homeProvider.filteredMovies[index].id,
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
          );
        },
      ),
    );
  }
}
