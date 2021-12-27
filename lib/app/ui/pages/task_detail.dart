import 'package:fixy/app/controllers/home_controller.dart';
import 'package:fixy/app/ui/global_widgets/custom_button.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskDetailPage extends StatelessWidget {
  const TaskDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: 'Accounting',
          fontSize: 20,
          fontFamily: 'Lato-Bold',
          color: blueColor,
          fontWeight: FontWeight.bold,
        ),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(
                      title: 'Upload By :-',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(title: 'Ahmed Saad'),
                  ],
                ),
                const CircleAvatar(
                  backgroundColor: blueColor,
                  radius: 31,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                )
              ],
            ),
            myDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(
                      title: 'Uploaded on :',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      title: 'DeadLine date :',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomText(
                      title: '2021-12-19',
                      fontWeight: FontWeight.bold,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      title: '2021-12-24',
                      color: greenColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ],
                ),
              ],
            ),
            myDivider(),
            CustomText(
              title: 'Done State :',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CustomText(
                  title: 'Done',
                  color: greenColor,
                ),
                CustomText(
                  title: 'Not Done',
                  color: greenColor,
                ),
              ],
            ),
            myDivider(),
            CustomText(
              title: 'Task description :',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomText(
              title:
                  'need to calulate the expenses need to calulate the expenses',
              fontWeight: FontWeight.bold,
              maxLines: 3,
            ),
            const SizedBox(
              height: 30,
            ),
            GetBuilder<HomeController>(
                init: HomeController(),
                builder: (controller) {
                  var size = MediaQuery.of(context).size;
                  return AnimatedSwitcher(
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      child: controller.isClick
                          ? SizedBox(
                              width: double.infinity,
                              height: size.height / 3.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: size.height / 5,
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.grey.shade200),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Add comment'),
                                        maxLines: 5,
                                        maxLength: 240,
                                        onFieldSubmitted: (value) {},
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Field is Empty ';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CustomButton(
                                        title: 'Post',
                                        onTap: () {},
                                        height: size.height / 20,
                                        width: size.width / 4,
                                        sizeBox: 0,
                                      ),
                                      CustomButton(
                                        title: 'Cancel',
                                        height: size.height / 20,
                                        width: size.width / 4,
                                        sizeBox: 0,
                                        onTap: () {
                                          controller.changeCommentArea(
                                              controller.isClick);
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          : Center(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: CustomButton(
                                  title: 'Add a comment',
                                  height: size.height / 14,
                                  width: size.width / 2,
                                  onTap: () {
                                    controller
                                        .changeCommentArea(controller.isClick);
                                  },
                                ),
                              ),
                            ));
                }),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: blueColor,
                  radius: 30,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/user.png'),
                    radius: 28,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: 'Khaled Atia',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      title: 'No neeeeeeeeeeeeeeeeeeed ',
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  myDivider() {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity,
          height: 2,
          padding: const EdgeInsets.all(2.0),
          color: Get.isDarkMode ? whiteColor : blackColor,
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
