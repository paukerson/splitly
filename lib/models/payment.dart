import 'expense.dart';

class Payment {
  final String id;
  final String groupId;
  final String paidBy;
  final double amountPaid;
  final double billAmount;
  final String currency;
  final List<Expense> expenses;
  final DateTime date;

  Payment({
    required this.id,
    required this.groupId,
    required this.paidBy,
    required this.amountPaid,
    required this.billAmount,
    required this.currency,
    required this.expenses,
    required this.date,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      id: json['id'],
      groupId: json['groupId'],
      paidBy: json['paidBy'],
      amountPaid: json['amountPaid'].toDouble(),
      billAmount: json['billAmount'].toDouble(),
      currency: json['currency'],
      expenses: (json['expenses'] as List).map((i) => Expense.fromJson(i)).toList(),
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'groupId': groupId,
      'paidBy': paidBy,
      'amountPaid': amountPaid,
      'billAmount': billAmount,
      'currency': currency,
      'expenses': expenses.map((e) => e.toJson()).toList(),
      'date': date.toIso8601String(),
    };
  }
}
