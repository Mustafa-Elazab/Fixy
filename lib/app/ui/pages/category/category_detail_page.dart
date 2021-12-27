import 'package:fixy/app/ui/global_widgets/custom_button.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/global_widgets/devider.dart';
import 'package:fixy/app/ui/pages/bookings/book_service_page.dart';
import 'package:fixy/app/ui/pages/category/worker_profile.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CategoryDetailPage extends StatelessWidget {
  double? ratingBar;

  CategoryDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 4,
              width: double.infinity,
              child: Image.asset(
                'assets/images/plumber.png',
                fit: BoxFit.fill,
              ),
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                    child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: greyColor),
                  child: Column(
                    children: [
                      CustomText(
                        title: 'Professional Cleaning services',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: greyColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    ],
                  ),
                )),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    CustomText(
                      title: 'Description',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    const Devider(),
                    CustomText(
                      title: 'i will do 3hour cleaning of your home or office ',
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CustomText(
                          title: 'Service Provider',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        const Spacer(),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => WorkerProfile());
                            },
                            child: CustomText(title: 'View More')),
                      ],
                    ),
                    const Devider(),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.asset('assets/images/user.png'),
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                title: 'Anna ',
                                fontWeight: FontWeight.bold,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              CustomText(
                                title: 'professional cleaning having 1 y exp',
                                maxLines: 2,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: greyColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Icon(Icons.star),
                                const SizedBox(
                                  width: 4,
                                ),
                                CustomText(title: '5')
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: 'Galleries',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    const Devider(),
                    SizedBox(
                      height: Get.height / 6,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset('assets/images/user.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: 'Reviews & Ratings',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    const Devider(),
                    SizedBox(
                      height: Get.height / 5,
                      child: Column(
                        children: [
                          CustomText(
                            title: ratingBar.toString(),
                            textAlignment: Alignment.center,
                          ),
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              ratingBar = rating;
                            },
                          ),
                          CustomText(
                            title: 'review',
                            textAlignment: Alignment.center,
                          ),
                          const Devider(),
                          Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child:
                                        Image.asset('assets/images/user.png'),
                                  )),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                flex: 3,
                                child: CustomText(
                                  title: 'Anna ',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
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
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
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
        child: CustomButton(
            title: 'Book This Services',
            color: blackColor,
            onTap: () {
              Get.to(() => const BookingServicePage());
            },
            width: MediaQuery.of(context).size.width / 2,
            sizeBox: 0,
            height: MediaQuery.of(context).size.height / 18),
      ),
    );
  }
}
