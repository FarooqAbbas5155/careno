import 'package:careno/constant/colors.dart';
import 'package:careno/constant/database_utils.dart';
import 'package:careno/widgets/custom_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../constant/fcm.dart';
import '../../../constant/firebase_utils.dart';
import '../../../constant/helpers.dart';
import '../../../models/message.dart';
import 'package:careno/models/user.dart' as model;

import '../../../widgets/not_found.dart';
import '../layouts/item_user_chat.dart';
class ScreenUserChat extends StatefulWidget {
  model.User? user;
  int? counter;
  String? chatRoomId;
  int? timeStamp;
  @override
  State<ScreenUserChat> createState() => _ScreenUserChatState();

  ScreenUserChat({
     this.user,
    this.counter,
    this.chatRoomId,
    this.timeStamp,
  });
}

class _ScreenUserChatState extends State<ScreenUserChat> {

  late TextEditingController messageController = TextEditingController();
  final _scrollController = ScrollController();
  late var chatRoomId = "";
  // late Stream<DatabaseEvent> stream;
  bool isActive=false;
  late Stream<DatabaseEvent> stream = Stream.empty();

  @override
  void initState() {
    stream = chatref
        .child(chatRoomId)
        .onValue;
    // _subscription = stream?.listen((event) {});

    print("chatRoom: $chatRoomId");
    setState(() {});
    super.initState();
    clearCounter();
  }
    Future<bool> checkUser() async {
      var exist = await usersRef.doc(FirebaseUtils.myId)
          .collection('chats')
          .doc("${widget.user!.uid}_${FirebaseUtils.myId}")
          .get();
      return exist.exists;
    }

    Future<void> checkCondition() async {
      if (chatRoomId == '') {
        bool userExists = await checkUser();
        if (userExists) {
          chatRoomId = "${widget.user!.uid}_${FirebaseUtils.myId}";
          // clearCounter();

        } else {
          chatRoomId = "${FirebaseUtils.myId}_${widget.user!.uid}";
        }
      } else {
        chatRoomId = widget.chatRoomId!;
      }
    }
    //
    // Future<String> roomId() async {
    //   String _roomId = '';
    //   bool check = await checkRoomId();
    //   if (check) {
    //     _roomId = "${widget.user.uid}_${FirebaseUtils.myId}";
    //   } else {
    //     _roomId = "${FirebaseUtils.myId}_${widget.user.uid}";
    //   }
    //   return _roomId;
    // }
    //
    // Future<bool> checkRoomId() async {
    //   DocumentSnapshot userSnapshot=await usersRef
    //       .doc(FirebaseUtils.myId)
    //       .collection("chats")
    //       .doc("${widget.user.uid}_${FirebaseUtils.myId}")
    //       .get();
    //   DocumentSnapshot mySnapshot=await usersRef
    //       .doc(FirebaseUtils.myId)
    //       .collection("chats")
    //       .doc("${FirebaseUtils.myId}_${widget.user.uid}")
    //       .get();
    //   if (userSnapshot.exists) {
    //     return userSnapshot.exists;
    //   }
    //
    //   return mySnapshot.exists;
    // }

    Future<void> clearCounter() async {
      try {
        DocumentReference chatRef = usersRef
            .doc(FirebaseUtils.myId)
            .collection("chats")
            .doc(chatRoomId);

        DocumentSnapshot chatSnapshot = await chatRef.get();

        if (chatSnapshot.exists) {
          await chatRef.update({"counter": 0});
        } else {
          // Handle case when document is not found
          print("Document not found: $chatRoomId");
        }
      } catch (error) {
        // Handle error
        print("Error clearing counter: $error");
      }
    }

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(widget.timeStamp!);
    String formattedDateTime = DateFormat('hh:mm a').format(dateTime);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        elevation: 3,
        leadingWidth: 75.w,
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 10.w,),
              CustomSvg(name: "arrow",),

              Expanded(
                child: CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(widget.user!.imageUrl)
                ),
              ),

            ],
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(widget.user!.name,style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.sp
            ),),
            Text("Last Seen ${formattedDateTime}",style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(.4)
            ),),
          ],
        ),
        actions: [
          PopupMenuButton(
            icon:CustomSvg(name: "more",),
            color: Colors.white,
            itemBuilder: (BuildContext context) {
              return ['Block User', 'Clear Chat',].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice,style: TextStyle(color: Color(0xFF272727),fontFamily: "Urbanist",fontSize: 11.sp,fontWeight: FontWeight.w600),),
                );
              }).toList();
            },
            onSelected: (String choice) {

            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: StreamBuilder<DatabaseEvent>(
                stream: stream,
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data == null) {
                    return Center(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: AppColors.appPrimaryColor,
                        strokeWidth: 1,
                      ),
                    );
                  }

                  var data = snapshot.data!.snapshot.value;
                  if (data == null) {
                    return Center(
                      child: NotFound(
                        message: "No Messages",
                        color: AppColors.appPrimaryColor,
                      ),
                    );
                  }
                  clearCounter();
                  List<Message> messages = snapshot.data!.snapshot.children
                      .map((e) => Message.fromMap(
                    Map<String, dynamic>.from(e.value as dynamic),
                  ))
                      .toList();
                  messages.sort((b, a) => a.timestamp.compareTo(b.timestamp));
                  return (messages.isNotEmpty)
                      ? Builder(
                    builder: (context) {
                      // Group messages by date
                      Map<String, List<Message>> groupedMessages =
                      groupMessagesByDate(messages);

                      return ListView.builder(
                        controller: _scrollController,
                        itemCount: groupedMessages.length + 1,
                        reverse: true,
                        itemBuilder: (context, index) {
                          if (index == groupedMessages.length) {
                            return SizedBox(
                              height: 10,
                            );
                          }

                          // Get messages for the current date group
                          String currentDate = groupedMessages.keys.elementAt(index);
                          List<Message> currentMessages = groupedMessages[currentDate]!;
                          var message = currentMessages.last; // Get the last message in the group

                          // Determine the display date based on the last message
                          String displayDate = getDisplayDate(DateTime.fromMillisecondsSinceEpoch(message.timestamp));

                          return  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 16,
                                ),
                                child: Text(
                                  displayDate,
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: currentMessages.length,
                                itemBuilder: (context, messageIndex) {
                                  var message = currentMessages.reversed.toList()[messageIndex];
                                  return GestureDetector(
                                    onTap: () {
                                      // Handle tap on chat message
                                    },
                                    child: ItemUserChat(message: message, displayDate: displayDate),
                                  );
                                },
                              ),
                            ],
                          );

                        },
                      );

                    },
                  )
                      : Center(
                    child: Text(
                      "No Messages",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: SizedBox(
                height: 48.h,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Write something...",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Color(0xFFC6C4CC)
                    ),
                    border: InputBorder.none,
                    fillColor: Color(0xFFF2F2F2),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),

                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    errorText: isMessageValid ? null :"Sharing contact not allowed",

                  ),

                ),
              )),
              GestureDetector(
                onTap: (){
                  if (isMessageValid) {
                    setState((){
                      if (widget.counter==null) {
                        widget.counter=1;
                      }
                      else{
                        widget.counter=widget.counter!+ 1;

                      }
                    });
                    String text = messageController.text;
                    int timestamp =
                        DateTime.now().millisecondsSinceEpoch;
                    if (text.isNotEmpty) {
                      var message = Message(
                        id: timestamp.toString(),
                        timestamp: timestamp,
                        text: text,
                        sender_id: FirebaseUtils.myId,
                        receiver_id: widget.user!.uid,
                        message_type: "text",
                        counter: widget.counter!,
                      );
                      messageController.clear();
                      sendMessage(message, chatRoomId)
                          .catchError((error) {
                        Get.snackbar("Message", error.toString());
                      }).then((value) {
                        animateToLastMessage(300);

                        FCM.sendMessageSingle(
                            "New Message",
                            message.text,
                            widget.user!.notificationToken.toString(),
                            {});
                      }).then((value) {
                        print(value);
                      });
                    }
                  }

                },
                child: Container(
                    height: 48.h,
                    margin: EdgeInsets.only(left: 10.w
                    ),
                    width: 48.w,
                    // padding: EdgeInsets.all(10.r),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.appPrimaryColor,
                        borderRadius: BorderRadius.circular(8.r)
                    ),
                    child: CustomSvg(name: "ic_Send",)),
              ),
            ],
          ).marginOnly(bottom: 16.h,left: 16.w,right: 16.w),

        ],
      ),
    ));
  }
  bool isMessageValid = true;

  void validateMessage(String message) {
    setState(() {
      isMessageValid = ChatValidator.isMessageValid(message);
    });
  }

  void animateToLastMessage(int animateMillis) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        final lastMessageOffset = _scrollController.position.minScrollExtent;
        _scrollController.animateTo(
          lastMessageOffset,
          duration: Duration(milliseconds: animateMillis),
          curve: Curves.easeInOut,
        );
      }
    });
  }
  Map<String, List<Message>> groupMessagesByDate(List<Message> messages) {
    Map<String, List<Message>> groupedMessages = {};

    for (var message in messages) {
      // Convert timestamp to DateTime object
      DateTime dateTime =
      DateTime.fromMillisecondsSinceEpoch(message.timestamp);

      // Format the date (e.g., "2023-07-12")
      String formattedDate = "${dateTime.year}-${dateTime.month}-${dateTime.day}";

      // Add the message to the corresponding date group
      if (groupedMessages.containsKey(formattedDate)) {
        groupedMessages[formattedDate]!.add(message);
      } else {
        groupedMessages[formattedDate] = [message];
      }
    }

    return groupedMessages;
  }

  String getDisplayDate(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = DateTime(now.year, now.month, now.day - 1);

    if (dateTime.isAfter(today)) {
      return "Today";
    } else if (dateTime.isAfter(yesterday)) {
      return "Yesterday";
    } else {
      return DateFormat('MMM dd, yyyy').format(dateTime);
    }
  }

}
class ChatValidator {
  static final List<RegExp> blockPatterns = [
    RegExp(
        r'\b(Facebook|Instagram|Twitter|LinkedIn|Snapchat|whatsApp|Telegram|Discord|WeChat|Skype|Zoom|TikTok|Pinterest|Reddit|Tumblr|Viber|LINE|Kik|Signal|Google Hangouts|Email|Phone|Phone Number|Contact Number|Cell Phone|Cell Phone Number)\b',
        caseSensitive: false),
    RegExp(r'\b(call|phone)\b', caseSensitive: false),
    RegExp(r'\b(\d{4})\b'),
    // Matches 4-digit numbers
    RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b'),
    // Email pattern
    // Add more regex patterns as needed
  ];

  static bool isMessageValid(String message) {
    for (RegExp pattern in blockPatterns) {
      if (pattern.hasMatch(message)) {
        return false;
      }
    }
    return true;
  }

}

