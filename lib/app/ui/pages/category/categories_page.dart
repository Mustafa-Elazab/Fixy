import 'dart:ffi';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:fixy/app/data/models/category_model.dart';
import 'package:fixy/app/data/services/icon_broken.dart';
import 'package:fixy/app/ui/global_widgets/custom_searchfield.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/pages/category/all_category.dart';
import 'package:fixy/app/ui/pages/category/inheighdemand_category.dart';
import 'package:fixy/app/ui/pages/category/rating_category.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesPage extends StatelessWidget {
  CategoryModel categoryData;
  CategoriesPage(this.categoryData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: 'Recommended for you',
          fontWeight: FontWeight.bold,
          fontSize: 18,
          textOverflow: TextOverflow.ellipsis,
          color: blackColor,
          maxLines: 1,
        ),
        elevation: 0.5,
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [whiteColor, categoryData.color],
                    begin: Alignment.topRight,
                    end: Alignment.topLeft)),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomText(
                            title: categoryData.name,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: whiteColor,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomSearchField(hint: 'search'),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ButtonsTabBar(
                            backgroundColor: categoryData.color,
                            buttonMargin: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 4),
                            contentPadding: const EdgeInsets.only(
                                left: 16, right: 16, top: 5, bottom: 5),
                            unselectedBackgroundColor: Colors.grey[300],
                            unselectedLabelStyle:
                                const TextStyle(color: Colors.black),
                            labelStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            tabs: const [
                              Tab(
                                text: "All",
                              ),
                              Tab(
                                text: "Ratings",
                              ),
                              Tab(
                                text: "In High Demand",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Expanded(
                  flex: 5,
                  child: TabBarView(
                    children: <Widget>[
                      AllCategory(),
                      RatingsCategory(),
                      InHighDemandCategory(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
