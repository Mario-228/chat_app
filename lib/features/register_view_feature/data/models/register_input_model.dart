class RegisterInputModel {
  final String name;
  final String email;
  final String password;

  RegisterInputModel(
      {required this.name, required this.email, required this.password});

  Map<String, dynamic> toJson() => {
        "Name": name,
        "Email": email,
        "Password": password,
        "ConfirmPassword": password,
        "Phone": "01000000000"
      };
}
