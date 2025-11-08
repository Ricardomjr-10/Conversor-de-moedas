import 'package:conversor_universal_de_moedas/models/currency_model.dart';
import 'package:conversor_universal_de_moedas/services/currency_service.dart';
import 'package:flutter/material.dart';

class CurrencyListScreen extends StatelessWidget {
  const CurrencyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cotaçoes em tempo real')),
      body: FutureBuilder<List<Currency>>(
        future: CurrencyService().fetchCurrencies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final currency = snapshot.data![index];
                return ListTile(
                  title: Text('${currency.name} (${currency.code})'),
                  subtitle: Text("Valor de compra R\$ ${currency.bid}"),
                );
              },
            );
          }
          return const Center(child: Text('Nenhuma contação encontrada'));
        },
      ),
    );
  }
}
