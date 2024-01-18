import 'package:FoodCycle/models/StoreModel.dart';
import 'package:FoodCycle/view/widgets/custom/Line.dart';
import 'package:FoodCycle/view/widgets/form/InputText.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:FoodCycle/view/widgets/text/SubtitleText.dart';
import 'package:FoodCycle/view/widgets/text/TitleText.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';

class CardCheckout extends StatelessWidget {
  final nameToko;
  final jumlahProduk;
  final images;
  final List<Product> listProduct;
  final total;
  const CardCheckout(
      {super.key,
      required this.nameToko,
      required this.jumlahProduk,
      required this.images,
      required this.listProduct,
      required this.total});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(images), fit: BoxFit.cover),
                      shape: BoxShape.circle,
                      color: Color(0xffE8E8E8)),
                ),
                SizedBox(
                  width: 10,
                ),
                TitleText(text: nameToko, size: 13.0)
              ],
            ),
            NormalText(
              text: jumlahProduk.toString() + " Produk",
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
            child: ListView.builder(
              itemCount: listProduct.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
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
                                  image:
                                      NetworkImage(listProduct[index].images),
                                  fit: BoxFit.cover),
                              color: Color(0xffE8E8E8),
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(10))),
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                NormalText(
                                    text: listProduct[index].name,
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
                                      text: "0",
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    NormalText(
                                      text:
                                          "Rp ${listProduct[index].price.toInt()}",
                                      size: 12.0,
                                      weight: FontWeight.w700,
                                      color: Color(0xff009688),
                                    ),
                                    SubtitleText(
                                        text: "${listProduct[index].jumlah}x",
                                        size: 12.0)
                                  ],
                                )
                              ]),
                        ))
                      ],
                    ));
              },
            )),
        SizedBox(
          height: 10,
        ),
        InputText(text: "Catatan", change: (value) {}),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleText(text: "Total : ", size: 13.0),
            NormalText(
              text: "Rp ${total}",
              size: 13.0,
              weight: FontWeight.bold,
              color: Color(0xff009688),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Line(width: double.infinity),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
