class ForgotPasswordRecivedModdel {
  final int statCode;
  final String message;

  ForgotPasswordRecivedModdel({required this.statCode, required this.message});

  factory ForgotPasswordRecivedModdel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordRecivedModdel(
        statCode: json['statCode'], message: json['message']);
  }
  Map<String, dynamic> toJson() => {'statCode': statCode, 'message': message};
}
