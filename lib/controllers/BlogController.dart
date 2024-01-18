import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BlogController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getBlogs();
  }

  var indexKategori = 0.obs;
  var blogKategori = [
    "Semua",
    "Tutorial",
    "Tips & Trik",
    "Berita",
    "QNA",
  ].obs;

  RxList<Map<String, dynamic>> allDataBlogs = <Map<String, dynamic>>[].obs;

  Future<void> getBlogs() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('blogs').get();

      allDataBlogs.assignAll(querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList());
    } catch (error) {
      print('Error: $error');
    }
  }
}
