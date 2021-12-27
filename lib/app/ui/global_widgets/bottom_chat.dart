import 'package:fixy/app/data/services/icon_broken.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomChat extends StatelessWidget {
  const BottomChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: Get.height / 11,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          topLeft: Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            IconBroken.Camera,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          const Icon(
            Icons.emoji_emotions_outlined,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              onSubmitted: (value) {},
              decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: greyColor,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(24)),
                  ),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: greyColor, width: 1.0),
                      gapPadding: 2.0,
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  hintText: 'Type something',
                  hintStyle: TextStyle(
                    color: Get.isDarkMode ? whiteColor : blackColor,
                  ),
                  suffixIcon: InkWell(
                    onTap: () {},
                    child: Icon(
                      IconBroken.Send,
                      color: Get.isDarkMode ? whiteColor : blackColor,
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
