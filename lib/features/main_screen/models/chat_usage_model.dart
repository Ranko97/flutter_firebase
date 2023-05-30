import 'dart:convert';

class ChatUsageModel {
  final int promptTokens;
  final int completionTokens;
  final int totalTokens;

  ChatUsageModel({
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
  });

  ChatUsageModel copyWith({
    int? promptTokens,
    int? completionTokens,
    int? totalTokens,
  }) {
    return ChatUsageModel(
      promptTokens: promptTokens ?? this.promptTokens,
      completionTokens: completionTokens ?? this.completionTokens,
      totalTokens: totalTokens ?? this.totalTokens,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'prompt_tokens': promptTokens});
    result.addAll({'completion_tokens': completionTokens});
    result.addAll({'total_tokens': totalTokens});

    return result;
  }

  factory ChatUsageModel.fromMap(Map<String, dynamic> map) {
    return ChatUsageModel(
      promptTokens: map['prompt_tokens']?.toInt() ?? 0,
      completionTokens: map['completion_tokens']?.toInt() ?? 0,
      totalTokens: map['total_tokens']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatUsageModel.fromJson(String source) =>
      ChatUsageModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'ChatUsageModel(promptTokens: $promptTokens, completionTokens: $completionTokens, totalTokens: $totalTokens)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChatUsageModel &&
        other.promptTokens == promptTokens &&
        other.completionTokens == completionTokens &&
        other.totalTokens == totalTokens;
  }

  @override
  int get hashCode =>
      promptTokens.hashCode ^ completionTokens.hashCode ^ totalTokens.hashCode;
}
