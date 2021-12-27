import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final Widget? widget;
  final String title;
  const CustomAppBar({Key? key, required this.title, this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      actions: [widget!],
      title: CustomText(
        title: title,
        fontSize: 20,
        fontFamily: 'Lato-Bold',
      ),
    );
  }
}
