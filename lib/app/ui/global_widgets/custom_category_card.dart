import 'package:fixy/app/data/services/icon_broken.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/global_widgets/devider.dart';
import 'package:fixy/app/ui/pages/category/category_detail_page.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCategoryCard extends StatelessWidget {
  const CustomCategoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => CategoryDetailPage());
      },
      child: SizedBox(
        height: Get.height / 4.3,
        width: Get.width,
        child: Card(
          elevation: 10,
          margin: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: Get.height / 8,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset('assets/images/plumber.png')),
                  )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                    child: Column(
                      children: [
                        CustomText(
                          title: 'Full House Plumbing',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        const Devider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: greyColor),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(Icons.star),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  CustomText(title: '5')
                                ],
                              ),
                            ),
                            CustomText(
                              title: '15.00/h',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              IconBroken.Profile,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CustomText(
                              title: 'Ekatrina Malkova',

                              textAlignment: Alignment.center,
                              //color: Get.isDarkMode ? whiteColor : blackColor,
                            ),
                            const Spacer(),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            const Icon(
                              IconBroken.Location,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            CustomText(
                              title: 'USA, New York city,',
                              textAlignment: Alignment.center,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
