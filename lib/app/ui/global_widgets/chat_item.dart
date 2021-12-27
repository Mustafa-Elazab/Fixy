import 'package:fixy/app/data/models/users_model.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/pages/messages_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatItem extends StatelessWidget {
  ChatItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(const MessagesChatPage());
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(8),
          height: Get.height / 8,
          child: Row(
            children: [
              Expanded(flex: 1, child: Image.asset('assets/images/user.png')),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomText(
                        title: 'Swimming pool cleaning',
                        fontWeight: FontWeight.bold,
                        maxLines: 1,
                        fontSize: 16,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: CustomText(
                              title:
                                  'i will be gonna your .i will be gonna your .i will be gonna your .',
                              maxLines: 1,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: CustomText(
                              title: DateFormat.jm().format(
                                  DateTime.parse(DateTime.now().toString())),
                              maxLines: 1,
                            ),
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
