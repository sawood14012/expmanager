// ignore: file_names
class HistroyModel {
  final String name, sub, date, company;
  final String price;

  HistroyModel(
      {required this.name,
      required this.sub,
      required this.date,
      required this.price,
      required this.company});

  /* Map<String, dynamic> toMap() {
    return {
      'name': name,
      'sub': sub,
      'date': date,
      'price': price,
      'company': company
    };
  } */
  factory HistroyModel.fromJson(Map<String, dynamic> json) {
    return HistroyModel(
        name: json['name'],
        sub: json['sub'],
        date: json['date'],
        price: json['price'],
        company: json['company']);
  }

  @override
  String toString() {
    return 'HistroyModel{name: $name, sub: $sub, date: $date, price: $price, company: $company}';
  }
}
