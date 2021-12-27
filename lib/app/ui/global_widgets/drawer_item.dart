import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  late String title;
  late IconData iconData;
  final Function()? onTap;
  DrawerItem(
      {Key? key, required this.title, required this.iconData, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 14,
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
              fontWeight: FontWeight.bold,
              textAlignment: Alignment.center,
              //color: Get.isDarkMode ? whiteColor : blackColor,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
