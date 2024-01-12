import 'package:FoodCycle/controllers/ChartController.dart';
import 'package:FoodCycle/controllers/HomeController.dart';
import 'package:FoodCycle/services/Capitalize.dart';
import 'package:FoodCycle/view/page/chartpage/CharPage.dart';
import 'package:FoodCycle/view/page/homepage/Kemasan.dart';
import 'package:FoodCycle/view/page/homepage/Makanan.dart';
import 'package:FoodCycle/view/widgets/buttons/CircleIconButton.dart';
import 'package:FoodCycle/view/widgets/cards/CardProduct.dart';
import 'package:FoodCycle/view/widgets/custom/Location.dart';
import 'package:FoodCycle/view/widgets/custom/Search.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:FoodCycle/view/widgets/text/SubtitleText.dart';
import 'package:FoodCycle/view/widgets/text/TitleText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController homeController = Get.put(HomeController());
  final ChartController chartController = Get.put(ChartController());
  var username = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.fetchDataProfile();
    username = homeController.username.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: username.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 50),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TitleText(text: "Hai, ${username}", size: 18.0),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        LocationCustom(
                          regency: capitalize(homeController.regency.value),
                          district: capitalize(homeController.district.value),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            CircleIconButton(
                              press: () {},
                              border: Border.all(
                                  width: 1, color: Color(0xffE8E8E8)),
                              icon: Icon(
                                Iconsax.message4,
                                size: 18,
                              ),
                            ),
                            Positioned(
                                bottom: 20,
                                right: 5,
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                  child: NormalText(
                                    weight: FontWeight.w500,
                                    color: Colors.white,
                                    size: 9.0,
                                    text: "1",
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Obx(() => Stack(
                              children: [
                                CircleIconButton(
                                  press: () {
                                    Get.to(ChartPage());
                                  },
                                  border: Border.all(
                                      width: 1, color: Color(0xffE8E8E8)),
                                  icon: Icon(
                                    Iconsax.bag,
                                    size: 18,
                                  ),
                                ),
                                chartController.notif.value > 0
                                    ? Positioned(
                                        bottom: 20,
                                        right: 5,
                                        child: Container(
                                          alignment: Alignment.center,
                                          width: 15,
                                          height: 15,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle),
                                          child: NormalText(
                                            weight: FontWeight.w500,
                                            color: Colors.white,
                                            size: 9.0,
                                            text: chartController.notif.value
                                                .toString(),
                                          ),
                                        ))
                                    : SizedBox()
                              ],
                            ))
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Obx(() => Container(
                      height: 60,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xffF6F7F9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(children: [
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            homeController.activeMenu.value = "Makanan";
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color:
                                    homeController.activeMenu.value == "Kemasan"
                                        ? Colors.transparent
                                        : Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xffFEBF4B)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  NormalText(
                                      text: "Makanan",
                                      size: 14.0,
                                      weight: FontWeight.w400)
                                ]),
                          ),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            homeController.activeMenu.value = "Kemasan";
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color:
                                    homeController.activeMenu.value == "Makanan"
                                        ? Colors.transparent
                                        : Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Color(0xff009688)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  NormalText(
                                      text: "Kemasan",
                                      size: 14.0,
                                      weight: FontWeight.w400)
                                ]),
                          ),
                        )),
                      ]),
                    )),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Color(0xff009688),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 250,
                            child: Text(
                              "Ubah Sampah Organik Menjadi Pupuk",
                              style: GoogleFonts.manrope(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          NormalText(
                            text: "Tukarkan Sampahmu menjadi point",
                            size: 12.0,
                            color: Colors.white,
                            weight: FontWeight.normal,
                          ),
                          SizedBox(
                            height: 19,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  backgroundColor: Color(0xffFEBF4B)),
                              onPressed: () {},
                              child: NormalText(
                                text: "Selengkapnya",
                                weight: FontWeight.w600,
                                size: 13.0,
                              )),
                        ],
                      ),
                    ),
                    Positioned(
                        top: 0,
                        right: -70,
                        bottom: 0,
                        child: Image.asset(
                          "assets/hands.png",
                          width: 220,
                        ))
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                InputSearch(),
                SizedBox(
                  height: 20,
                ),
                Obx(() => homeController.activeMenu == "Makanan"
                    ? MakananView()
                    : KemasanView())
              ],
            ),
    );
  }
}
