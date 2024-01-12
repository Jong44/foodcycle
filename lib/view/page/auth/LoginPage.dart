import 'package:FoodCycle/controllers/LoginController.dart';
import 'package:FoodCycle/main.dart';
import 'package:FoodCycle/view/page/auth/register/FirstRegister.dart';
import 'package:FoodCycle/view/page/homepage/HomePage.dart';
import 'package:FoodCycle/view/widgets/buttons/BrandsButton.dart';
import 'package:FoodCycle/view/widgets/buttons/PrimaryButton.dart';
import 'package:FoodCycle/view/widgets/custom/Line.dart';
import 'package:FoodCycle/view/widgets/form/InputPassword.dart';
import 'package:FoodCycle/view/widgets/form/InputText.dart';
import 'package:FoodCycle/view/widgets/text/ButtonText.dart';
import 'package:FoodCycle/view/widgets/text/SubtitleText.dart';
import 'package:FoodCycle/view/widgets/text/TitleText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: _loginController.loadSavedCredentials(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 85),
            children: [
              TitleText(
                text: "Masuk Akun Anda",
                size: 24.0,
              ),
              SizedBox(
                height: 10,
              ),
              SubtitleText(
                text:
                    "Masuk akun anda untuk dapatkan pengalaman layanan terbaik dari platform kami!",
                size: 14.0,
              ),
              SizedBox(
                height: 32,
              ),
              InputText(
                text: "Email",
                change: (value) => _loginController.email.value = value,
              ),
              SizedBox(height: 20),
              InputPassword(
                text: "Kata Sandi",
                change: (value) => _loginController.password.value = value,
              ),
              SizedBox(
                height: 10,
              ),
              Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () => _loginController.rememberAccount(),
                            child: Container(
                                width: 15,
                                height: 15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        width: 1, color: Color(0xffA5A5A5))),
                                child: Visibility(
                                  visible: _loginController.isRemember.value,
                                  child: Icon(
                                    Icons.check,
                                    size: 12,
                                  ),
                                )),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          SubtitleText(text: "Ingat Saya", size: 14.0)
                        ],
                      ),
                      TextButton(
                          onPressed: () {},
                          child: SubtitleText(
                            text: "Lupa Kata Sandi",
                            size: 14.0,
                          ))
                    ],
                  )),
              SizedBox(
                height: 45,
              ),
              PrimaryButton(
                title: "Masuk",
                press: () {
                  _loginController.submitLogin();
                },
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Line(
                    width: 90.0,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  SubtitleText(
                    text: "atau lanjutkan dengan",
                    size: 12.0,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Line(
                    width: 90.0,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  BrandsButton(
                    icon: Brands.google,
                    title: "Google",
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  BrandsButton(
                    icon: Brands.facebook,
                    title: "Facebook",
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SubtitleText(text: "Belum punya Akun?", size: 12.0),
                  ButtonText(
                    text: "Daftar",
                    size: 12.0,
                    weight: FontWeight.w500,
                    press: () {
                      Get.to(FirstRegister(),
                          transition: Transition.rightToLeft);
                    },
                  )
                ],
              )
            ],
          );
        }
      },
    ));
  }
}
