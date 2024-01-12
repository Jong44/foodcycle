import 'package:FoodCycle/controllers/RegisterController.dart';
import 'package:FoodCycle/view/page/auth/register/SecondRegister.dart';
import 'package:FoodCycle/view/page/auth/register/VerificationCode.dart';
import 'package:FoodCycle/view/widgets/buttons/PrimaryButton.dart';
import 'package:FoodCycle/view/widgets/form/InputNumber.dart';
import 'package:FoodCycle/view/widgets/form/InputPassword.dart';
import 'package:FoodCycle/view/widgets/form/InputText.dart';
import 'package:FoodCycle/view/widgets/text/SubtitleText.dart';
import 'package:FoodCycle/view/widgets/text/TitleText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FourthRegister extends StatelessWidget {
  RegisterController registerController = Get.put(RegisterController());
  FourthRegister({super.key});

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
          InputPassword(
            text: "Buat Kata Sandi",
            change: ((value) {
              registerController.katasandi.value = value;
            }),
          ),
          SizedBox(
            height: 12,
          ),
          SubtitleText(
              text:
                  "Saya ingin menerima informasi dan kebijakan terkait FoodCycle.",
              size: 14.0)
        ],
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Container(
            color: Colors.white,
            width: double.infinity,
            child: PrimaryButton(
              press: () {
                if (registerController.katasandi.isNotEmpty) {
                  registerController.sendMail();
                }
              },
              title: "Selanjutnya",
            ),
          )),
    ));
  }
}
