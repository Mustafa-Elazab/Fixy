import 'package:fixy/app/controllers/chat_controller.dart';
import 'package:fixy/app/ui/global_widgets/chat_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatsPage extends StatelessWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      init: ChatController(),
      builder: (controller) {
        return ListView.separated(
          padding: const EdgeInsets.all(12.0),
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) => ChatItem(),
          separatorBuilder: (context, index) => const SizedBox(
            height: 10,
          ),
          itemCount: 10,
        );
      },
    );
  }
}
