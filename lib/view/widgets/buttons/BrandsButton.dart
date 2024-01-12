import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class BrandsButton extends StatelessWidget {
  final title;
  final icon;

  const BrandsButton({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(164, 0),
            backgroundColor: Colors.white,
            elevation: 0,
            padding: EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xffE9E9E9)),
                borderRadius: BorderRadius.circular(10))),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Brand(
              icon,
              size: 18,
            ),
            SizedBox(
              width: 10,
            ),
            NormalText(
              text: title,
              weight: FontWeight.w500,
              size: 14.0,
            )
          ],
        ));
  }
}
