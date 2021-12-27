import 'package:fixy/app/data/services/icon_broken.dart';
import 'package:fixy/app/ui/global_widgets/bottom_chat.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/global_widgets/message_item.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagesChatPage extends StatelessWidget {
  const MessagesChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/user.png',
              width: 45,
              height: 45,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: 'Swimming pool cleaning',
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? whiteColor : blackColor,
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomText(
                  title: 'Online',
                  color: Get.isDarkMode ? whiteColor : blackColor,
                ),
              ],
            ),
          ],
        ),
        actions: const [
          Icon(IconBroken.Call),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => MessageItem(
                  isSender: true, msg: 'msg', time: DateTime.now().toString()),
              itemCount: 10,
            ),
          ),
          const BottomChat(),
        ],
      ),
    );
  }
}
