import 'package:FoodCycle/controllers/ChartController.dart';
import 'package:FoodCycle/controllers/HomeController.dart';
import 'package:FoodCycle/models/StoreModel.dart';
import 'package:FoodCycle/view/widgets/buttons/PrimaryButton.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:FoodCycle/view/widgets/text/TitleText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

void showDetailKemasan(BuildContext context, String id) {
  final HomeController homeController = Get.put(HomeController());
  final ChartController chartController = Get.put(ChartController());
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          height: 550,
          child: FutureBuilder(
            future: homeController.fetchDataById(id),
            builder: (context, snapshot) {
              return Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NormalText(
                        text: "Detail", size: 16.0, weight: FontWeight.w500),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.close))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              homeController.dataProductById['gambar']),
                          fit: BoxFit.cover),
                      color: Color(0xffA5A5A5),
                      borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TitleText(text: "Pisang Ambon", size: 20.0),
                    Row(
                      children: [
                        Icon(
                          Iconsax.location5,
                          color: Color(0xffA5A5A5),
                          size: 15,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        NormalText(
                          text: "12 KM",
                          size: 12.0,
                          weight: FontWeight.w400,
                          color: Color(0xffA5A5A5),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Iconsax.box_1,
                          size: 16,
                          color: Color(0xffFEBF4B),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        NormalText(
                          text: "10 Kg",
                          size: 12.0,
                          weight: FontWeight.w500,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Text(
                    homeController.dataProductById['deskripsi'],
                    textAlign: TextAlign.justify,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.manrope(
                      fontSize: 13.0,
                      color: Color(0xffA5A5A5),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Expanded(
                  child: Row(children: [
                    InkWell(
                        onTap: () {
                          final product = Product(
                              uid_produk: id,
                              name: homeController.dataProductById['nama'],
                              price: homeController.dataProductById['harga']
                                  .toDouble(),
                              jumlah: 1);
                          chartController.addProductToStore(
                              homeController.dataStoresById['name'],
                              homeController.dataProductById['nama'],
                              product);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Color(0xff009688),
                              ),
                              shape: BoxShape.circle),
                          child: Icon(
                            Iconsax.bag,
                            size: 18,
                            color: Color(0xff009688),
                          ),
                        )),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                        child:
                            PrimaryButton(title: "Beli Sekarang", press: () {}))
                  ]),
                )
              ]);
            },
          ));
    },
  );
}
