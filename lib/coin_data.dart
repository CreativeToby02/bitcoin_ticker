import 'dart:convert';
import 'package:http/http.dart' as http;


const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const bitcoinApi = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future getCoinData(String money) async {
    String currencyData;
    String requestUrl = '$bitcoinApi/BTC/$money?apikey=4773686F-FA52-4231-B6A5-6D613BB6E1F4';
    http.Response response = await http.get(Uri.parse(requestUrl));
    if (response.statusCode == 200) {
      currencyData = response.body;
      var decodedData = jsonDecode(currencyData);
      double rate = decodedData['rate'];
      return rate.toStringAsFixed(0);
    } else {
      print(response.statusCode);
      throw 'problem with request';
    }
  }
}
