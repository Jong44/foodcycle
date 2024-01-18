import 'package:FoodCycle/controllers/CheckoutController.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:FoodCycle/view/widgets/text/SubtitleText.dart';
import 'package:FoodCycle/view/widgets/text/TitleText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

class PembayaranPage extends StatefulWidget {
  final total;
  const PembayaranPage({super.key, required this.total});

  @override
  State<PembayaranPage> createState() => _PembayaranPageState(this.total);
}

class _PembayaranPageState extends State<PembayaranPage> {
  final total;
  final CheckoutController checkoutController = Get.put(CheckoutController());
  _PembayaranPageState(this.total);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: checkoutController.startCountdown(),
      builder: (context, snapshot) {
        return ListView(
            padding: EdgeInsets.symmetric(horizontal: 28, vertical: 50),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 45,
                      height: 45,
                      child: Icon(Iconsax.arrow_left_outline),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0xffE8E8E8)),
                          shape: BoxShape.circle),
                    ),
                  ),
                  TitleText(text: "Pembayaran", size: 18.0),
                  InkWell(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0xffE8E8E8)),
                          shape: BoxShape.circle),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TitleText(text: "Total Harga", size: 14.0),
                  NormalText(
                    text: "Rp $total",
                    size: 14.0,
                    weight: FontWeight.w600,
                    color: Color(0xff009688),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Color(0xffF6F7F9),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubtitleText(text: "Kode VA", size: 14.0),
                      TitleText(text: "01281248918", size: 16.0)
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 45),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Color(0xffFEBF4B)),
                      onPressed: () {},
                      child: NormalText(
                        text: "Salin",
                        weight: FontWeight.w600,
                        size: 16.0,
                      )),
                ]),
              ),
              SizedBox(
                height: 15,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SubtitleText(
                        text: "Lakukan pembayaran sebelum", size: 13.0),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 28,
                        decoration: BoxDecoration(
                            color: Color(0xffC7F9E2),
                            borderRadius: BorderRadius.circular(5),
                            border:
                                Border.all(width: 1, color: Color(0xff009688))),
                        child: Row(
                          children: [
                            Icon(
                              Iconsax.timer_1_outline,
                              color: Color(0xff009688),
                              size: 17,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            NormalText(
                              text: checkoutController.countdown.value,
                              size: 12.0,
                              weight: FontWeight.w400,
                              color: Color(0xff009688),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              TitleText(text: "Cara Pembayaran", size: 18.0),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Color(0xffE8E8E8))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NormalText(
                        text: "Mobile Banking",
                        size: 13.0,
                        weight: FontWeight.w500),
                    Icon(Iconsax.arrow_right_3_outline)
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1, color: Color(0xffE8E8E8))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NormalText(
                        text: "SMS Banking",
                        size: 13.0,
                        weight: FontWeight.w500),
                    Icon(Iconsax.arrow_right_3_outline)
                  ],
                ),
              )
            ]);
      },
    ));
    ;
  }
}
