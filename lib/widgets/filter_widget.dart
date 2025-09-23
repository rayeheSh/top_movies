import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterWidget extends StatelessWidget {
  final dynamic selected;
  final dynamic lable;
  final dynamic onTap;
  const FilterWidget({super.key, this.selected, this.lable, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        margin: EdgeInsetsGeometry.only(right: 6),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: BoxBorder.all(color: Colors.white, width: 1.2),
        ),
        child: Center(
          child: Text(
            lable,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: selected ? Colors.black : Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class MainFilterWidget extends StatelessWidget {
  final dynamic selected;
  final dynamic lable;
  final dynamic onTap;
  const MainFilterWidget({super.key, this.selected, this.lable, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsetsGeometry.only(right: 6),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(30.0),
          border: BoxBorder.all(color: Colors.white, width: 1.3),
        ),
        child: Row(
          spacing: 8,
          children: [
            Icon(Icons.category, color: selected ? Colors.black : Colors.white),
            Text(
              lable,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: selected ? Colors.black : Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
