import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubtitleText extends StatelessWidget {
  final text;
  final size;
  final align;

  const SubtitleText(
      {super.key, required this.text, required this.size, this.align});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      textAlign: align == null ? TextAlign.left : align,
      style: GoogleFonts.manrope(fontSize: size, color: Color(0xffA5A5A5)),
    );
  }
}
