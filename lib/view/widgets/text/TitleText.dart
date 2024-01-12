import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleText extends StatelessWidget {
  final text;
  final size;
  const TitleText({super.key, required this.text, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.manrope(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: Color(0xff061623)),
    );
  }
}
