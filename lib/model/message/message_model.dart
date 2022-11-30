import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String messageText;
  final String sentById;
  final String sentAt;
  final bool isSeen;
  final bool isSent;

  MessageModel({
    required this.messageText,
    required this.sentById,
    required this.sentAt,
    required this.isSeen,
    required this.isSent,
  });

  Map<String, dynamic> toMap() {
    return {
      'messageText': messageText,
      'sentById': sentById,
      'sentAt': sentAt,
      'isSeen': isSeen,
      'isSent': isSent,
    };
  }

  factory MessageModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return MessageModel(
      messageText: snapshot.get('messageText'),
      sentById: snapshot.get('sentById'),
      sentAt: snapshot.get('sentAt'),
      isSeen: snapshot.get('isSeen'),
      isSent: snapshot.get('isSent'),
    );
  }
}
