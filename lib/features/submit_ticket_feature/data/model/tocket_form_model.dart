class TicketFormModel {
  final String topicName;
  final String ticketNumber;
  final int category;
  final String message;
  final int chatId;

  TicketFormModel(
      {required this.topicName,
      required this.ticketNumber,
      required this.category,
      required this.message,
      required this.chatId});

  Map<String, dynamic> toJson() {
    return {
      'topic': topicName,
      'ticketNumber': ticketNumber,
      'categoryId': category,
      'description': message,
      'createdAt': DateTime.now().toString(),
      'chatId': chatId
    };
  }
}
