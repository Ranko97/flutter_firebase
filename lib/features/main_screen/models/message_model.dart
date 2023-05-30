import 'dart:convert';

class MessageModel {
  final String role;
  final String content;

  MessageModel({
    required this.role,
    required this.content,
  });

  MessageModel copyWith({
    String? role,
    String? content,
  }) {
    return MessageModel(
      role: role ?? this.role,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'role': role});
    result.addAll({'content': content});

    return result;
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      role: map['role'] ?? '',
      content: map['content'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source));

  @override
  String toString() => 'MessageModel(role: $role, content: $content)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageModel &&
        other.role == role &&
        other.content == content;
  }

  @override
  int get hashCode => role.hashCode ^ content.hashCode;
}
