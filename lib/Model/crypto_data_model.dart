class CryptoDataModel {
  String? id;
  String? symbol;
  String? name;
  String? image;
  double? currentPrice;
  double? marketCap;
  int? marketCapRank;
  double? high24;
  double? low24;
  double? priceChange24;
  double? priceChangePercentage;
  double? circulatingSupply;
  double? ath;
  double? atl;

  CryptoDataModel(
      {required this.id,
      required this.symbol,
      required this.name,
      required this.image,
      required this.currentPrice,
      required this.marketCap,
      required this.marketCapRank,
      required this.high24,
      required this.low24,
      required this.priceChange24,
      required this.priceChangePercentage,
      required this.circulatingSupply,
      required this.ath,
      required this.atl});

  factory CryptoDataModel.fromJSON(Map<String, dynamic> map) {
    return CryptoDataModel(
        id: map["id"],
        symbol: map["symbol"],
        name: map["name"],
        image: map["image"],
        currentPrice: double.parse(map["current_price"].toString()),
        marketCap: map["marketCap"],
        marketCapRank: map["marketCapRank"],
        high24: map["high24"],
        low24: map["low24"],
        priceChange24: double.parse(map["price_change_24h"].toString()),
        priceChangePercentage: map["priceChangePercentage"],
        circulatingSupply: double.parse(map["circulating_supply"].toString()),
        ath: double.parse(map["ath"].toString()),
        atl: double.parse(map["atl"].toString()));
  }
}
