import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ButtonText extends StatelessWidget {
  final text;
  final size;
  final weight;
  final press;
  const ButtonText(
      {super.key,
      required this.text,
      required this.size,
      required this.weight,
      required this.press});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: press,
        child: Text(
          text,
          style: GoogleFonts.manrope(
              fontSize: size, fontWeight: weight, color: Color(0xff009688)),
        ));
  }
}
