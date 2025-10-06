import 'package:splitly/models/user.dart';

class Group {
  final String id;
  final String name;
  final List<User> members;

  Group({required this.id, required this.name, required this.members});

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      id: json['id'],
      name: json['name'],
      members: (json['members'] as List).map((i) => User.fromJson(i)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'members': members.map((m) => m.toJson()).toList(),
    };
  }
}
