class Expense {
  final String userId;
  final double amount;

  Expense({required this.userId, required this.amount});

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      userId: json['userId'],
      amount: json['amount'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'amount': amount,
    };
  }
}
