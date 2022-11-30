import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String username;
  final String email;
  final String createAt;
  final String uid;
  final String profileUrl;
  final String description;
  final String phoneNumber;
  final String quote;

  UserModel({
    required this.username,
    required this.email,
    required this.createAt,
    required this.uid,
    required this.profileUrl,
    required this.description,
    required this.phoneNumber,
    required this.quote,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'createAt': createAt,
      'uid': uid,
      'profileUrl': profileUrl,
      'description': description,
      'phoneNumber': phoneNumber,
      'quote': quote,
    };
  }

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      username: snapshot.get('username'),
      email: snapshot.get('email'),
      createAt: snapshot.get('createAt'),
      uid: snapshot.get('uid'),
      profileUrl: snapshot.get('profileUrl'),
      description: snapshot.get('description'),
      phoneNumber: snapshot.get('phoneNumber'),
      quote: snapshot.get('quote'),
    );
  }
}

class SetupInputModel {
  final String name;
  final String description;
  final String phoneNumber;
  final String quote;

  SetupInputModel({
    required this.name,
    required this.description,
    required this.phoneNumber,
    required this.quote,
  });
}
