import 'package:fixy/app/ui/global_widgets/book_item.dart';
import 'package:flutter/material.dart';

class NewBooking extends StatelessWidget {
  const NewBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => BookItem(),
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: 5);
  }
}
