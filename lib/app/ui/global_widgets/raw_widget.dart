import 'package:fixy/app/data/services/icon_broken.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowWidget extends StatelessWidget {
  late String title;
  late IconData iconData;
  final Function()? onTap;
  RowWidget({Key? key, required this.title, required this.iconData, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 20,
        child: Row(
          children: [
            Icon(
              iconData,
              //color: Get.isDarkMode ? whiteColor : blackColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 1,
              color: blackColor.withOpacity(.5),
            ),
            const SizedBox(
              width: 10,
            ),
            CustomText(
              title: title,
              fontSize: 16,
              textAlignment: Alignment.center,
              //color: Get.isDarkMode ? whiteColor : blackColor,
            ),
            const Spacer(),
            const Icon(
              IconBroken.Arrow___Right_2,
              //color: Get.isDarkMode ? whiteColor : blackColor,
            )
          ],
        ),
      ),
    );
  }
}
