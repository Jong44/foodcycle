import 'package:FoodCycle/controllers/ChartController.dart';
import 'package:FoodCycle/view/page/chartpage/CheckoutPage.dart';
import 'package:FoodCycle/view/widgets/buttons/PrimaryButton.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:FoodCycle/view/widgets/text/SubtitleText.dart';
import 'package:FoodCycle/view/widgets/text/TitleText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChartPage extends StatelessWidget {
  ChartPage({super.key});
  final ChartController chartController = ChartController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: chartController.loadData(),
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
                      child: Icon(Iconsax.arrow_left),
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0xffE8E8E8)),
                          shape: BoxShape.circle),
                    ),
                  ),
                  TitleText(text: "Keranjang", size: 18.0),
                  InkWell(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 45,
                      height: 45,
                      child: Icon(
                        Iconsax.message4,
                        size: 16,
                      ),
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
                  Row(
                    children: [
                      InkWell(
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              border: Border.all(
                                  width: 1, color: Color(0xffE8E8E8))),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffE8E8E8)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TitleText(text: "Toko Buah", size: 12.0)
                    ],
                  ),
                  NormalText(
                    text: "1 produk",
                    size: 12.0,
                    weight: FontWeight.w500,
                    color: Color(0xffa5a5a5),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    child: Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border:
                              Border.all(width: 1, color: Color(0xffE8E8E8))),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Container(
                          height: 110,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1, color: Color(0xffE8E8E8))),
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
                                    borderRadius: BorderRadius.horizontal(
                                        left: Radius.circular(10))),
                              ),
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.all(13),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      NormalText(
                                          text: "Pisang Ambon",
                                          size: 12.0,
                                          weight: FontWeight.w500),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      NormalText(
                                        text: "Rp 12000",
                                        size: 12.0,
                                        weight: FontWeight.w700,
                                        color: Color(0xff009688),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          padding: EdgeInsets.all(5),
                                          width: 100,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Color(0xffE8E8E8),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Obx(
                                            () => Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      if (chartController
                                                              .jumlah.value >
                                                          1) {
                                                        chartController
                                                            .jumlah.value -= 1;
                                                      }
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 20,
                                                      decoration: BoxDecoration(
                                                        color: chartController
                                                                    .jumlah
                                                                    .value <=
                                                                1
                                                            ? Color(0xffa5a5a5)
                                                            : Color(0xffFEBF4B),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Icon(
                                                        Iconsax.minus,
                                                        size: 12,
                                                      ),
                                                    ),
                                                  ),
                                                  NormalText(
                                                    text: chartController
                                                        .jumlah.value
                                                        .toString(),
                                                    size: 12.0,
                                                    weight: FontWeight.w700,
                                                    color: Color(0xff009688),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      chartController
                                                          .jumlah.value += 1;
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 20,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xffFEBF4B),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Icon(
                                                        Iconsax.add,
                                                        size: 12,
                                                      ),
                                                    ),
                                                  )
                                                ]),
                                          )),
                                    ]),
                              ))
                            ],
                          )))
                ],
              )
            ],
          );
        },
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
          Row(
            children: [
              InkWell(
                child: Container(
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(width: 1, color: Color(0xffE8E8E8))),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              SubtitleText(
                text: "Semua",
                size: 12.0,
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SubtitleText(
                    text: "Total",
                    size: 12.0,
                  ),
                  TitleText(text: "Rp 12000", size: 12.0)
                ],
              ),
              SizedBox(
                width: 10,
              ),
              PrimaryButton(
                  title: "Beli (1)",
                  press: () {
                    Get.to(CheckoutPage());
                  }),
            ],
          )
        ]),
      ),
    );
  }
}
