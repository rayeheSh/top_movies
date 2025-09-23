import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:top_movies/providers/home_provider.dart';
import 'package:top_movies/screens/details_screen/details_screen.dart';
import 'package:top_movies/widgets/filter_widget.dart';
import 'package:top_movies/widgets/playing_widget.dart';
import 'package:top_movies/widgets/search_result_widget.dart';
import 'package:top_movies/widgets/search_widget.dart';
import 'package:top_movies/widgets/trending_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeProvider>(context, listen: false).loadMovies();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
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
      body: Column(
        children: [
          SearchWidget(
            controller: _searchController,
            onChanged: (query) {
              homeProvider.searchMovies(query);
            },
          ),
          const SizedBox(height: 18),
          if (homeProvider.isSearching)
            Expanded(child: _buildSearchResults(homeProvider))
          else
            Expanded(
              child: RefreshIndicator(
                onRefresh: homeProvider.refreshData,
                child: SingleChildScrollView(
                  child: _buildHomeContent(homeProvider),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildHomeContent(HomeProvider provider) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                MainFilterWidget(
                  lable: 'All Categories',
                  selected: true,
                  onTap: () => provider.changeSelected('All Categories'),
                ),

                ...provider.genreList.map((genre) {
                  return FilterWidget(
                    lable: genre.name,
                    selected: provider.selectedFilter == genre.name,
                    onTap: () => provider.changeSelected(genre.name),
                  );
                }),
              ],
            ),
          ),
        ),

        const SizedBox(height: 18),

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
            const SizedBox(height: 12),

            PlayingWidget(
              img: 'assets/images/john_wick.jpg',
              title: 'John Wick:Chapter 4',
              rating: '8.5',
            ),
          ],
        ),
        const SizedBox(height: 18),
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
                itemCount: provider.filteredMovies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TrendingWidget(
                    movie: provider.filteredMovies[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            movieId: provider.filteredMovies[index].id,
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
    );
  }
}

Widget _buildSearchResults(HomeProvider provider) {
  if (provider.isLoading) {
    return const Center(child: CircularProgressIndicator());
  } else if (provider.errorMessage != null &&
      provider.errorMessage!.isNotEmpty) {
    return Center(
      child: Text(
        provider.errorMessage!,
        style: GoogleFonts.poppins(color: Colors.red),
      ),
    );
  } else if (provider.searchResults.isEmpty &&
      provider.searchQuery!.isNotEmpty) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Text(
          'Not Found',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'We are sorry we cannot find the movie. We are constantly updating the app to contain all what you want.',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: Colors.white70,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  } else {
    return ListView.builder(
      itemCount: provider.searchResults.length,
      itemBuilder: (context, index) {
        final movie = provider.searchResults[index];
        return SearchResultWidget(movie: movie);
      },
    );
  }
}
