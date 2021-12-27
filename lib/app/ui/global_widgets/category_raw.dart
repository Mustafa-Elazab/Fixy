import 'package:fixy/app/data/models/category_model.dart';
import 'package:fixy/app/data/services/icon_broken.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/pages/category/categories_page.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryRow extends StatelessWidget {
  CategoryModel categoryData;
  final Function()? onTap;
  CategoryRow(
    this.categoryData, {
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CategoriesPage(categoryData));
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 12,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [categoryData.color, whiteColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Image.asset(categoryData.image),
            const SizedBox(
              width: 10,
            ),
            const SizedBox(
              width: 10,
            ),
            CustomText(
              title: categoryData.name,
              fontSize: 16,
              textAlignment: Alignment.center,
              //color: Get.isDarkMode ? whiteColor : blackColor,
            ),
            const Spacer(),
            const Icon(
              IconBroken.Arrow___Down_2,
              //color: Get.isDarkMode ? whiteColor : blackColor,
            )
          ],
        ),
      ),
    );
  }
}
