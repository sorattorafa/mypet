import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.credential,
    required this.password,
  });

  final String credential;
  final String password;
 

  User copyWith({
    String? credential,
    String? password,
  }) {
    return User(
      credential: credential ?? this.credential,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'credential': credential,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      credential: map['credential'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(credential: $credential, password: $password)';

  @override
  List<Object> get props => [credential, password];
}