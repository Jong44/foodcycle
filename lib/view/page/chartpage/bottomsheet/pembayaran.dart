import 'package:FoodCycle/controllers/CheckoutController.dart';
import 'package:FoodCycle/view/page/chartpage/bottomsheet/CardPembayaran.dart';
import 'package:FoodCycle/view/page/chartpage/bottomsheet/CardVoucher.dart';
import 'package:FoodCycle/view/widgets/buttons/PrimaryButton.dart';
import 'package:FoodCycle/view/widgets/custom/Search.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

void PembayaranBottom(BuildContext context) {
  final CheckoutController checkoutController = Get.put(CheckoutController());
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            height: 550,
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NormalText(
                        text: "Metode Pembayaran",
                        size: 20.0,
                        weight: FontWeight.w600),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.close)),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 300,
                    child: ListView(
                      children: [
                        CardPembayaran(
                            index: 0,
                            title: checkoutController.pembayaran[0]['name'],
                            color: Color(0xffC7F9E2),
                            image: Icon(
                              Iconsax.moneys_bold,
                              color: Color(0xff009688),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        NormalText(
                            text: "Transfer Bank",
                            size: 16.0,
                            weight: FontWeight.w500),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 85 * 4,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  CardPembayaran(
                                      index: index + 1,
                                      title: checkoutController
                                          .pembayaran[index + 1]['name'],
                                      image: Image.asset(
                                        'assets/pembayaran/${checkoutController.pembayaran[index + 1]['image']}',
                                      )),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        NormalText(
                            text: "E-Wallet",
                            size: 16.0,
                            weight: FontWeight.w500),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 85 * 4,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  CardPembayaran(
                                      index: index + 4,
                                      title: checkoutController
                                          .pembayaran[index + 5]['name'],
                                      image: Image.asset(
                                        'assets/pembayaran/${checkoutController.pembayaran[index + 5]['image']}',
                                      )),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  child: PrimaryButton(
                    title: "Konfirmasi",
                    press: () {},
                  ),
                )),
              ],
            ));
      });
}
