import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var activeMenu = "Makanan".obs;
  var kategoriMakanan = [
    "Semua",
    "Sayur",
    "Buah",
    "Daging",
    "Roti",
  ].obs;
  var kategoriKemasan = [
    "Semua",
    "Galon Air",
    "Tempat Makan",
    "Kemasan Makanan",
    "Botol",
  ].obs;

  RxInt indexKategoriMakanan = 0.obs;
  RxInt indexKategoriKemasan = 0.obs;

  var username = "".obs;
  var regency = "".obs;
  var district = "".obs;

  Future<void> fetchDataProfile() async {
    var id = FirebaseAuth.instance.currentUser!.uid;
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(id.toString())
          .get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        username.value = data["name"] ?? "";
        regency.value = data["regency"] ?? "";
        district.value = data["district"] ?? "";
      } else {
        print('Dokumen tidak ditemukan');
      }
    } catch (error) {
      // Handle error
      print('Error: $error');
    }
  }

  RxList<Map<String, dynamic>> allDataList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> dataMakanan = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> dataKemasan = <Map<String, dynamic>>[].obs;
  RxMap<dynamic, dynamic> dataProductById = {}.obs as RxMap<dynamic, dynamic>;
  RxMap<dynamic, dynamic> dataStoresById = {}.obs as RxMap<dynamic, dynamic>;

  Future<void> fetchData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('products').get();

      allDataList.assignAll(querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList());

      dataMakanan.assignAll(
          allDataList.where((data) => data['category'] == 'makanan').toList());
      dataKemasan.assignAll(
          allDataList.where((data) => data['category'] == 'kemasan').toList());
    } catch (error) {
      // Handle error
      print('Error: $error');
    }
  }

  Future<void> fetchStoreById(String id) async {
    try {
      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection('stores').doc(id).get();

      if (snapshot.exists) {
        Map<dynamic, dynamic> data = snapshot.data() as Map<String, dynamic>;
        dataStoresById.addAll(Map<dynamic, dynamic>.from(data));
      } else {
        print('Dokumen tidak ditemukan');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> fetchDataById(String id) async {
    try {
      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection('products').doc(id).get();

      if (snapshot.exists) {
        Map<dynamic, dynamic> data = snapshot.data() as Map<String, dynamic>;
        dataProductById.addAll(Map<dynamic, dynamic>.from(data));
        await fetchStoreById(data['id_store']);
      } else {
        print('Dokumen tidak ditemukan');
      }
    } catch (error) {
      // Handle error
      print('Error: $error');
    }
  }
}
