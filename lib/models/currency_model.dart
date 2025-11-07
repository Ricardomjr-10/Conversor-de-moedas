class Currency {
  final String code;
  final String name;
  final String bid;

  Currency({required this.code, required this.name, required this.bid});

  factory Currency.fromJson(Map<String, dynamic> json) {
    return Currency(
      code: json['code'] as String,
      name: json['name'] as String,
      bid: double.parse(json['bid'] as String).toString(),
    );
  }
}
