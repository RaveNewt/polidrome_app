class UserModel {
  String? id;
  String? email;
  String? first_name;
  String? last_name;
  String? avatar;
  UserModel(
      {this.id, this.email, this.first_name, this.last_name, this.avatar});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    email = json['email'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    avatar = json['avatar'];
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': first_name,
      'last_name': last_name,
      'avatar': avatar,
    };
  }
}
