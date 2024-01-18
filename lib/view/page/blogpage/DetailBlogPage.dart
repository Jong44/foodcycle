import 'package:FoodCycle/controllers/BlogController.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:FoodCycle/view/widgets/text/SubtitleText.dart';
import 'package:FoodCycle/view/widgets/text/TitleText.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class DetailBlogPage extends StatelessWidget {
  final id;
  DetailBlogPage({super.key, required this.id});
  final BlogController blogController = Get.put(BlogController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: blogController.getBlogsById(id),
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
                        border: Border.all(width: 1, color: Color(0xffE8E8E8)),
                        shape: BoxShape.circle),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TitleText(text: blogController.dataBlogsById['title'], size: 16.0),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubtitleText(
                    text: blogController.dataBlogsById['date'], size: 13.0),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: 28,
                  decoration: BoxDecoration(
                      color: Color(0xffC7F9E2),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1, color: Color(0xff009688))),
                  child: NormalText(
                    text: blogController.dataBlogsById['category'],
                    size: 12.0,
                    weight: FontWeight.w400,
                    color: Color(0xff009688),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 230,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          NetworkImage(blogController.dataBlogsById['image'])),
                  color: Color(0xffe8e8e8),
                  borderRadius: BorderRadius.circular(10)),
            ),
            SizedBox(
              height: 20,
            ),
            TitleText(
              text: "Tahukah Anda",
              size: 14.0,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              blogController.dataBlogsById['deskripsi'],
              textAlign: TextAlign.justify,
              style: GoogleFonts.manrope(color: Color(0xffA5A5A5)),
            )
          ],
        );
      },
    ));
  }
}
