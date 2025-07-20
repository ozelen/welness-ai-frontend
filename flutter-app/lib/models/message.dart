enum MessageType {
  text,
  image,
  voice,
  goal,
  meal,
  workout,
}

enum MessageSender {
  user,
  ai,
}

class ChatMessage {
  final String id;
  final String text;
  final MessageSender sender;
  final MessageType type;
  final DateTime timestamp;
  final Map<String, dynamic>? metadata;

  ChatMessage({
    required this.id,
    required this.text,
    required this.sender,
    this.type = MessageType.text,
    required this.timestamp,
    this.metadata,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      text: json['text'],
      sender: MessageSender.values.firstWhere(
        (e) => e.toString() == 'MessageSender.${json['sender']}',
      ),
      type: MessageType.values.firstWhere(
        (e) => e.toString() == 'MessageType.${json['type']}',
        orElse: () => MessageType.text,
      ),
      timestamp: DateTime.parse(json['timestamp']),
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'sender': sender.toString().split('.').last,
      'type': type.toString().split('.').last,
      'timestamp': timestamp.toIso8601String(),
      'metadata': metadata,
    };
  }

  ChatMessage copyWith({
    String? id,
    String? text,
    MessageSender? sender,
    MessageType? type,
    DateTime? timestamp,
    Map<String, dynamic>? metadata,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      text: text ?? this.text,
      sender: sender ?? this.sender,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      metadata: metadata ?? this.metadata,
    );
  }
} 