import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BookingServicePage extends StatelessWidget {
  const BookingServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(title: 'Book the Service'),
        elevation: 0.0,
      ),
    );
  }
}
