import 'dart:convert';

import 'package:firestore_app/features/main_screen/models/message_model.dart';

class ChoiceModel {
  final String? text;
  final int index;
  final String? logprobs;
  final String finishReason;
  final MessageModel message;

  ChoiceModel({
    this.text,
    required this.index,
    this.logprobs,
    required this.finishReason,
    required this.message,
  });

  ChoiceModel copyWith({
    String? text,
    int? index,
    String? logprobs,
    String? finishReason,
    MessageModel? message,
  }) {
    return ChoiceModel(
      text: text ?? this.text,
      index: index ?? this.index,
      logprobs: logprobs ?? this.logprobs,
      finishReason: finishReason ?? this.finishReason,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (text != null) {
      result.addAll({'text': text});
    }
    result.addAll({'index': index});
    if (logprobs != null) {
      result.addAll({'logprobs': logprobs});
    }
    result.addAll({'finish_reason': finishReason});
    result.addAll({'message': message.toMap()});

    return result;
  }

  factory ChoiceModel.fromMap(Map<String, dynamic> map) {
    return ChoiceModel(
      text: map['text'],
      index: map['index']?.toInt() ?? 0,
      logprobs: map['logprobs'],
      finishReason: map['finish_reason'] ?? '',
      message: MessageModel.fromMap(map['message']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChoiceModel.fromJson(String source) =>
      ChoiceModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChoiceModel(text: $text, index: $index, logprobs: $logprobs, finishReason: $finishReason, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChoiceModel &&
        other.text == text &&
        other.index == index &&
        other.logprobs == logprobs &&
        other.finishReason == finishReason &&
        other.message == message;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        index.hashCode ^
        logprobs.hashCode ^
        finishReason.hashCode ^
        message.hashCode;
  }
}
