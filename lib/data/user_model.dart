class UserModel {
  final String name;
  final int ballance;

  UserModel({
    required this.name,
    required this.ballance,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['data']['user']['name'] ?? '',
      ballance: map['data']['bill']['ballance']?.toInt() ?? 0,
    );
  }

  @override
  String toString() => 'UserModel(name: $name, ballance: $ballance)';
}
