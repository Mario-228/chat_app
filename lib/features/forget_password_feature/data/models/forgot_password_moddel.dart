class ForgotPasswordModdel {
  final String email;

  ForgotPasswordModdel({
    required this.email,
  });

  factory ForgotPasswordModdel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordModdel(
      email: json['email'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
