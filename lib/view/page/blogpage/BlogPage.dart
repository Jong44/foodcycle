import 'package:FoodCycle/controllers/BlogController.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:FoodCycle/view/widgets/text/SubtitleText.dart';
import 'package:FoodCycle/view/widgets/text/TitleText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BlogPage extends StatelessWidget {
  BlogPage({super.key});
  final BlogController blogController = Get.put(BlogController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 50),
          children: [
            TitleText(
              text: "Blog",
              size: 20.0,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 35,
              child: ListView.builder(
                itemCount: blogController.blogKategori.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Obx(() => Row(
                        children: [
                          InkWell(
                            onTap: () {
                              blogController.indexKategori.value = index;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    blogController.indexKategori.value != index
                                        ? Color(0xffF6F7F9)
                                        : Color(0xff009688),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: NormalText(
                                text: blogController.blogKategori[index],
                                weight: FontWeight.w400,
                                color:
                                    blogController.indexKategori.value != index
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
            FutureBuilder(
              future: blogController.getBlogs(),
              builder: (context, snapshot) {
                return Container(
                  height: 270 * blogController.allDataBlogs.length.toDouble(),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: blogController.allDataBlogs.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 20),
                              height: 240,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1, color: Color(0xffe8e8e8))),
                              child: Column(children: [
                                Container(
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(blogController
                                              .allDataBlogs[index]['image'])),
                                      color: Color(0xffe8e8e8),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TitleText(
                                    text: blogController.allDataBlogs[index]
                                        ['title'],
                                    size: 14.0),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SubtitleText(
                                        text: blogController.allDataBlogs[index]
                                            ['date'],
                                        size: 13.0),
                                    Container(
                                      alignment: Alignment.center,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      height: 28,
                                      decoration: BoxDecoration(
                                          color: Color(0xffC7F9E2),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 1,
                                              color: Color(0xff009688))),
                                      child: NormalText(
                                        text: blogController.allDataBlogs[index]
                                            ['category'],
                                        size: 12.0,
                                        weight: FontWeight.w400,
                                        color: Color(0xff009688),
                                      ),
                                    )
                                  ],
                                )
                              ]),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        );
                      }),
                );
              },
            )
          ]),
    );
  }
}
