import 'package:FoodCycle/controllers/ChartController.dart';
import 'package:FoodCycle/controllers/CheckoutController.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardPembayaran extends StatelessWidget {
  final title;
  final image;
  final color;
  final index;
  CardPembayaran(
      {super.key,
      required this.title,
      required this.image,
      this.color,
      required this.index});

  final CheckoutController checkoutController = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(checkoutController.indexPembayaran.value);
        checkoutController.indexPembayaran.value = index;
      },
      child: Container(
        padding: EdgeInsets.all(12),
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                width: 1,
                color: checkoutController.indexPembayaran.value == index
                    ? Color(0xffFEBF4B)
                    : Color(0xffE8E8E8))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                    width: 45,
                    height: 45,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color == null ? Color(0xffF6F7F9) : color),
                    child: image),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NormalText(
                        text: title, size: 14.0, weight: FontWeight.w500),
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
      ),
    );
  }
}
