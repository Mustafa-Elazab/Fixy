import 'package:fixy/app/ui/global_widgets/custom_category_card.dart';
import 'package:flutter/material.dart';

class RatingsCategory extends StatelessWidget {
  const RatingsCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => const CustomCategoryCard(),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: 5));
  }
}
