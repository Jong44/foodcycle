import 'package:FoodCycle/controllers/ChartController.dart';
import 'package:FoodCycle/view/page/chartpage/CheckoutPage.dart';
import 'package:FoodCycle/view/page/chartpage/ProductBox.dart';
import 'package:FoodCycle/view/widgets/buttons/PrimaryButton.dart';
import 'package:FoodCycle/view/widgets/custom/Line.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:FoodCycle/view/widgets/text/SubtitleText.dart';
import 'package:FoodCycle/view/widgets/text/TitleText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChartPage extends StatelessWidget {
  ChartPage({super.key});
  final ChartController chartController = Get.put(ChartController());

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
              Obx(() => Container(
                  height: 30 + (230 * chartController.stores.length.toDouble()),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: chartController.stores.length,
                    itemBuilder: (context, index) {
                      var data_stores = chartController.stores[index];
                      return Column(
                        children: [
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
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          border: Border.all(
                                              width: 1,
                                              color: Color(0xffE8E8E8))),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                data_stores.images)),
                                        shape: BoxShape.circle,
                                        color: Color(0xffE8E8E8)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TitleText(text: data_stores.name, size: 12.0)
                                ],
                              ),
                              NormalText(
                                text: data_stores.products.length.toString() +
                                    " produk",
                                size: 12.0,
                                weight: FontWeight.w500,
                                color: Color(0xffa5a5a5),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height:
                                120 * data_stores.products.length.toDouble(),
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: data_stores.products.length,
                              itemBuilder: (context, index) {
                                var data_product = data_stores.products[index];
                                print(data_product.selected);
                                return Column(
                                  children: [
                                    ProductBox(
                                      name: data_product.name,
                                      images: data_product.images,
                                      jumlah: data_product.jumlah,
                                      price: data_product.price,
                                      selected: data_product.selected,
                                      selectedTap: () {
                                        chartController.toggleProductSelection(
                                            data_stores.uid_store,
                                            data_product.uid_produk);
                                      },
                                      increase: () {
                                        chartController.increaseProductQuantity(
                                            data_stores.uid_store,
                                            data_product.uid_produk);
                                      },
                                      decrease: () {
                                        if (data_product.jumlah <= 1) {
                                          chartController
                                              .removeProductFromStore(
                                                  data_stores.uid_store,
                                                  data_product);
                                        } else {
                                          chartController
                                              .decreaseProductQuantity(
                                                  data_stores.uid_store,
                                                  data_product.uid_produk);
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Line(width: double.infinity),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    },
                  )))
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
          Obx(() => Row(
                key: UniqueKey(),
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
                      TitleText(text: "Rp ${chartController.total}", size: 12.0)
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  PrimaryButton(
                      title: "Beli (${chartController.jumlahProduct})",
                      press: () {
                        chartController.SelectedList();
                        if (chartController.productSelected.isNotEmpty) {
                          Get.to(CheckoutPage(
                              list: chartController.productSelected));
                        }
                      }),
                ],
              ))
        ]),
      ),
    );
  }
}
