class UserModel {
  final int id;
  final String name;
  final String description;

  UserModel({
    required this.id,
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  @override
  String toString() => 'User{id: $id, name: $name, description: $description}';
}
