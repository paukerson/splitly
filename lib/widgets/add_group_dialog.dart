import 'package:flutter/material.dart';
import 'package:splitly/dummy_data.dart';
import 'package:splitly/models/user.dart';
import 'package:splitly/models/group.dart';

class AddGroupDialog extends StatefulWidget {
  final Function(Group) onGroupAdded;

  AddGroupDialog({required this.onGroupAdded});

  @override
  _AddGroupDialogState createState() => _AddGroupDialogState();
}

class _AddGroupDialogState extends State<AddGroupDialog> {
  final _formKey = GlobalKey<FormState>();
  final _groupNameController = TextEditingController();
  final List<User> _selectedUsers = [];

  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (_selectedUsers.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select at least one member.')),
        );
        return;
      }

      final newGroup = Group(
        id: DateTime.now().toString(),
        name: _groupNameController.text,
        members: _selectedUsers,
      );
      widget.onGroupAdded(newGroup);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Create New Group'),
      content: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _groupNameController,
                  decoration: InputDecoration(labelText: 'Group Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a group name.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text('Select Members', style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: 10),
                Container(
                  height: 200,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: DUMMY_USERS.length,
                    itemBuilder: (ctx, i) {
                      final user = DUMMY_USERS[i];
                      return CheckboxListTile(
                        title: Text(user.name),
                        value: _selectedUsers.contains(user),
                        onChanged: (isSelected) {
                          setState(() {
                            if (isSelected!) {
                              _selectedUsers.add(user);
                            } else {
                              _selectedUsers.remove(user);
                            }
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: Text('Add Group'),
        ),
      ],
    );
  }
}
