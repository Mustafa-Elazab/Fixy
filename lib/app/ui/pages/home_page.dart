import 'package:fixy/app/controllers/home_controller.dart';
import 'package:fixy/app/data/models/category_model.dart';
import 'package:fixy/app/data/services/icon_broken.dart';
import 'package:fixy/app/ui/global_widgets/category_item.dart';
import 'package:fixy/app/ui/global_widgets/custom_searchfield.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Column(
          children: [
            CustomSearchField(
              hint: 'Search services .',
              prefixIcon: IconBroken.Search,
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<HomeController>(
              init: HomeController(),
              builder: (controller) {
                return Row(
                  children: [
                    const Icon(IconBroken.Location),
                    const SizedBox(
                      width: 20,
                    ),
                    if (controller.address != null)
                      SizedBox(
                        width: Get.width / 1.5,
                        child: CustomText(
                          title: "Location: ${controller.address}",
                          maxLines: 2,
                          fontSize: 12,
                        ),
                      ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        controller.getMyLocation();
                      },
                      child: const Icon(Icons.location_searching_outlined),
                    )
                  ],
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CustomText(
                  title: 'Categories',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                GestureDetector(
                  child: CustomText(
                    title: 'View All',
                    textAlignment: Alignment.center,
                    color: blueColor,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: Get.height / 6,
              width: double.infinity,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      CategoryItem(CategoryData[index]),
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 8,
                      ),
                  itemCount: CategoryData.length),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CustomText(
                  title: 'Recommanded for you',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                const Spacer(),
                GestureDetector(
                  child: CustomText(
                    title: 'View All',
                    textAlignment: Alignment.center,
                    color: blueColor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
