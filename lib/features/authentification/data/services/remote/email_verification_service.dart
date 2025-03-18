import 'dart:convert';

import 'package:eshop/common/constants/apis.dart';
import 'package:eshop/common/constants/keys.dart';
import 'package:eshop/common/utils/services/clients/api_client.dart';

class EmailVerificationService {
  static Future<bool> verifyEmail({required String email}) async {
    try {
      final String url =
          '${Apis.mailBoxLayer}?access_key=${AppKeys.mailBoxLayerKey}&email=$email';
      final response = await ApiClient.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print(data);
        return data['smtp_check'] == true;
      } else {
        return false;
      }
    } catch (e) {
      throw (e.toString());
    }
  }
}
