import 'package:FoodCycle/controllers/RegisterController.dart';
import 'package:FoodCycle/view/page/auth/register/FourthRegister.dart';
import 'package:FoodCycle/view/page/auth/register/SecondRegister.dart';
import 'package:FoodCycle/view/widgets/buttons/PrimaryButton.dart';
import 'package:FoodCycle/view/widgets/form/InputNumber.dart';
import 'package:FoodCycle/view/widgets/form/InputText.dart';
import 'package:FoodCycle/view/widgets/text/SubtitleText.dart';
import 'package:FoodCycle/view/widgets/text/TitleText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ThirdRegister extends StatelessWidget {
  RegisterController registerController = Get.put(RegisterController());
  ThirdRegister({super.key});

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
          InputText(
            text: "Alamat Email",
            change: ((value) {
              registerController.email.value = value;
            }),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Obx(
                () => InkWell(
                  onTap: () => {registerController.toggleConfirm()},
                  child: Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(width: 1, color: Color(0xffA5A5A5))),
                      child: Visibility(
                        visible: registerController.isConfirm.value,
                        child: Icon(
                          Icons.check,
                          size: 12,
                        ),
                      )),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                  child: SubtitleText(
                      text:
                          "Saya ingin menerima informasi dan kebijakan terkait FoodCycle.",
                      size: 14.0))
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
              press: () {
                if (registerController.isConfirm.isTrue) {
                  Get.to(FourthRegister(), transition: Transition.rightToLeft);
                }
              },
              title: "Selanjutnya",
            ),
          )),
    ));
  }
}
