import 'package:FoodCycle/controllers/PenyaluranController.dart';
import 'package:FoodCycle/main.dart';
import 'package:FoodCycle/view/page/penyaluranpage/FormPenyaluranPage.dart';
import 'package:FoodCycle/view/widgets/custom/Line.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:FoodCycle/view/widgets/text/TitleText.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class PenyaluranPage extends StatelessWidget {
  PenyaluranPage({super.key});
  final PenyaluranController penyaluranController =
      Get.put(PenyaluranController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 28, vertical: 50),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: Container(
                  width: 45,
                  height: 45,
                  child: Icon(Iconsax.arrow_left),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xffE8E8E8)),
                      shape: BoxShape.circle),
                ),
              ),
              TitleText(text: "Penyaluran", size: 18.0),
              InkWell(
                onTap: () => Get.to(IndexPage()),
                child: Container(
                  width: 45,
                  height: 45,
                  child: Icon(
                    Iconsax.activity,
                    size: 16,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xffE8E8E8)),
                      shape: BoxShape.circle),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 190,
            decoration: BoxDecoration(
              color: Color(0xff009688),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Total Point Anda",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.manrope(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0),
                    ),
                    Obx(
                      () => Text(
                        penyaluranController.point.value.toString(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.manrope(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 25.0),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      height: 1,
                      width: 250,
                      color: Color(0xff4EB1A7),
                    ),
                    NormalText(
                      text: "+15% dari bulan sebelumnya",
                      size: 12.0,
                      color: Colors.white,
                      weight: FontWeight.normal,
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                minimumSize: Size(140, 40),
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1, color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Colors.transparent),
                            onPressed: () {},
                            child: NormalText(
                              text: "Tukar Point",
                              weight: FontWeight.w600,
                              size: 13.0,
                              color: Colors.white,
                            )),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(140, 40),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Color(0xffFEBF4B)),
                            onPressed: () {
                              Get.to(FormPenyaluranPage());
                            },
                            child: NormalText(
                              text: "Kirim Sampah",
                              weight: FontWeight.w600,
                              size: 13.0,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          TitleText(text: "Riwayat", size: 16.0)
        ],
      ),
    );
  }
}
