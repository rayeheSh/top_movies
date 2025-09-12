import 'package:flutter/material.dart';
import 'package:top_movies/widgets/filter_widget.dart';
import 'package:top_movies/widgets/search_widget.dart';

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
          ],
        ),
      ),
    );
  }
}
