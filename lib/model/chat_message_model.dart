class ChatMessageModel {
  final String role;
  final List<ChatPartModel> parts;

  ChatMessageModel({required this.role, required this.parts});

  Map<String, dynamic> toMap() {
    return {"role": role, "parts": parts.map((e) => e.toMap()).toList()};
  }
}

class ChatPartModel {
  final String text;

  ChatPartModel({required this.text});

  Map<String, dynamic> toMap() {
    return {"text": text};
  }
}
