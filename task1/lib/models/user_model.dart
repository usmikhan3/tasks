// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;

  UserModel({
    this.id,
    this.name,
    this.username,
    this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      username: map['username'],
      email: map['email'],
    );
  }
}
