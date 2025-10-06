import 'package:splitly/models/user.dart';
import 'package:splitly/models/group.dart';
import 'package:splitly/models/payment.dart';
import 'package:splitly/models/expense.dart';

final DUMMY_USERS = [
  User(id: 'u1', name: 'Alice', email: 'alice@example.com'),
  User(id: 'u2', name: 'Bob', email: 'bob@example.com'),
  User(id: 'u3', name: 'Charlie', email: 'charlie@example.com'),
  User(id: 'u4', name: 'David', email: 'david@example.com'),
];

final DUMMY_GROUPS = [
  Group(
    id: 'g1',
    name: 'Trip to Paris',
    members: [DUMMY_USERS[0], DUMMY_USERS[1], DUMMY_USERS[2]],
  ),
  Group(
    id: 'g2',
    name: 'Weekend Getaway',
    members: [DUMMY_USERS[1], DUMMY_USERS[3]],
  ),
  Group(
    id: 'g3',
    name: 'Ski Trip',
    members: [DUMMY_USERS[0], DUMMY_USERS[2], DUMMY_USERS[3]],
  ),
];

final DUMMY_PAYMENTS = [
  Payment(
    id: 'p1',
    groupId: 'g1',
    paidBy: 'u1',
    amountPaid: 120.50,
    billAmount: 110.0,
    currency: 'EUR',
    expenses: [
      Expense(userId: 'u1', amount: 50.0),
      Expense(userId: 'u2', amount: 30.0),
      Expense(userId: 'u3', amount: 30.0),
    ],
    date: DateTime.now().subtract(Duration(days: 2)),
  ),
  Payment(
    id: 'p2',
    groupId: 'g1',
    paidBy: 'u2',
    amountPaid: 80.0,
    billAmount: 75.0,
    currency: 'EUR',
    expenses: [
      Expense(userId: 'u1', amount: 25.0),
      Expense(userId: 'u2', amount: 25.0),
      Expense(userId: 'u3', amount: 25.0),
    ],
    date: DateTime.now().subtract(Duration(days: 1)),
  ),
  Payment(
    id: 'p3',
    groupId: 'g2',
    paidBy: 'u2',
    amountPaid: 200.0,
    billAmount: 180.0,
    currency: 'USD',
    expenses: [
      Expense(userId: 'u2', amount: 100.0),
      Expense(userId: 'u4', amount: 80.0),
    ],
    date: DateTime.now(),
  ),
];
