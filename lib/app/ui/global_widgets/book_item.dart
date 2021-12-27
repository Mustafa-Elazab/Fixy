import 'package:fixy/app/data/services/icon_broken.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/global_widgets/devider.dart';
import 'package:fixy/app/ui/global_widgets/drawer_item.dart';
import 'package:fixy/app/ui/pages/bookings/booking_detail_page.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookItem extends StatelessWidget {
  const BookItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateTime = DateTime.now();

    return GestureDetector(
      onTap: () {
        Get.to(const BookingDetialPage());
      },
      child: SizedBox(
        height: Get.height / 4,
        child: Card(
          margin: const EdgeInsets.all(8.0),
          elevation: 5.0,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            width: double.infinity,
            // height: MediaQuery.of(context).size.height / 5,

            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.asset(
                          "assets/images/facebook.png",
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Text(
                        DateFormat.yMMMEd().format(DateTime.now()),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          CustomText(
                            title: 'Professional makeup',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'lato-bold',
                          ),
                          const Spacer(),
                          GestureDetector(
                              onTap: () {}, child: const Icon(Icons.more_vert)),
                        ],
                      ),
                      const Devider(),
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
                      const Devider(),
                      Row(
                        children: [
                          CustomText(
                            title: 'total',
                            fontFamily: 'lato-bold',
                          ),
                          const Spacer(),
                          CustomText(
                            title: '30.00/',
                            fontSize: 20,
                            fontFamily: 'lato-bold',
                          ),
                        ],
                      ),
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
