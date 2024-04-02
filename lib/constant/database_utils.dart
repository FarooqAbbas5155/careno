import 'package:firebase_database/firebase_database.dart';
import '../models/message.dart';
import 'helpers.dart';

var chatref = FirebaseDatabase.instance.ref("chats");

Future<void> sendMessage(Message message, String chatRoomId) async {

  usersRef.doc(message.sender_id).collection("chats").doc(chatRoomId).set({
    "timestamp": message.timestamp,
    "sender": message.sender_id,
    "chatRoomId": chatRoomId,
    "lastMessage":message.text,
    "counter":0
  });
  usersRef.doc(message.receiver_id).collection("chats").doc(chatRoomId).set({
    "timestamp": message.timestamp,
    "sender": message.sender_id,
    "chatRoomId": chatRoomId,
    "lastMessage":message.text,
    "counter":message.counter
  });

  await chatref.child(chatRoomId).child(message.id).set(message.toMap());
}
String get2ndUserId(String chatRoomId, String myId){
  return chatRoomId.replaceAll(myId, "").replaceAll("_", "").trim();
}