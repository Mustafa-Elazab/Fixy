import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class Devider extends StatelessWidget {
  const Devider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: .5,
      color: blackColor.withOpacity(.2),
    );
  }
}
