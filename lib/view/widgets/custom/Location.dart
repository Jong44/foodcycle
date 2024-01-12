import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:FoodCycle/view/widgets/text/SubtitleText.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class LocationCustom extends StatelessWidget {
  final regency;
  final district;
  const LocationCustom(
      {super.key, required this.district, required this.regency});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Iconsax.location5,
          color: Color(0xff009688),
          size: 15,
        ),
        SizedBox(
          width: 5,
        ),
        SubtitleText(text: district + ", " + regency, size: 12.0)
      ],
    );
  }
}
