// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      username: json['username'] as String,
      email: json['email'] as String,
      createAt: json['createAt'] as String,
      uid: json['uid'] as String,
      profileUrl: json['profileUrl'] as String,
      description: json['description'] as String,
      phoneNumber: json['phoneNumber'] as String,
      quote: json['quote'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'createAt': instance.createAt,
      'uid': instance.uid,
      'profileUrl': instance.profileUrl,
      'description': instance.description,
      'phoneNumber': instance.phoneNumber,
      'quote': instance.quote,
    };
