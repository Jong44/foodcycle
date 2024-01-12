import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:FoodCycle/controllers/ProvinceController.dart';
import 'package:FoodCycle/controllers/SendMailController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:crypto/crypto.dart';

String hashPassword(String password) {
  var bytes = utf8.encode(password);
  var digest = sha256.convert(bytes);

  return digest.toString();
}

class RegisterController extends GetxController {
  final SendMailController emailController = Get.put(SendMailController());
  final ProvinceController provinceController = Get.put(ProvinceController());
  final RegencyController regencyController = Get.put(RegencyController());
  final DistrictController districtController = Get.put(DistrictController());
  var controllers = List<TextEditingController>.generate(
      4, (index) => TextEditingController()).obs;
  var focusNodes = List<FocusNode>.generate(4, (index) => FocusNode()).obs;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  var namaLengkap = "".obs;
  var noTelepon = 0.obs;
  var isConfirm = false.obs;
  var email = "".obs;
  var katasandi = "".obs;
  var kodepos = "".obs;
  var alamat = "".obs;
  var kode = "".obs;
  var inputKode = "".obs;
  var isTrueKode = false.obs;

  @override
  void onClose() {
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.onClose();
  }

  void toggleConfirm() {
    isConfirm.toggle();
  }

  void sendMail() {
    String numericCode = (Random().nextInt(10000)).toString().padLeft(4, '0');
    String emailPenerima = email.value;
    emailController.sendEmail(
        name: namaLengkap.value, kode: numericCode, email: emailPenerima);
    kode.value = numericCode;
  }

  void onChanged(int index, String value) {
    if (value.length > 0) {
      if (index < 3) {
        focusNodes[index + 1].requestFocus();
      } else {
        inputKode.value =
            controllers.map((controller) => controller.text).join();
      }
    } else if (index > 0) {
      focusNodes[index - 1].requestFocus();
    }
  }

  Future<void> submitRegister() async {
    if (inputKode.isNotEmpty) {
      if (inputKode == kode.value) {
        try {
          UserCredential userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email.value,
            password: katasandi.value,
          );
          if (userCredential.user != null) {
            _addUser(userCredential.user!.uid);
          }
        } catch (e) {
          print(e.toString());
        }
      }
    }
  }

  void _addUser(String key) {
    _usersCollection.doc(key).set({
      'name': namaLengkap.value,
      'email': email.value,
      'no_telepon': noTelepon.value,
      'katasandi': hashPassword(katasandi.value),
      'province': provinceController.selectedItem,
      'regency': regencyController.selectedItem,
      'district': districtController.selectedItem,
      'kodepos': kodepos.value,
      'alamat': alamat.value
    }).then((value) {
      print('User berhasil ditambahkan!');
    }).catchError((error) {
      print('Error: $error');
    });
  }
}
