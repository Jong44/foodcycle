import 'package:FoodCycle/controllers/ChartController.dart';
import 'package:FoodCycle/controllers/HomeController.dart';
import 'package:FoodCycle/view/widgets/cards/CardProduct.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MakananView extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  final ChartController chartController = Get.put(ChartController());

  int count = 6;
  MakananView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 35,
          child: ListView.builder(
            itemCount: homeController.kategoriMakanan.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Obx(() => Row(
                    children: [
                      InkWell(
                        onTap: () {
                          homeController.indexKategoriMakanan.value = index;
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: homeController.indexKategoriMakanan.value !=
                                    index
                                ? Color(0xffF6F7F9)
                                : Color(0xff009688),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: NormalText(
                            text: homeController.kategoriMakanan[index],
                            weight: FontWeight.w400,
                            color: homeController.indexKategoriMakanan.value !=
                                    index
                                ? Color(0xff061623)
                                : Colors.white,
                            size: 14.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      )
                    ],
                  ));
            },
          ),
        ),
        Container(
          height: homeController.dataMakanan.length <= 1
              ? 250
              : 250 * (homeController.dataMakanan.length.toDouble() / 2),
          child: FutureBuilder(
              future: homeController.fetchData(),
              builder: (context, snapshot) {
                return GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      mainAxisExtent: 230),
                  itemCount: homeController.dataMakanan.length,
                  itemBuilder: (context, index) {
                    var data = homeController.dataMakanan[index];
                    return CardProduct(
                      id: data['id'],
                      kategori: data['category'],
                      nama: data['nama'],
                      harga: data['harga'],
                      rating: data['rate'],
                      jarak: 2.5,
                      image: data['gambar'],
                    );
                  },
                );
              }),
        )
      ],
    );
  }
}
