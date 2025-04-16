class TicketFormModel {
  final String topicName;
  final String ticketNumber;
  final String message;
  final int chatId;

  TicketFormModel(
      {required this.topicName,
      required this.ticketNumber,
      required this.message,
      required this.chatId});

  Map<String, dynamic> toJson() {
    return {
      'topic': topicName,
      'ticketNumber': ticketNumber,
      'description': message,
      'createdAt': DateTime.now().toString(),
      'chatId': chatId
    };
  }
}
