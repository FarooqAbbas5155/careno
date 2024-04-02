import 'package:careno/constant/colors.dart';
import 'package:careno/constant/database_utils.dart';
import 'package:careno/widgets/custom_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../constant/firebase_utils.dart';
import '../../../constant/helpers.dart';
import '../../../widgets/bubble_special_three.dart';
import 'package:careno/models/user.dart' as model;
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
            child: Column(
              children: <Widget>[
                BubbleSpecialThree(
                  text: 'Added iMessage shape bubbles',
                  tail: true,
                  seen: true,
                  sent: true,
                time: '10:15  AM',
                ),
                BubbleSpecialThree(
                  text: 'Please try and give some feedback on it!',
                  tail: true,
                  seen: true,

                  time: '10:15  AM',
                ),
                BubbleSpecialThree(
                  text: 'Sure',
                  tail: true,
                  isSender: false, time: '10:15  AM',
                ),
                BubbleSpecialThree(
                  text: "I tried. It's awesome!!!",
                  tail: true,
                  isSender: false, time: '10:15  AM',
                ),
                BubbleSpecialThree(
                  text: "Thanks",
                  tail: true,
                  isSender: false, time: '10:15  AM',
                )
              ],
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
                  ),
                ),
              )),
              Container(
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
            ],
          ).marginOnly(bottom: 16.h,left: 16.w,right: 16.w),
        ],
      ),
    ));
  }
}

