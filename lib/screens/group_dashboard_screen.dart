import 'package:flutter/material.dart';
import 'package:splitly/dummy_data.dart';
import 'package:splitly/models/group.dart';
import 'package:splitly/models/payment.dart';
import 'package:splitly/models/user.dart';

class GroupDashboardScreen extends StatelessWidget {
  final Group group;

  GroupDashboardScreen({required this.group});

  @override
  Widget build(BuildContext context) {
    final groupPayments = DUMMY_PAYMENTS.where((p) => p.groupId == group.id).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(group.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMembersSection(context),
            SizedBox(height: 24),
            _buildBalanceSection(context),
            SizedBox(height: 24),
            _buildPaymentsSection(context, groupPayments),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement Add Payment Dialog
        },
        tooltip: 'Add Payment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildMembersSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Members',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 8),
        Container(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: group.members.length,
            itemBuilder: (ctx, i) {
              final member = group.members[i];
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      child: Text(member.name[0]),
                    ),
                    SizedBox(height: 4),
                    Text(
                      member.name,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBalanceSection(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Balance Summary',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16),
            // This will be replaced with actual calculation logic
            Text(
              'Calculations will be shown here.',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentsSection(BuildContext context, List<Payment> payments) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payments',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: 8),
        payments.isEmpty
            ? Text('No payments yet.')
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: payments.length,
                itemBuilder: (ctx, i) {
                  final payment = payments[i];
                  final paidByUser = DUMMY_USERS.firstWhere((u) => u.id == payment.paidBy);
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text('Paid by ${paidByUser.name}'),
                      subtitle: Text(
                          '${payment.billAmount.toStringAsFixed(2)} ${payment.currency}'),
                      trailing: Text(
                        '${payment.date.day}/${payment.date.month}/${payment.date.year}',
                      ),
                    ),
                  );
                },
              ),
      ],
    );
  }
}
