import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final double width;
  final double height;
  final Color color;
  final Color textColor;
  final Widget? widget;
  final double sizeBox;

  const CustomButton(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.width,
      required this.height,
      this.color = blueColor,
      this.textColor = whiteColor,
      this.sizeBox = 20,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget == null
                ? Container()
                : Container(
                    child: widget,
                  ),
            SizedBox(
              width: sizeBox,
            ),
            Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: textColor, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
