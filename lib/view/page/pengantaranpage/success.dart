import 'package:FoodCycle/view/page/penyaluranpage/FormPenyaluranPage.dart';
import 'package:FoodCycle/view/page/penyaluranpage/PenyaluranPage.dart';
import 'package:FoodCycle/view/widgets/text/ButtonText.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:FoodCycle/view/widgets/text/SubtitleText.dart';
import 'package:FoodCycle/view/widgets/text/TitleText.dart';
import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void showSuccessPopup(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Color(0xffFEBF4B)),
                onPressed: () {
                  Get.to(PenyaluranPage());
                },
                child: NormalText(
                  text: "Kembali",
                  weight: FontWeight.w600,
                  size: 13.0,
                )),
          ],
          content: Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              height: 255,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      RippleAnimation(
                        repeat: true,
                        duration: const Duration(seconds: 3),
                        ripplesCount: 1,
                        color: Color(0xff009688),
                        child: Center(child: Container()),
                        size: Size(5, 5),
                        minRadius: 50,
                      ),
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Color(0xff009688),
                        ),
                        child: Icon(
                          Icons.check,
                          size: 50,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.manrope(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SubtitleText(
                    text: content,
                    size: 12.0,
                    align: TextAlign.center,
                  ),
                ],
              )));
    },
  );
}
