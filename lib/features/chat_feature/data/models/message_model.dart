class MessageModel {
  final String displayName;
  final int chatId;
  final String content;

  MessageModel(
      {required this.displayName, required this.chatId, required this.content});

  static MessageModel fromJson(Map<String, dynamic> json) => MessageModel(
        displayName: json["userDisplay"],
        chatId: json["chatId"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() =>
      {"userDisplay": displayName, "chatId": chatId, "content": content};
}
