import 'package:FoodCycle/controllers/ProvinceController.dart';
import 'package:FoodCycle/controllers/RegisterController.dart';
import 'package:FoodCycle/view/components/SuccessPopup.dart';
import 'package:FoodCycle/view/page/auth/LoginPage.dart';
import 'package:FoodCycle/view/widgets/buttons/PrimaryButton.dart';
import 'package:FoodCycle/view/widgets/form/InputPassword.dart';
import 'package:FoodCycle/view/widgets/text/ButtonText.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:FoodCycle/view/widgets/text/SubtitleText.dart';
import 'package:FoodCycle/view/widgets/text/TitleText.dart';
import 'package:awesome_ripple_animation/awesome_ripple_animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class VerificationPage extends StatelessWidget {
  final RegisterController registerController = Get.put(RegisterController());
  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            actions: [
              ButtonText(
                  text: "Ok",
                  size: 14.0,
                  weight: FontWeight.w600,
                  press: () {
                    Get.to(LoginPage(), transition: Transition.fade);
                  })
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
                    TitleText(text: "Anda Berhasil Membuat Akun", size: 14.0),
                    SizedBox(
                      height: 10,
                    ),
                    SubtitleText(
                      text:
                          "Setelah ini Anda dapat menjelajahi layanan kami. Bersenang-senang dan nikmatilah!",
                      size: 12.0,
                      align: TextAlign.center,
                    )
                  ],
                )));
      },
    );
  }

  VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 65, horizontal: 24),
        children: [
          Row(
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
              )
            ],
          ),
          SizedBox(
            height: 32,
          ),
          TitleText(text: "Buat Akun", size: 24.0),
          SizedBox(
            height: 10,
          ),
          SubtitleText(
              text: "Pastikan data yang anda isikan sudah benar!", size: 14.0),
          SizedBox(
            height: 32,
          ),
          NormalText(
            text: "Kode Verifikasi",
            size: 14.0,
            weight: FontWeight.w500,
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (int i = 0; i < 4; i++)
                Container(
                  alignment: Alignment.center,
                  width: 75.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Color(0xffF6F7F9),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    style: GoogleFonts.manrope(fontSize: 14.0),
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    keyboardType: TextInputType.number,
                    controller: registerController.controllers[i],
                    focusNode: registerController.focusNodes[i],
                    onChanged: (value) {
                      registerController.onChanged(i, value);
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Container(
            color: Colors.white,
            width: double.infinity,
            child: PrimaryButton(
              press: () async {
                try {
                  await registerController.submitRegister();
                  _showPopup(context);
                } catch (e) {
                  print(e);
                }
              },
              title: "Selanjutnya",
            ),
          )),
    ));
  }
}
