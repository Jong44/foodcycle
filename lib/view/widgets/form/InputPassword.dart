import 'package:FoodCycle/controllers/LoginController.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class InputPassword extends StatelessWidget {
  final text;
  final change;
  InputPassword({super.key, required this.text, this.change});
  final LoginController passwordController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
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
                  color: Color(0xffF6F7F9),
                  borderRadius: BorderRadius.circular(8)),
              width: double.infinity,
              height: 50,
              child: TextField(
                onChanged: change,
                obscureText: passwordController.isObscure.value,
                style: GoogleFonts.manrope(fontSize: 14),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(14),
                    suffixIcon: IconButton(
                      icon: Icon(passwordController.isObscure.value
                          ? Iconsax.eye
                          : Iconsax.eye_slash),
                      onPressed: () => passwordController.togglePassword(),
                    ),
                    hintText: text,
                    hintStyle: GoogleFonts.manrope(color: Color(0xffA5A5A5))),
              ),
            )
          ],
        ));
  }
}
