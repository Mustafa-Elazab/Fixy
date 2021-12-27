import 'package:fixy/app/data/services/icon_broken.dart';
import 'package:fixy/app/ui/global_widgets/custom_button.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/global_widgets/devider.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingDetialPage extends StatelessWidget {
  const BookingDetialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 4,
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomText(
                                title: 'Proffesional make up',
                                maxLines: 2,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
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
                                    title: 'mustafa',
                                    textAlignment: Alignment.center,
                                  ),
                                ],
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
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: greyColor,
                            ),
                            child: CustomText(
                              title: DateFormat.yMMMEd().format(DateTime.now()),
                              textAlignment: Alignment.center,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              maxLines: 2,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CustomText(
                        title: 'Contact',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          IconBroken.Call,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          IconBroken.Message,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomText(
                            title: 'Booking Detail',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          const Spacer(),
                          CustomText(
                            title: '#101',
                          ),
                        ],
                      ),
                      const Devider(),
                      Row(
                        children: [
                          CustomText(
                            title: 'status',
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: greyColor),
                            child: CustomText(
                              title: 'new',
                            ),
                          ),
                        ],
                      ),
                      const Devider(),
                      Row(
                        children: [
                          CustomText(
                            title: 'Booking Detail',
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: greyColor),
                            child: CustomText(
                              title: 'not paid',
                            ),
                          ),
                        ],
                      ),
                      const Devider(),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomText(
                            title: 'Spent  time',
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: greyColor),
                            child: CustomText(
                              title: '00:00',
                            ),
                          ),
                        ],
                      ),
                      const Devider(),
                      Row(
                        children: [
                          CustomText(
                            title: 'desird date and time',
                          ),
                          const Spacer(),
                          CustomText(
                            title: DateFormat.jms().format(DateTime.now()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      CustomText(
                        title: 'Pricing',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      const Devider(),
                      Row(
                        children: [
                          CustomText(
                            title: 'Proffesional make up',
                          ),
                          const Spacer(),
                          CustomText(
                            title: '27',
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      const Devider(),
                      Row(
                        children: [
                          CustomText(
                            title: 'Quality',
                          ),
                          const Spacer(),
                          CustomText(
                            title: '27',
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      const Devider(),
                      Row(
                        children: [
                          CustomText(
                            title: 'Tax Amount Subtotal',
                          ),
                          const Spacer(),
                          CustomText(
                            title: '27',
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      const Devider(),
                      Row(
                        children: [
                          CustomText(
                            title: 'total amount',
                          ),
                          const Spacer(),
                          CustomText(
                            title: '60',
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12),
              topLeft: Radius.circular(12),
            ),
            color: whiteColor),
        child: Row(
          children: [
            const Spacer(),
            CustomButton(
                title: 'Cancel',
                color: greyColor,
                onTap: () {},
                width: MediaQuery.of(context).size.width / 4,
                sizeBox: 0,
                height: MediaQuery.of(context).size.height / 18),
          ],
        ),
      ),
    );
  }
}
