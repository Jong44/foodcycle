import 'package:FoodCycle/controllers/ChartController.dart';
import 'package:FoodCycle/view/page/productpage/DetailPageKemasan.dart';
import 'package:FoodCycle/view/page/productpage/DetailPageMakanan.dart';
import 'package:FoodCycle/view/widgets/custom/Line.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:FoodCycle/view/widgets/text/TitleText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CardProduct extends StatelessWidget {
  final kategori;
  final nama;
  final harga;
  final rating;
  final jarak;
  final berat;
  final image;
  final id;
  final ChartController controller = Get.put(ChartController());
  CardProduct(
      {super.key,
      required this.id,
      required this.kategori,
      required this.nama,
      required this.harga,
      this.rating,
      this.berat,
      required this.jarak,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (kategori == "makanan") {
          Get.to(DetailPageMakanan(id: id));
        } else {
          showDetailKemasan(context, id);
        }
      },
      child: Container(
        width: double.infinity,
        child: Column(children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
                color: Color(0xffF6F7F9),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(image)),
                borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                  border: Border.fromBorderSide(
                      BorderSide(color: Color(0xffE8E8E8)))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleText(
                    text: nama,
                    size: 14.0,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        text: jarak.toString() + " KM",
                        size: 12.0,
                        weight: FontWeight.w400,
                        color: Color(0xffA5A5A5),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xffA5A5A5)),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      kategori == "makanan"
                          ? Row(
                              children: [
                                Icon(
                                  Iconsax.star1,
                                  size: 16,
                                  color: Color(0xffFEBF4B),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                NormalText(
                                  text: rating.toString(),
                                  size: 12.0,
                                  weight: FontWeight.w400,
                                  color: Color(0xffA5A5A5),
                                )
                              ],
                            )
                          : Row(
                              children: [
                                Icon(
                                  Iconsax.box_1,
                                  size: 16,
                                  color: Color(0xffFEBF4B),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                NormalText(
                                  text: berat.toString() + " Kg",
                                  size: 12.0,
                                  weight: FontWeight.w500,
                                )
                              ],
                            )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Line(width: double.infinity),
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      NormalText(
                        text: "Rp " + harga.toString(),
                        size: 14.0,
                        weight: FontWeight.w600,
                        color: Color(0xff009688),
                      ),
                      InkWell(
                        onTap: () {
                          controller.chartAdd();
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(left: 16),
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                              color: Color(0xff061623), shape: BoxShape.circle),
                          child: Icon(
                            Iconsax.bag5,
                            size: 15,
                            color: Color(0xffFEBF4B),
                          ),
                        ),
                      )
                    ],
                  ))
                ],
              )),
        ]),
      ),
    );
  }
}
