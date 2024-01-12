import 'package:FoodCycle/controllers/ProvinceController.dart';
import 'package:FoodCycle/models/ProvinceModel.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class DropdownProvince extends StatelessWidget {
  final ProvinceController controller;
  const DropdownProvince({super.key, required this.controller});

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
          text: "Provinsi",
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
              color: Color(0xffF6F7F9), borderRadius: BorderRadius.circular(8)),
          child: FutureBuilder(
            future: controller.fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: SizedBox(),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Obx(() => DropdownButton<DropdownItemProvince>(
                      underline: SizedBox(),
                      isExpanded: true,
                      icon: Icon(Iconsax.arrow_down_1),
                      value: controller.items.isNotEmpty
                          ? controller.items.firstWhere(
                              (item) => item.name == controller.selectedItem,
                              orElse: () => controller.items.first,
                            )
                          : null,
                      items: controller.items.map((DropdownItemProvince item) {
                        return DropdownMenuItem<DropdownItemProvince>(
                          value: item,
                          child: NormalText(
                            size: 14.0,
                            weight: FontWeight.w500,
                            text: capitalize(item.name),
                          ),
                        );
                      }).toList(),
                      onChanged: (DropdownItemProvince? value) {
                        if (value != null) {
                          controller.setSelectedItem(value.name);
                          RegencyController regencyController =
                              Get.find<RegencyController>();
                          regencyController
                              .fetchRegenciesByProvinceId(value.id);
                        }
                      },
                      hint: Text('Select an item'),
                    ));
              }
            },
          ),
        )
      ],
    );
  }
}
