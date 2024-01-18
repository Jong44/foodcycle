import 'package:FoodCycle/controllers/ChartController.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    calculate();
  }

  final ChartController chartController = Get.put(ChartController());
  var pembayaran = [
    {'name': "Tunai"},
    {
      'name': "BCA",
      'image': 'bca.png',
    },
    {
      'name': "BRI",
      'image': 'bri.png',
    },
    {
      'name': "BNI",
      'image': 'bni.png',
    },
    {
      'name': "Mandiri",
      'image': 'mandiri.png',
    },
    {
      'name': "Dana",
      'image': 'dana.png',
    },
    {
      'name': "Gopay",
      'image': 'gopay.png',
    },
    {
      'name': "Bank Jago",
      'image': 'jago.png',
    },
    {
      'name': "Link Aja",
      'image': 'linkaja.png',
    },
  ];

  var indexPembayaran = 0.obs;
  var subtotal = 0.obs;
  var total = 0.obs;

  void calculate() {
    int jumlah = 0;
    for (var store in chartController.productSelected) {
      jumlah += store.total;
    }
    subtotal.value = jumlah;
    total.value = jumlah + 10000;
  }
}
