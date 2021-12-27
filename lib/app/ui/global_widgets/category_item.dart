import 'package:fixy/app/data/models/category_model.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel list;
  CategoryItem(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width / 3,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
              colors: [list.color, whiteColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight)),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                list.image,
                fit: BoxFit.contain,
                width: Get.width / 6,
                height: Get.height / 10,
              ),
            ),
          ),
          Text(
            list.name,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: whiteColor,
              overflow: TextOverflow.ellipsis,
            ),
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.fade,
          )
        ],
      ),
    );
  }
}
