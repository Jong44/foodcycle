import 'package:FoodCycle/controllers/ProvinceController.dart';
import 'package:FoodCycle/models/ProvinceModel.dart';
import 'package:FoodCycle/services/Capitalize.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DropdownDistrict extends StatelessWidget {
  final DistrictController controller;
  final RegencyController regencyController;
  DropdownDistrict(
      {super.key, required this.controller, required this.regencyController});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NormalText(
          text: "Kecamatan",
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
            child: Obx(() => DropdownButton<DropdownItemDistrict>(
                  underline: SizedBox(),
                  isExpanded: true,
                  icon: Icon(Iconsax.arrow_down_1),
                  value: controller.items.isNotEmpty
                      ? controller.items.firstWhere(
                          (item) => item.name == controller.selectedItem,
                          orElse: () => controller.items.first,
                        )
                      : null,
                  items: controller.items.map((DropdownItemDistrict item) {
                    return DropdownMenuItem<DropdownItemDistrict>(
                      value: item,
                      child: NormalText(
                        size: 14.0,
                        weight: FontWeight.w500,
                        text: capitalize(item.name),
                      ),
                    );
                  }).toList(),
                  onChanged: (DropdownItemDistrict? value) {
                    if (value != null) {
                      controller.setSelectedItem(value.name);
                    }
                  },
                  hint: Text('Select an item'),
                )))
      ],
    );
  }
}
