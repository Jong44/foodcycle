import 'dart:convert';

import 'package:FoodCycle/view/page/auth/register/VerificationCode.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SendMailController extends GetxController {
  Future sendEmail({
    required String name,
    required String kode,
    required String email,
  }) async {
    final serviceId = 'service_5nqweag';
    final templateId = 'template_accksh8';
    final userId = 'niBATWWZVDtAvFtm9';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json'
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'to_name': name,
          'kode': kode,
          'user_email': email,
        }
      }),
    );
    if (response.statusCode == 200) {
      Get.to(VerificationPage(), transition: Transition.leftToRight);
    }
  }
}
