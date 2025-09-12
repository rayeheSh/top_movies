import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_movies/widgets/filter_widget.dart';
import 'package:top_movies/widgets/navigation_bar.dart';
import 'package:top_movies/widgets/playing_widget.dart';
import 'package:top_movies/widgets/search_widget.dart';
import 'package:top_movies/widgets/trending_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            SearchWidget(),

            SizedBox(height: 16),

            SingleChildScrollView(
              child: Row(
                spacing: 8,
                children: [
                  MainFilterWidget(
                    lable: 'All categories',
                    selected: false,
                    onTap: () {},
                  ),
                  FilterWidget(lable: 'Action', selected: false, onTap: () {}),
                  FilterWidget(
                    lable: 'Adventure',
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
              crossAxisAlignment: CrossAxisAlignment.start,
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

                SizedBox(height: 12),

                SingleChildScrollView(
                  padding: EdgeInsets.only(right: 16),
                  child: Row(
                    spacing: 10,
                    children: [
                      TrendingWidget(
                        img: 'assets/images/john_wick.jpg',
                        title: 'John Wick',
                        year: '2020',
                      ),

                      TrendingWidget(
                        img: 'assets/images/john_wick.jpg',
                        title: 'John Wick',
                        year: '2020',
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New Releases - Movies',
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

                SizedBox(height: 12),

                SingleChildScrollView(
                  padding: EdgeInsets.only(right: 16),
                  child: Row(
                    spacing: 10,
                    children: [
                      TrendingWidget(
                        img: 'assets/images/john_wick.jpg',
                        title: 'John Wick',
                        year: '2020',
                      ),

                      TrendingWidget(
                        img: 'assets/images/john_wick.jpg',
                        title: 'John Wick',
                        year: '2020',
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 16),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New Releases - TV Shows',
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

                SizedBox(height: 12),

                SingleChildScrollView(
                  padding: EdgeInsets.only(right: 16),
                  child: Row(
                    spacing: 10,
                    children: [
                      TrendingWidget(
                        img: 'assets/images/john_wick.jpg',
                        title: 'John Wick',
                        year: 'S01E01',
                      ),

                      TrendingWidget(
                        img: 'assets/images/john_wick.jpg',
                        title: 'John Wick',
                        year: '2020',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
