import 'package:FoodCycle/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var email = "".obs;
  var password = "".obs;
  var isObscure = true.obs;
  var isRemember = false.obs;

  Future<void> loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    isRemember.value = prefs.getBool('isRemembered') ?? false;
    if (isRemember.value) {
      email.value = prefs.getString('email') ?? '';
      password.value = prefs.getString('password') ?? '';
    }
  }

  Future<void> saveCredentials() async {
    if (isRemember.value) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setBool('isRemember', isRemember.value);
      email.value = prefs.getString('email') ?? '';
      password.value = prefs.getString('password') ?? '';
    }
  }

  Future<void> clearCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('isRemember');
    prefs.remove('email');
    prefs.remove('password');
  }

  void togglePassword() {
    isObscure.value = !isObscure.value;
  }

  void rememberAccount() {
    isRemember.toggle();
    if (!isRemember.value) {
      clearCredentials();
    }
    saveCredentials();
  }

  Future<void> submitLogin() async {
    try {
      final ress = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.value, password: password.value);
      Get.to(IndexPage(), transition: Transition.fadeIn);
    } catch (e) {
      print(e);
    }
  }
}
