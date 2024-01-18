import 'package:FoodCycle/view/page/pengantaranpage/pengantaranpage.dart';
import 'package:FoodCycle/view/page/penyaluranpage/FormPenyaluranPage.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:FoodCycle/view/widgets/text/TitleText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void dialogShow(BuildContext context, String title, String content) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.center,
          contentPadding: EdgeInsets.all(20),
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            content,
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              color: Color(0xffa5a5a5),
              fontSize: 12,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        minimumSize: Size(110, 40),
                        shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xff009688)),
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.transparent),
                    onPressed: () {
                      Get.back();
                    },
                    child: NormalText(
                      text: "Tidak",
                      weight: FontWeight.w600,
                      size: 13.0,
                      color: Color(0xff009688),
                    )),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(110, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Color(0xff009688)),
                    onPressed: () {
                      Get.to(PengantaranPage(
                        icon: Image.asset("assets/antar/motor.png"),
                        title:
                            "Pengemudi sedang menuju ke lokasi Anda sekarang",
                        content:
                            "Tetap berada disini atau lihat tracking dimana driver berada.",
                        buttonTitle: "Lihat Tracking Kurir",
                      ));
                    },
                    child: NormalText(
                      text: "Ya",
                      weight: FontWeight.w600,
                      size: 13.0,
                      color: Colors.white,
                    )),
              ],
            )
          ],
        );
      });
}
