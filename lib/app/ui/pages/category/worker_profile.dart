import 'package:fixy/app/data/services/icon_broken.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/global_widgets/devider.dart';
import 'package:fixy/app/ui/pages/chats_page.dart';
import 'package:fixy/app/ui/pages/messages_page.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class WorkerProfile extends StatelessWidget {
  var ratingBar;

  WorkerProfile({Key? key}) : super(key: key);

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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            title: 'Ivan ',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: greyColor),
                            child: CustomText(
                              title: 'private person',
                            ),
                          ),
                        ],
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
                            title: 'booking (0)',
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: 'Contact',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        const Devider(),
                        CustomText(
                          title: 'start chat with me',
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => MessagesChatPage());
                        },
                        child: const Icon(IconBroken.Message)),
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
                    CustomText(
                      title: 'About Me',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    const Devider(),
                    CustomText(
                      title: 'i am ivan from usa usa isa mincnclckclkmlc ',
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
                          title: 'My services',
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
                    SizedBox(
                        height: Get.height / 3,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Container(
                                  width: Get.width / 2.5,
                                  height: Get.height / 3,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                      color: greyColor,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Expanded(
                                            child: Image.asset(
                                                'assets/images/welder.png')),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CustomText(
                                        title: 'professional makeup',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        maxLines: 2,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      RatingBar.builder(
                                        initialRating: 3,
                                        itemSize: 20,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          ratingBar = rating;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomText(title: 'start from'),
                                          CustomText(
                                            title: '30',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 10,
                                ),
                            itemCount: 3)),
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
    );
  }
}
