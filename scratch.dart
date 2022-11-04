import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
//   CoinData coinData = CoinData();
//   for (String currency in currenciesList) {
//     dynamic data = await coinData.getCoinData(currency);
//     print(data);
//   }
double rate = 34.556;
print(rate.toStringAsFixed(0));
}

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

// class CoinData {
//   Future<dynamic> getCoinData(String money) async {
//     String currencyData;
//     http.Response response = await http.get(Uri.parse(
//         'https://rest.coinapi.io/v1/exchangerate/BTC/$money?apikey=4773686F-FA52-4231-B6A5-6D613BB6E1F4'));
//     if (response.statusCode == 200) {
//       currencyData = response.body;
//       return jsonDecode(currencyData);
//     } else {
//       print(response.statusCode);
//     }
//   }
// }
