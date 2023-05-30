import 'dart:convert';

class EndUserModel {
  final String id;
  final String email;
  final String? password;

  EndUserModel({
    required this.id,
    required this.email,
    this.password,
  });

  EndUserModel copyWith({
    String? id,
    String? email,
    String? password,
  }) {
    return EndUserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'email': email});
    if (password != null) {
      result.addAll({'password': password});
    }

    return result;
  }

  factory EndUserModel.fromMap(Map<String, dynamic> map) {
    return EndUserModel(
      id: map['id'] ?? '',
      email: map['email'] ?? '',
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EndUserModel.fromJson(String source) =>
      EndUserModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'EndUserModel(id: $id, email: $email, password: $password)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EndUserModel &&
        other.id == id &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ password.hashCode;
}
