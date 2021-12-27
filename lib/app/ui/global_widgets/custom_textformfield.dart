import 'dart:ui';

import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextFormFieldWithIcon extends StatelessWidget {
  late String title;
  late String hint;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final int? maxLines;
  final Function(String?)? onSubmit;

  CustomTextFormFieldWithIcon({
    Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.inputType = TextInputType.text,
    this.maxLines,
    this.prefixIcon,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          title: title,
          color: Get.isDarkMode ? whiteColor : blackColor,
        ),
        const SizedBox(
          height: 2,
        ),
        TextField(
          keyboardType: inputType,
          textInputAction: TextInputAction.next,
          onSubmitted: onSubmit,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).backgroundColor,
                width: 0.0,
              ),
            ),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Get.isDarkMode ? whiteColor : blackColor),
                gapPadding: 0.0,
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            hintText: hint,
            hintStyle: TextStyle(
              color: Get.isDarkMode ? whiteColor : blackColor,
            ),
            prefixIcon: Icon(
              prefixIcon!,
              color: Get.isDarkMode ? whiteColor : blackColor,
            ),
          ),
        )
      ],
    );
  }
}
