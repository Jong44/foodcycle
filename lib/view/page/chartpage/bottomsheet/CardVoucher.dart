import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class CardVoucher extends StatelessWidget {
  final title;
  final ketentuan;
  final icon;
  const CardVoucher(
      {super.key,
      required this.title,
      required this.icon,
      required this.ketentuan});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(width: 1, color: Color(0xffE8E8E8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff061623)),
                child: Icon(
                  icon,
                  color: Color(0xffFEBF4B),
                  size: 20,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  NormalText(text: title, size: 14.0, weight: FontWeight.w500),
                  NormalText(
                    text: ketentuan,
                    size: 12.0,
                    weight: FontWeight.w400,
                    color: Color(0xffa5a5a5),
                  ),
                ],
              )
            ],
          ),
          Container(
            width: 17,
            height: 17,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: Color(0xff979491))),
          ),
        ],
      ),
    );
  }
}
