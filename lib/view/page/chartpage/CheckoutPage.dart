import 'package:FoodCycle/view/widgets/buttons/PrimaryButton.dart';
import 'package:FoodCycle/view/widgets/custom/Line.dart';
import 'package:FoodCycle/view/widgets/form/InputText.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:FoodCycle/view/widgets/text/SubtitleText.dart';
import 'package:FoodCycle/view/widgets/text/TitleText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:iconsax/iconsax.dart' as Vuesax;

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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
                      border: Border.all(width: 1, color: Color(0xffE8E8E8)),
                      shape: BoxShape.circle),
                ),
              ),
              TitleText(text: "Checkout", size: 18.0),
              SizedBox(
                width: 45,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffE8E8E8)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TitleText(text: "Toko Buah", size: 13.0)
                ],
              ),
              NormalText(
                text: "1 Produk",
                size: 13.0,
                weight: FontWeight.w500,
                color: Color(0xffa5a5a5),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              height: 110,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Color(0xffE8E8E8))),
              child: Row(
                children: [
                  Container(
                    width: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://firebasestorage.googleapis.com/v0/b/foodcycle-e97e3.appspot.com/o/products%2F5e1ddec88239de3c9c7c88d400028d0d.jpeg?alt=media&token=5afdf97f-0370-4f23-b7c9-10a368d5bc53"),
                            fit: BoxFit.cover),
                        color: Color(0xffE8E8E8),
                        borderRadius:
                            BorderRadius.horizontal(left: Radius.circular(10))),
                  ),
                  Expanded(
                      child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          NormalText(
                              text: "Pisang Ambon",
                              size: 13.0,
                              weight: FontWeight.w500),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Iconsax.location_bold,
                                color: Color(0xffA5A5A5),
                                size: 14,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              NormalText(
                                text: "12 KM",
                                size: 11.0,
                                weight: FontWeight.w400,
                                color: Color(0xffA5A5A5),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Icon(
                                Iconsax.star_1_bold,
                                size: 15,
                                color: Color(0xffFEBF4B),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              NormalText(
                                text: "2.5",
                                size: 11.0,
                                weight: FontWeight.w400,
                                color: Color(0xffA5A5A5),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Line(width: double.infinity),
                          SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              NormalText(
                                text: "Rp 12000",
                                size: 12.0,
                                weight: FontWeight.w700,
                                color: Color(0xff009688),
                              ),
                              SubtitleText(text: "1x", size: 12.0)
                            ],
                          )
                        ]),
                  ))
                ],
              )),
          SizedBox(
            height: 10,
          ),
          InputText(text: "Catatan", change: (value) {}),
          SizedBox(
            height: 10,
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Color(0xffE8E8E8))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Iconsax.truck_fast_bold,
                        color: Color(0xff009688),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TitleText(text: "Antar", size: 13.0)
                    ],
                  ),
                  Row(
                    children: [
                      TitleText(text: "Rp 10000", size: 13.0),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Vuesax.Iconsax.arrow_right_3,
                        size: 18,
                      )
                    ],
                  )
                ],
              )),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleText(text: "Total : ", size: 13.0),
              NormalText(
                text: "Rp 12000",
                size: 13.0,
                weight: FontWeight.bold,
                color: Color(0xff009688),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Line(width: double.infinity),
          SizedBox(
            height: 20,
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Color(0xffE8E8E8))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Iconsax.ticket_discount_bold,
                        color: Color(0xffFEBF4B),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TitleText(text: "Voucher", size: 13.0)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Vuesax.Iconsax.arrow_right_3,
                        size: 18,
                      )
                    ],
                  )
                ],
              )),
          SizedBox(
            height: 20,
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Color(0xffE8E8E8))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Iconsax.ticket_discount_bold,
                        color: Color(0xffFEBF4B),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TitleText(text: "Metode Pembayaran", size: 13.0)
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Vuesax.Iconsax.arrow_right_3,
                        size: 18,
                      )
                    ],
                  )
                ],
              )),
          SizedBox(
            height: 20,
          ),
          TitleText(text: "Rincian Pembayaran", size: 14.0),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubtitleText(text: "Subtotal Produk", size: 13.0),
              TitleText(text: "Rp 12000", size: 13.0)
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubtitleText(text: "Subtotal Pengiriman", size: 13.0),
              TitleText(text: "Rp 10000", size: 13.0)
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SubtitleText(text: "Biaya Layanan", size: 13.0),
              TitleText(text: "Rp 1000", size: 13.0)
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleText(text: "Total Pembayaran", size: 13.0),
              NormalText(
                text: "Rp 22000",
                size: 13.0,
                weight: FontWeight.bold,
                color: Color(0xff009688),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                top: BorderSide(
                    width: 1, color: Color.fromRGBO(13, 13, 13, 0.10)))),
        padding: EdgeInsets.symmetric(horizontal: 25),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SubtitleText(
                text: "Total : ",
                size: 12.0,
              ),
              TitleText(text: "Rp 12000", size: 14.0)
            ],
          ),
          SizedBox(
            width: 20,
          ),
          PrimaryButton(
              title: "Bayar",
              press: () {
                Get.to(CheckoutPage());
              }),
        ]),
      ),
    );
  }
}
