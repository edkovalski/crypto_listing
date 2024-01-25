import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'API/apis.dart';

class API {
  static Future getCryptoMarketData() async {
    final api = Uri.parse(cryptoMarketDataAPI);
    try {
      var response = await http
          .get(api, headers: {'Content-Type': 'application/json'}).timeout(
              const Duration(seconds: 60), onTimeout: () {
        throw TimeoutException('Connection Timed out');
      });
      switch (response.statusCode) {
        case 200:
          var decodedResponse = jsonDecode(response.body);
          List<dynamic> products = decodedResponse as List<dynamic>;
          return products;
      }
    } on Exception catch (_) {
      rethrow;
    }
  }
}
