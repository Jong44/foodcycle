import 'package:FoodCycle/controllers/ChartController.dart';
import 'package:FoodCycle/controllers/HomeController.dart';
import 'package:FoodCycle/models/StoreModel.dart';
import 'package:FoodCycle/view/widgets/buttons/CircleIconButton.dart';
import 'package:FoodCycle/view/widgets/buttons/PrimaryButton.dart';
import 'package:FoodCycle/view/widgets/custom/Line.dart';
import 'package:FoodCycle/view/widgets/text/ButtonText.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:FoodCycle/view/widgets/text/SubtitleText.dart';
import 'package:FoodCycle/view/widgets/text/TitleText.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class DetailPageMakanan extends StatelessWidget {
  final id;
  DetailPageMakanan({super.key, required this.id});
  final HomeController homeController = HomeController();
  final ChartController chartController = ChartController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: homeController.fetchDataById(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: CircularProgressIndicator(
                  color: Color(0xff009688),
                ));
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return ListView(
                  padding: EdgeInsets.symmetric(vertical: 65, horizontal: 24),
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
                                border: Border.all(
                                    width: 1, color: Color(0xffE8E8E8)),
                                shape: BoxShape.circle),
                          ),
                        ),
                        TitleText(text: "Detail", size: 18.0),
                        InkWell(
                          onTap: () => Get.back(),
                          child: Container(
                            width: 45,
                            height: 45,
                            child: Icon(Iconsax.heart),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: Color(0xffE8E8E8)),
                                shape: BoxShape.circle),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  homeController.dataProductById['gambar']),
                              fit: BoxFit.cover),
                          color: Color(0xffA5A5A5),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      height: 100,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(homeController
                                        .dataProductById['gambar']),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Color(0xffA5A5A5),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            Container(
                              width: 80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(homeController
                                          .dataProductById['gambar']),
                                      fit: BoxFit.cover),
                                  color: Color(0xffA5A5A5),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            Container(
                              width: 80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(homeController
                                        .dataProductById['gambar']),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Color(0xffA5A5A5),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            Container(
                              width: 80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(homeController
                                        .dataProductById['gambar']),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Color(0xffA5A5A5),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TitleText(
                            text: homeController.dataProductById['nama'],
                            size: 20.0),
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
                              Iconsax.star1,
                              size: 17,
                              color: Color(0xffFEBF4B),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            NormalText(
                              text: homeController.dataProductById['rate']
                                  .toString(),
                              size: 12.0,
                              weight: FontWeight.w400,
                              color: Color(0xffA5A5A5),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        NormalText(
                          text: "Rp " +
                              homeController.dataProductById['harga']
                                  .toString(),
                          size: 16.0,
                          weight: FontWeight.w800,
                          color: Color(0xff009688),
                        ),
                        SubtitleText(
                          text:
                              " / " + homeController.dataProductById['satuan'],
                          size: 14.0,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            homeController.dataProductById['deskripsi'],
                            textAlign: TextAlign.justify,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.manrope(
                              fontSize: 13.0,
                              color: Color(0xffA5A5A5),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Line(width: double.infinity),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(homeController
                                          .dataStoresById['images'])),
                                  color: Color(0xffA5A5A5),
                                  shape: BoxShape.circle),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TitleText(
                                    text: homeController.dataStoresById['name'],
                                    size: 12.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Iconsax.location5,
                                      color: Color(0xffA5A5A5),
                                      size: 15,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    SubtitleText(
                                        text: "Jl. Ahmad Yani No. 11",
                                        size: 12.0)
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        CircleIconButton(
                          press: () {},
                          border:
                              Border.all(width: 1, color: Color(0xffE8E8E8)),
                          icon: Icon(
                            Iconsax.message4,
                            size: 18,
                            color: Color(0xff009688),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Line(width: double.infinity),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TitleText(text: "Ulasan", size: 14.0),
                            SizedBox(
                              width: 5,
                            ),
                            NormalText(
                              text: "(0)",
                              size: 13.0,
                              weight: FontWeight.w500,
                              color: Color(0xff009688),
                            )
                          ],
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Lainnya",
                              style: GoogleFonts.manrope(
                                  color: Color(0xffFEBF4B), fontSize: 13.0),
                            ))
                      ],
                    )
                  ],
                );
              }
            }),
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                      width: 1, color: Color.fromRGBO(13, 13, 13, 0.10)))),
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Row(children: [
            InkWell(
                onTap: () {
                  final product = Product(
                      uid_produk: id,
                      name: homeController.dataProductById['nama'],
                      price: homeController.dataProductById['harga'].toDouble(),
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
              width: 20,
            ),
            Expanded(child: PrimaryButton(title: "Beli Sekarang", press: () {}))
          ]),
        ));
  }
}
