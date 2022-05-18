class Wallet {
  final int? id;
  final String description;
  final DateTime date;
  final double income;
  final double expense;
  final int? category;

  Wallet({
    this.id,
    required this.description,
    required this.date,
    required this.income,
    required this.expense,
    required this.category,
  });

  factory Wallet.fromMap(Map<String, dynamic> json) => Wallet(
        id: json['id'],
        description: json['description'],
        date: json['date'],
        income: json['income'],
        expense: json['expense'],
        category: json['category'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'date': date,
      'income': income,
      'expense': expense,
      'category': category,
    };
  }
}
