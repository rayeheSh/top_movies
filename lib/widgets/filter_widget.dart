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
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          border: BoxBorder.all(color: Colors.white, width: 1.3),
        ),
        child: Text(
          lable,
          style: GoogleFonts.roboto(
            fontSize: 16,
            color: selected ? Colors.black : Color.fromRGBO(197, 197, 197, 1),
            fontWeight: FontWeight.w500,
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
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: selected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(30.0),
          border: BoxBorder.all(color: Colors.white, width: 1.3),
        ),
        child: Row(
          spacing: 8,
          children: [
            Icon(
              Icons.category,
              color: selected ? Colors.black : Color.fromRGBO(197, 197, 197, 1),
            ),
            Text(
              lable,
              style: GoogleFonts.roboto(
                fontSize: 16,
                color: selected
                    ? Colors.black
                    : Color.fromRGBO(197, 197, 197, 1),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
