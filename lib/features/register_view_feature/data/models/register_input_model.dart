class RegisterInputModel {
  final String name;
  final String email;
  final String password;

  RegisterInputModel(
      {required this.name, required this.email, required this.password});

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "ConfirmPassword": password,
      };
}
