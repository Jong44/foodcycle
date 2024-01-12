import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NormalText extends StatelessWidget {
  final text;
  final size;
  final weight;
  final color;
  const NormalText(
      {super.key,
      required this.text,
      required this.size,
      required this.weight,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.manrope(
          fontSize: size,
          fontWeight: weight,
          color: color == null ? Colors.black : color),
    );
  }
}
