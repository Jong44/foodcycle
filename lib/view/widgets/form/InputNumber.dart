import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputNumber extends StatelessWidget {
  final text;
  final ValueChanged<String> change;
  const InputNumber({super.key, required this.text, required this.change});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NormalText(
          text: text,
          size: 14.0,
          weight: FontWeight.w500,
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
              color: Color(0xffF6F7F9), borderRadius: BorderRadius.circular(8)),
          width: double.infinity,
          height: 50,
          child: TextField(
            keyboardType: TextInputType.number,
            onChanged: change,
            style: GoogleFonts.manrope(fontSize: 14),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(14),
                hintText: text,
                hintStyle: GoogleFonts.manrope(color: Color(0xffA5A5A5))),
          ),
        )
      ],
    );
  }
}
