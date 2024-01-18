import 'dart:io';

import 'package:FoodCycle/controllers/RegisterController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PenyaluranController extends GetxController {
  final RegisterController registerController = Get.put(RegisterController());
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    namaLengkap.value = "";
    noTelp.value = "";
    alamatLengkap.value = "";
    berat.value = 0;
    image.value = null;
    getPoint();
  }

  var image = Rx<File?>(null);

  var namaLengkap = "".obs;
  var noTelp = "".obs;
  var alamatLengkap = "".obs;
  var berat = 0.0.obs;
  var point = 0.obs;

  Future openCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    image.value = pickedImage != null ? File(pickedImage.path) : null;
  }

  Future openGaleri() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    image.value = pickedImage != null ? File(pickedImage.path) : null;
  }

  Future<void> getPoint() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        point.value = data["point"] ?? 0;
      } else {
        print('Dokumen tidak ditemukan');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> addPoint() async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'name': namaLengkap.value,
      'email': registerController.email.value,
      'no_telepon': registerController.noTelepon.value,
      'katasandi': hashPassword(registerController.katasandi.value),
      'province': registerController.provinceController.selectedItem,
      'regency': registerController.regencyController.selectedItem,
      'district': registerController.districtController.selectedItem,
      'kodepos': registerController.kodepos.value,
      'alamat': registerController.alamat.value,
      'point': 30
    }).then((value) {
      print('User berhasil ditambahkan!');
    }).catchError((error) {
      print('Error: $error');
    });
  }
}
