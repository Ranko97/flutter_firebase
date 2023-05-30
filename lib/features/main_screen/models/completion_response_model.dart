import 'dart:convert';

import 'package:firestore_app/features/main_screen/models/chat_usage_model.dart';
import 'package:firestore_app/features/main_screen/models/choice_model.dart';
import 'package:flutter/foundation.dart';

class CompletionResponseModel {
  String id;
  String object;
  DateTime created;
  String model;
  List<ChoiceModel> choices;
  ChatUsageModel usage;

  CompletionResponseModel({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
  });

  CompletionResponseModel copyWith({
    String? id,
    String? object,
    DateTime? created,
    String? model,
    List<ChoiceModel>? choices,
    ChatUsageModel? usage,
  }) {
    return CompletionResponseModel(
      id: id ?? this.id,
      object: object ?? this.object,
      created: created ?? this.created,
      model: model ?? this.model,
      choices: choices ?? this.choices,
      usage: usage ?? this.usage,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'object': object});
    result.addAll({'created': created.millisecondsSinceEpoch});
    result.addAll({'model': model});
    result.addAll({'choices': choices.map((x) => x.toMap()).toList()});
    result.addAll({'usage': usage.toMap()});

    return result;
  }

  factory CompletionResponseModel.fromMap(Map<String, dynamic> map) {
    return CompletionResponseModel(
      id: map['id'] ?? '',
      object: map['object'] ?? '',
      created: DateTime.fromMillisecondsSinceEpoch(map['created']),
      model: map['model'] ?? '',
      choices: List<ChoiceModel>.from(
          map['choices']?.map((x) => ChoiceModel.fromMap(x))),
      usage: ChatUsageModel.fromMap(map['usage']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CompletionResponseModel.fromJson(String source) =>
      CompletionResponseModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChatGPTResponseModel(id: $id, object: $object, created: $created, model: $model, choices: $choices, usage: $usage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CompletionResponseModel &&
        other.id == id &&
        other.object == object &&
        other.created == created &&
        other.model == model &&
        listEquals(other.choices, choices) &&
        other.usage == usage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        object.hashCode ^
        created.hashCode ^
        model.hashCode ^
        choices.hashCode ^
        usage.hashCode;
  }
}
