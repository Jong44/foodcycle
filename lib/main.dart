import 'package:FoodCycle/view/page/auth/LoginPage.dart';
import 'package:FoodCycle/view/page/blogpage/BlogPage.dart';
import 'package:FoodCycle/view/page/homepage/HomePage.dart';
import 'package:FoodCycle/view/page/penyaluranpage/PenyaluranPage.dart';
import 'package:FoodCycle/view/page/profilepage/ProfilePage.dart';
import 'package:FoodCycle/view/page/riwayatpage/RiwayatPage.dart';
import 'package:FoodCycle/view/page/splashscreen/SplashScreen.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff009688),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  List page = [
    HomePage(),
    BlogPage(),
    RiwayatPage(),
    ProfilePage(),
  ];

  int indexPage = 0;

  Color deactiveColor = Color(0xffa5a5a5);
  Color activeColor = Color(0xff009688);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: page[indexPage],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: InkWell(
          onTap: () {
            setState(() {
              Get.to(PenyaluranPage());
            });
          },
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Color(0xffFEBF4B),
              shape: BoxShape.circle,
            ),
            child: Image.asset("assets/plant.png"),
          ),
        ),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(
                      width: 1, color: Color.fromRGBO(13, 13, 13, 0.10)))),
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    setState(() {
                      indexPage = 0;
                    });
                  },
                  child: Container(
                    width: 49,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            indexPage != 0 ? Iconsax.home : Iconsax.home_15,
                            color: indexPage != 0 ? deactiveColor : activeColor,
                          ),
                          NormalText(
                            text: "Home",
                            size: 12.0,
                            weight: indexPage != 0
                                ? FontWeight.w500
                                : FontWeight.bold,
                            color:
                                indexPage != 0 ? deactiveColor : Colors.black,
                          )
                        ]),
                  )),
              InkWell(
                  onTap: () {
                    setState(() {
                      indexPage = 1;
                    });
                  },
                  child: Container(
                    width: 48,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            indexPage != 1
                                ? Iconsax.book_square
                                : Iconsax.book_square,
                            color: indexPage != 1 ? deactiveColor : activeColor,
                          ),
                          NormalText(
                            text: "Blog",
                            size: 12.0,
                            weight: indexPage != 1
                                ? FontWeight.w500
                                : FontWeight.bold,
                            color:
                                indexPage != 2 ? deactiveColor : Colors.black,
                          )
                        ]),
                  )),
              SizedBox(
                width: 15,
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      indexPage = 2;
                    });
                  },
                  child: Container(
                    width: 48,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            indexPage != 2
                                ? Iconsax.note_text
                                : Iconsax.note_text5,
                            color: indexPage != 2 ? deactiveColor : activeColor,
                          ),
                          NormalText(
                            text: "Riwayat",
                            size: 12.0,
                            weight: indexPage != 2
                                ? FontWeight.w500
                                : FontWeight.bold,
                            color:
                                indexPage != 2 ? deactiveColor : Colors.black,
                          )
                        ]),
                  )),
              InkWell(
                  onTap: () {
                    setState(() {
                      indexPage = 3;
                    });
                  },
                  child: Container(
                    width: 48,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            indexPage != 3
                                ? Iconsax.profile_circle
                                : Iconsax.profile_circle5,
                            color: indexPage != 3 ? deactiveColor : activeColor,
                          ),
                          NormalText(
                            text: "Profile",
                            size: 12.0,
                            weight: indexPage != 3
                                ? FontWeight.w500
                                : FontWeight.bold,
                            color:
                                indexPage != 3 ? deactiveColor : Colors.black,
                          )
                        ]),
                  )),
            ],
          ),
        ));
  }
}
