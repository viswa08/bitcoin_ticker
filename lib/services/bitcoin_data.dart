import 'networking.dart';

// const coinAPI = "https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=";
const coinAPI = "https://rest.coinapi.io/v1/exchangerate/BTC/";
const apiKey = "CE4F634A-B636-4BB2-A361-78F362EA19B4";

class BitcoinModel {
  Future<dynamic> getBitcoinUSDData() async {
    NetworkHelper networkHelper = NetworkHelper('${coinAPI}USD?apikey=$apiKey');

    var bitcoinData = await networkHelper.getData();
    return bitcoinData;
  }

  Future<dynamic> getBitcoinData(String? currency) async {
    NetworkHelper networkHelper =
        NetworkHelper('$coinAPI$currency?apikey=$apiKey');

    var bitcoinData = await networkHelper.getData();
    return bitcoinData;
  }
}
