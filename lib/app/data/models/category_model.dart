import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/cupertino.dart';

class CategoryModel {
  late final String name;
  late final String image;
  late final Color color;

  CategoryModel({required this.name, required this.image, required this.color});
}

List<CategoryModel> CategoryData = [
  CategoryModel(
    name: 'Cleaning',
    image: 'assets/images/mop.png',
    color: blueColor,
  ),
  CategoryModel(
    name: 'Health & Beauty',
    image: 'assets/images/makeup.png',
    color: orangeColor,
  ),
  CategoryModel(
    name: 'Repair',
    image: 'assets/images/repair.png',
    color: greenColor,
  ),
  CategoryModel(
    name: 'Electrician',
    image: 'assets/images/electrical.png',
    color: blueColor,
  ),
  CategoryModel(
    name: 'Builder',
    image: 'assets/images/builder.png',
    color: orangeColor,
  ),
  CategoryModel(
    name: 'Welder',
    image: 'assets/images/welder.png',
    color: greenColor,
  ),
  CategoryModel(
    name: 'Plumber',
    image: 'assets/images/plumber.png',
    color: blueColor,
  ),
  CategoryModel(
    name: 'Painting',
    image: 'assets/images/paint.png',
    color: blueColor,
  ),
  CategoryModel(
    name: 'Gardener',
    image: 'assets/images/gardening.png',
    color: blueColor,
  ),
  CategoryModel(
    name: 'Ac',
    image: 'assets/images/ac.png',
    color: blueColor,
  ),
  CategoryModel(
    name: 'Carpenter ',
    image: 'assets/images/carpenter.png',
    color: blueColor,
  ),
  CategoryModel(
    name: 'Johanna ',
    image: 'assets/images/welder.jpg',
    color: blueColor,
  ),
  CategoryModel(
    name: 'James ',
    image: 'assets/images/welder.jpg',
    color: blueColor,
  ),
  CategoryModel(
    name: 'Anton ',
    image: 'assets/images/welder.jpg',
    color: blueColor,
  ),
];
