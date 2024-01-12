import 'package:FoodCycle/controllers/ProvinceController.dart';
import 'package:FoodCycle/models/ProvinceModel.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DropdownRegency extends StatelessWidget {
  final RegencyController controller;
  final ProvinceController provinceController;
  DropdownRegency(
      {super.key, required this.controller, required this.provinceController});

  String capitalize(String nama) {
    List<String> words = nama.split(" ");
    for (int i = 0; i < words.length; i++) {
      if (words[i].isNotEmpty) {
        words[i] =
            words[i][0].toUpperCase() + words[i].substring(1).toLowerCase();
      }
    }
    return words.join(" ");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NormalText(
          text: "Kabupaten",
          size: 14.0,
          weight: FontWeight.w500,
        ),
        SizedBox(
          height: 8,
        ),
        Container(
            padding: EdgeInsets.all(14),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: Color(0xffF6F7F9),
                borderRadius: BorderRadius.circular(8)),
            child: Obx(() => DropdownButton<DropdownItemRegency>(
                  underline: SizedBox(),
                  isExpanded: true,
                  icon: Icon(Iconsax.arrow_down_1),
                  value: controller.items.isNotEmpty
                      ? controller.items.firstWhere(
                          (item) => item.name == controller.selectedItem,
                          orElse: () => controller.items.first,
                        )
                      : null,
                  items: controller.items.map((DropdownItemRegency item) {
                    return DropdownMenuItem<DropdownItemRegency>(
                      value: item,
                      child: NormalText(
                        size: 14.0,
                        weight: FontWeight.w500,
                        text: capitalize(item.name),
                      ),
                    );
                  }).toList(),
                  onChanged: (DropdownItemRegency? value) {
                    if (value != null) {
                      controller.setSelectedItem(value.name);
                      DistrictController districtController =
                          Get.find<DistrictController>();
                      districtController.fetchRegenciesByRegencyId(value.id);
                    }
                  },
                  hint: Text('Select an item'),
                )))
      ],
    );
  }
}
