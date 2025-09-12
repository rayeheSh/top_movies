import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white),
        borderRadius: BorderRadius.circular(30),
      ),
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
          hintStyle: GoogleFonts.roboto(
            color: Color.fromRGBO(136, 136, 136, 1),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          hintText: 'Search movies',
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Icon(Icons.search),
          ),
          prefixIconColor: Colors.white,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16.0),
        ),
      ),
    );
  }
}
