import 'package:FoodCycle/controllers/ProvinceController.dart';
import 'package:FoodCycle/view/page/auth/register/ThirdRegister.dart';
import 'package:FoodCycle/view/widgets/buttons/PrimaryButton.dart';
import 'package:FoodCycle/view/widgets/form/DropdownDistrict.dart';
import 'package:FoodCycle/view/widgets/form/DropdownProvince.dart';
import 'package:FoodCycle/view/widgets/form/DropdownRegency.dart';
import 'package:FoodCycle/view/widgets/form/InputNumber.dart';
import 'package:FoodCycle/view/widgets/form/InputText.dart';
import 'package:FoodCycle/view/widgets/text/SubtitleText.dart';
import 'package:FoodCycle/view/widgets/text/TitleText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SecondRegister extends StatelessWidget {
  const SecondRegister({super.key});

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
                text: "Pastikan data yang anda isikan sudah benar!",
                size: 14.0),
            SizedBox(
              height: 32,
            ),
            GetBuilder<ProvinceController>(
                init: ProvinceController(),
                builder: (provinceController) {
                  return DropdownProvince(
                    controller: ProvinceController(),
                  );
                }),
            SizedBox(
              height: 32,
            ),
            DropdownRegency(
              controller: Get.put(RegencyController()),
              provinceController: Get.put(ProvinceController()),
            ),
            SizedBox(
              height: 32,
            ),
            DropdownDistrict(
              controller: Get.put(DistrictController()),
              regencyController: Get.put(RegencyController()),
            ),
            SizedBox(
              height: 32,
            ),
            InputNumber(text: "Kode Pos", change: (value) {}),
            SizedBox(
              height: 32,
            ),
            InputText(text: "Keterangan Lainnya", change: (value) {})
          ],
        ),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 20),
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: PrimaryButton(
                press: () {
                  Get.to(ThirdRegister(), transition: Transition.rightToLeft);
                },
                title: "Selanjutnya",
              ),
            )),
      ),
    );
  }
}
