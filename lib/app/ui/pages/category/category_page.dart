import 'package:fixy/app/data/models/category_model.dart';
import 'package:fixy/app/ui/global_widgets/category_raw.dart';
import 'package:fixy/app/ui/global_widgets/custom_searchfield.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/global_widgets/custom_textfield_search.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);
  ValueNotifier<List<Map>> filtered = ValueNotifier<List<Map>>([]);

  @override
  Widget build(BuildContext context) {
    List<String> suggestion = [
      'Cleaning',
      'Health & Beauty',
      'Repair',
      'Electrician',
      'Builder',
      'Welder',
      'Plumber',
      'Painting',
      'Gardener',
      'AC',
      'Carpenter',
    ];
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: 'Categories',
          color: blackColor,
          fontWeight: FontWeight.bold,
          textAlignment: Alignment.center,
          fontSize: 20,
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 12, right: 20, left: 20),
          child: ValueListenableBuilder<List>(
              valueListenable: filtered,
              builder: (context, value, _) {
                return Column(
                  children: [
                    CustomSearchTextField(
                      title: 'Search',
                      hint: 'hint',
                      list: suggestion,
                      onTap: (value) {
                        CategoryData.forEach((element) {
                          if (element.name
                              .toString()
                              .toLowerCase()
                              .contains(value!.toLowerCase())) ;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      title: 'Categories of services',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ListView.separated(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) =>
                              CategoryRow(CategoryData[index]),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                          itemCount: CategoryData.length),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
