import 'package:FoodCycle/controllers/CheckoutController.dart';
import 'package:FoodCycle/models/StoreModel.dart';
import 'package:FoodCycle/view/page/chartpage/CardCheckout.dart';
import 'package:FoodCycle/view/page/chartpage/PembayaranPage.dart';
import 'package:FoodCycle/view/page/chartpage/bottomsheet/pembayaran.dart';
import 'package:FoodCycle/view/page/chartpage/bottomsheet/voucher.dart';
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
  final List<Store> list;
  CheckoutPage({super.key, required this.list});
  final CheckoutController checkoutController = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
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
                          border:
                              Border.all(width: 1, color: Color(0xffE8E8E8)),
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
              Container(
                height: 335 * list.length.toDouble(),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return CardCheckout(
                        total: list[index].total,
                        nameToko: list[index].name,
                        jumlahProduk: list[index].products.length,
                        images: list[index].images,
                        listProduct: list[index].products);
                  },
                ),
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
                height: 20,
              ),
              InkWell(
                onTap: () {
                  VoucheBottom(context);
                },
                child: Container(
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
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  PembayaranBottom(context);
                },
                child: Container(
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
              ),
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
                  TitleText(
                      text: "Rp ${checkoutController.subtotal.value}",
                      size: 13.0)
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
                    text:
                        "Rp ${checkoutController.subtotal.value + 10000 + 1000}",
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
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SubtitleText(
                        text: "Total : ",
                        size: 12.0,
                      ),
                      TitleText(
                          text:
                              "Rp ${checkoutController.subtotal.value + 10000 + 1000}",
                          size: 14.0)
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  PrimaryButton(
                      title: "Bayar",
                      press: () {
                        Get.to(PembayaranPage(
                            total: checkoutController.subtotal.value +
                                10000 +
                                1000));
                      }),
                ]),
          ),
        ));
  }
}
