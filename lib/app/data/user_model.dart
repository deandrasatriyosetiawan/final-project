class UserModel {
  final String id, name, phoneNumber, email;

  const UserModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.email,
  });

  factory UserModel.fromJson(String id, Map<String, dynamic> json) => UserModel(
        id: id,
        name: json["name"],
        phoneNumber: json["phone_number"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone_number": phoneNumber,
        "email": email,
      };
}
