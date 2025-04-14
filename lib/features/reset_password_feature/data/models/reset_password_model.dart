class ResetPasswordModel {
  final String email;
  final String password;
  final String code;

  ResetPasswordModel(
      {required this.email, required this.password, required this.code});
  Map<String, dynamic> toJson() {
    return {
      "Email": email,
      "Password": password,
      "ConfirmPassword": password,
      "Code": code
    };
  }
}
