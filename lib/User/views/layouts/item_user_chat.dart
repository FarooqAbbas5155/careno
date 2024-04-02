import 'package:careno/widgets/bubble_special_three.dart';
import 'package:flutter/material.dart';

class ItemUserChat extends StatelessWidget {
  const ItemUserChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     BubbleSpecialThree(
      text: 'Added iMessage shape bubbles',
      tail: true,
      seen: true,
      sent: true,
      time: '10:15  AM',
    );
  }
}
