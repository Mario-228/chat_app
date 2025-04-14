class TocketFormModel {
  final String name;
  final String email;
  final String service;
  final DateTime date;
  final String message;

  TocketFormModel(
      {required this.name,
      required this.email,
      required this.service,
      required this.date,
      required this.message});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'service': service,
      'date': date,
      'message': message
    };
  }
}
