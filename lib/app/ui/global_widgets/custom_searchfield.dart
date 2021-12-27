import 'dart:ui';
import 'package:fixy/app/data/services/icon_broken.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSearchField extends StatelessWidget {
  late String hint;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final int? maxLines;
  final Function(String?)? onSubmit;

  CustomSearchField({
    Key? key,
    required this.hint,
    this.controller,
    this.inputType = TextInputType.text,
    this.maxLines,
    this.prefixIcon,
    this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height / 16,
      child: TextField(
        keyboardType: inputType,
        textInputAction: TextInputAction.next,
        onSubmitted: onSubmit,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.0, color: Get.isDarkMode ? whiteColor : blackColor),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Get.isDarkMode ? whiteColor : blackColor),
                gapPadding: 2.0,
                borderRadius: const BorderRadius.all(Radius.circular(8))),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: whiteColor),
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: hint,
            hintStyle: TextStyle(
              color: Get.isDarkMode ? whiteColor : blackColor,
            ),
            prefixIcon: const Icon(
              IconBroken.Search,
            ),
            fillColor: whiteColor),
      ),
    );
  }
}
