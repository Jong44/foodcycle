import 'dart:async';

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
  var isCountdownRunning = false.obs;

  void calculate() {
    int jumlah = 0;
    for (var store in chartController.productSelected) {
      jumlah += store.total;
    }
    subtotal.value = jumlah;
    total.value = jumlah + 10000;
  }

  var countdown = "10:00".obs;
  late Timer _timer;

  Future startCountdown() async {
    if (!isCountdownRunning.value) {
      isCountdownRunning.value = true;
      Duration duration = Duration(minutes: 10);
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (duration.inSeconds > 0) {
          duration -= Duration(seconds: 1);
          countdown.value = _formatDuration(duration);
        } else {
          _timer.cancel();
          isCountdownRunning.value = false;
          countdown.value = "10:00";
        }
      });
    }
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  void stopCountdown() {
    if (_timer.isActive) {
      _timer.cancel();
    }
  }

  @override
  void onClose() {
    stopCountdown();
    super.onClose();
  }
}
