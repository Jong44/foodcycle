import 'dart:async';

import 'package:FoodCycle/controllers/PenyaluranController.dart';
import 'package:FoodCycle/view/page/pengantaranpage/success.dart';
import 'package:FoodCycle/view/widgets/buttons/PrimaryButton.dart';
import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PengantaranPage2 extends StatefulWidget {
  final icon;
  final title;
  final content;
  final buttonTitle;
  const PengantaranPage2(
      {super.key,
      required this.icon,
      required this.title,
      required this.content,
      required this.buttonTitle});

  @override
  State<PengantaranPage2> createState() => _PengantaranPage2State(
      this.title, this.buttonTitle, this.content, this.icon);
}

class _PengantaranPage2State extends State<PengantaranPage2> {
  final icon;
  final title;
  final content;
  final buttonTitle;
  _PengantaranPage2State(this.title, this.buttonTitle, this.content, this.icon);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 10), () {
      showSuccessPopup(context, "Selamat Anda Telah Menyelamatkan Lingkungan!",
          "Anda menyetorkan samah seberat 3kg dan mendapatkan 30 Point");
      PenyaluranController().addPoint();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Stack(
            alignment: Alignment.center,
            children: [
              RippleAnimation(
                repeat: true,
                duration: const Duration(seconds: 6),
                ripplesCount: 1,
                color: Color(0xff59DFBA),
                child: Center(child: Container()),
                size: Size(5, 5),
                minRadius: 90,
              ),
              Container(
                width: 200,
                height: 200,
                child: icon,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            content,
            textAlign: TextAlign.center,
            style: GoogleFonts.manrope(
              color: Color(0xffa5a5a5),
              fontSize: 13,
            ),
          ),
        ]),
      )),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    width: 1, color: Color.fromRGBO(13, 13, 13, 0.10))),
          ),
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 15),
          child: Container(
            color: Colors.white,
            width: double.infinity,
            child: PrimaryButton(
              press: () {},
              title: buttonTitle,
            ),
          )),
    );
  }
}
