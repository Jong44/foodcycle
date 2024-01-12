import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final title;
  final press;
  const PrimaryButton({super.key, required this.title, required this.press});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff009688),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: press,
      child: Text(
        title,
        style: GoogleFonts.manrope(
          color: Colors.white,
        ),
      ),
    );
  }
}
