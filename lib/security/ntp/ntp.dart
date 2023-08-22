import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NTPApi {
  static Future<String?> getNtp(BuildContext context) async {
    String? check;

    final baseDio = Dio(
      BaseOptions(
        baseUrl: "https://www.wowme.tech/api",
        connectTimeout: const Duration(milliseconds: 6000),
        receiveTimeout: const Duration(milliseconds: 6000),
      ),
    );
    baseDio.options.headers['Content-Type'] = "application/json";
    try {
      final Response response =
          await baseDio.get("/v1/user/application/server/time");
      final responseData = response.data as Map<String, dynamic>;

      if (!responseData['error']) {
        check = responseData['data'];
      } else {
        check = null;
      }
    } catch (e) {
      check = null;
    }

    return check;
  }
}

class NTPDate with ChangeNotifier {
  DateTime? now;

  void updateNTPDate(String? value) {
    if (value != null) {
      now = DateTime.parse(value);
    }
    now = null;

    notifyListeners();
  }
}
