import 'dart:io';

import 'package:FoodCycle/controllers/HomeController.dart';
import 'package:FoodCycle/controllers/PenyaluranController.dart';
import 'package:FoodCycle/main.dart';
import 'package:FoodCycle/view/components/dialogCustom.dart';
import 'package:FoodCycle/view/widgets/buttons/PrimaryButton.dart';
import 'package:FoodCycle/view/widgets/form/InputNumber.dart';
import 'package:FoodCycle/view/widgets/form/InputText.dart';
import 'package:FoodCycle/view/widgets/text/NormatText.dart';
import 'package:FoodCycle/view/widgets/text/SubtitleText.dart';
import 'package:FoodCycle/view/widgets/text/TitleText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dotted_border/dotted_border.dart';

class FormPenyaluranPage extends StatelessWidget {
  FormPenyaluranPage({super.key});

  final PenyaluranController penyaluranController =
      Get.put(PenyaluranController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: EdgeInsets.symmetric(vertical: 65, horizontal: 24),
          children: [
            Row(
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
                )
              ],
            ),
            SizedBox(
              height: 32,
            ),
            TitleText(text: "Kirim Sampah", size: 24.0),
            SizedBox(
              height: 10,
            ),
            SubtitleText(
                text: "Isikan data dengan lengkap dan benar!", size: 14.0),
            SizedBox(
              height: 32,
            ),
            InputText(
              text: "Nama Lengkap",
              change: ((value) {
                penyaluranController.namaLengkap.value = value;
              }),
            ),
            SizedBox(
              height: 25,
            ),
            InputNumber(
              text: "Nomor Telepon",
              change: ((value) {
                penyaluranController.noTelp.value = value;
              }),
            ),
            SizedBox(
              height: 25,
            ),
            InputText(
              text: "Alamat Lengkap",
              change: ((value) {
                penyaluranController.alamatLengkap.value = value;
              }),
            ),
            SizedBox(
              height: 25,
            ),
            InputNumber(
              text: "Perkiraan Berat",
              change: ((value) {
                penyaluranController.berat.value = int.parse(value).toDouble();
              }),
            ),
            SizedBox(
              height: 25,
            ),
            NormalText(text: "Foto", size: 14.0, weight: FontWeight.w400),
            SizedBox(
              height: 10,
            ),
            Obx(() => InkWell(
                  onTap: () {
                    penyaluranController.openGaleri();
                  },
                  child: DottedBorder(
                    radius: Radius.circular(10),
                    dashPattern: [10],
                    color: Color(0xffA5A5A5),
                    child: penyaluranController.image.value == null
                        ? Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 100,
                            color: Color(0xffF6F7F9),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Iconsax.gallery,
                                    color: Color(0xffA5A5A5),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  NormalText(
                                    text: "PNG, JPG, JPEG (max 10mb)",
                                    size: 12.0,
                                    weight: FontWeight.w400,
                                    color: Color(0xffa5a5a5),
                                  ),
                                ]),
                          )
                        : Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: FileImage(
                                        penyaluranController.image.value!))),
                          ),
                  ),
                ))
          ]),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
                    width: 1, color: Color.fromRGBO(13, 13, 13, 0.10))),
          ),
          padding: EdgeInsets.symmetric(horizontal: 28, vertical: 20),
          child: Container(
            color: Colors.white,
            width: double.infinity,
            child: PrimaryButton(
              press: () {
                if (penyaluranController.namaLengkap.value.isNotEmpty &&
                    penyaluranController.alamatLengkap.value.isNotEmpty &&
                    penyaluranController.noTelp.value.isNotEmpty &&
                    penyaluranController.berat.value != 0 &&
                    penyaluranController.image.value != null) {
                  dialogShow(context, "Apakah Data yang Anda Isi Sudah Benar?",
                      "Jika Anda sudah yakin, maka Kurir akan menjemput sampah ke alamat anda.");
                }
              },
              title: "Kirim",
            ),
          )),
    );
  }
}
