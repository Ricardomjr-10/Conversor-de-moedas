import 'dart:convert';
import 'package:conversor_universal_de_moedas/models/currency_model.dart';
import 'package:http/http.dart' as http;

const String apiUrl =
    'https://economia.awesomeapi.com.br/json/last/USD-BRL,EUR-BRL,BTC-BRL';

class CurrencyService {
  Future<List<Currency>> fetchCurrencies() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      return data.values.map((json) {
        return Currency.fromJson(json);
      }).toList();
    } else {
      throw Exception('Falha ao carregar cotações: ${response.statusCode}');
    }
  }
}
