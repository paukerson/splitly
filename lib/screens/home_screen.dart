import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitly/auth/auth_service.dart';
import 'package:splitly/dummy_data.dart';
import 'package:splitly/models/group.dart';
import 'package:splitly/screens/group_dashboard_screen.dart';
import 'package:splitly/widgets/add_group_dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<Group> _groups;

  @override
  void initState() {
    super.initState();
    _groups = DUMMY_GROUPS;
  }

  void _showAddGroupDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AddGroupDialog(
        onGroupAdded: (newGroup) {
          setState(() {
            _groups.add(newGroup);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groups'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Provider.of<AuthService>(context, listen: false).logout();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _groups.length,
          itemBuilder: (ctx, i) {
            final group = _groups[i];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(15),
                title: Text(
                  group.name,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text('${group.members.length} members'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => GroupDashboardScreen(group: group),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddGroupDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
