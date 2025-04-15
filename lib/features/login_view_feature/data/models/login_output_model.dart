class LoginOutputModel {
  final String id;
  final String displayName;
  final String email;
  final String emailConfirmed;
  final String phoneNumber;
  final String phoneNumberConfirmed;
  final String pictureUrl;
  final String gender;
  final String dBirth;
  final String token;
  final String refreshToken;
  final String refreshTokenExpiryTime;
  final String address;
  final String role;

  LoginOutputModel({
    required this.id,
    required this.displayName,
    required this.email,
    required this.emailConfirmed,
    required this.phoneNumber,
    required this.phoneNumberConfirmed,
    required this.pictureUrl,
    required this.gender,
    required this.dBirth,
    required this.token,
    required this.refreshToken,
    required this.refreshTokenExpiryTime,
    required this.address,
    required this.role,
  });

  factory LoginOutputModel.fromJson(Map<String, dynamic> json) =>
      LoginOutputModel(
        id: json['id'] ?? '',
        displayName: json['displayName'] ?? '',
        email: json['email'] ?? '',
        emailConfirmed: json['emailConfimed'] ?? '',
        phoneNumber: json['phoneNumber'] ?? '',
        phoneNumberConfirmed: json['phoneNumberConfirmed'] ?? '',
        pictureUrl: json['pictureUrl'] ?? '',
        gender: json['gender'] ?? '',
        dBirth: json['dBirth'] ?? '',
        token: json['token'] ?? '',
        refreshToken: json['refreshToken'] ?? '',
        refreshTokenExpiryTime: json['refreshTokenExpiryTime'] ?? '',
        address: json['address'] ?? '',
        role: json['role'] ?? 'Customer',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'displayName': displayName,
        'email': email,
        'emailConfimed': emailConfirmed,
        'phoneNumber': phoneNumber,
        'phoneNumberConfirmed': phoneNumberConfirmed,
        'pictureUrl': pictureUrl,
        'gender': gender,
        'dBirth': dBirth,
        'token': token,
        'refreshToken': refreshToken,
        'refreshTokenExpiryTime': refreshTokenExpiryTime,
        'address': address,
        'role': role
      };
}
