import 'package:cryptoproject/Controller/services/get_market_data.dart';
import 'package:cryptoproject/Model/crypto_data_model.dart';
import 'package:flutter/cupertino.dart';

class CryptoDataProvider with ChangeNotifier {
  bool isLoading = true;
  List<CryptoDataModel> cryptoData = [];

  CryptoDataProvider() {
    fetchData();
  }

  Future<void> fetchData() async {
    List<dynamic> markets = await API.getCryptoMarketData();

    List<CryptoDataModel> temp = [];
    for (var market in markets) {
      CryptoDataModel newCrypto = CryptoDataModel.fromJSON(market);
      temp.add(newCrypto);
    }

    cryptoData = temp;
    isLoading = false;
    notifyListeners();
  }
}
