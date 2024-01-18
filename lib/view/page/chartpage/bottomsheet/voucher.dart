import 'package:FoodCycle/controllers/CheckoutController.dart';
import 'package:FoodCycle/view/page/chartpage/bottomsheet/CardVoucher.dart';
import 'package:FoodCycle/view/widgets/buttons/PrimaryButton.dart';
import 'package:FoodCycle/view/widgets/custom/Search.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';

void VoucheBottom(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            height: 550,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NormalText(
                        text: "Voucher", size: 20.0, weight: FontWeight.w600),
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
                        NormalText(
                            text: "Voucher Ongkir",
                            size: 16.0,
                            weight: FontWeight.w500),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 85 * 2,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  CardVoucher(
                                    title: "Gratis Ongkir s.d 5rb",
                                    ketentuan: "Min. Blj Rp 50.000",
                                    icon: Iconsax.truck_fast_bold,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        NormalText(
                            text: "Voucher Diskon",
                            size: 16.0,
                            weight: FontWeight.w500),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 85 * 2,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  CardVoucher(
                                    title: "Diskon  Belanja 20% s.d 15rb",
                                    ketentuan: "Min. Blj Rp 50.000",
                                    icon: Iconsax.receipt_disscount_bold,
                                  ),
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
