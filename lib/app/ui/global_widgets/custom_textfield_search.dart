import 'package:fixy/app/data/services/icon_broken.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchfield/searchfield.dart';

class CustomSearchTextField extends StatelessWidget {
  late String title;
  late String hint;
  late List<String> list;
  late Function(String?)? onTap;
  CustomSearchTextField(
      {Key? key,
      required this.title,
      required this.hint,
      required this.list,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchField(
        suggestions: list,
        hint: hint,
        searchStyle: const TextStyle(color: blackColor),
        validator: (x) {
          if (!list.contains(x) || x!.isEmpty) {
            return 'Please Enter a valid State';
          }
          return null;
        },
        searchInputDecoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Colors.black.withOpacity(0.8), width: .5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black.withOpacity(0.8),
            ),
          ),
          prefix: const Icon(IconBroken.Search),
        ),
        maxSuggestionsInViewPort: 5,
        itemHeight: Get.height / 18,
        onTap: onTap);
  }
}
