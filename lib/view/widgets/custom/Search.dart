import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class InputSearch extends StatelessWidget {
  const InputSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              color: Color(0xffF6F7F9),
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Iconsax.search_normal,
                  color: Color(0xffA5a5a5),
                ),
                hintStyle: GoogleFonts.manrope(
                    color: Color(0xffA5a5a5), fontSize: 14.0),
                hintText: "Cari produk atau Toko"),
          ),
        )),
        SizedBox(
          width: 20,
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Color(0xffFEBF4B),
              borderRadius: BorderRadius.circular(10)),
          child: Icon(
            Iconsax.setting_45,
          ),
        )
      ],
    );
  }
}
