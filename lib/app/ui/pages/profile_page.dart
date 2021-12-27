import 'package:fixy/app/data/services/icon_broken.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/global_widgets/raw_widget.dart';
import 'package:fixy/app/ui/pages/auth_page.dart';
import 'package:fixy/app/ui/pages/edit_profile_page.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  Container(
                    height: size.height / 4,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          title: 'Mustafa',
                          fontSize: 16,
                          textAlignment: Alignment.center,
                          color: whiteColor,
                        ),
                        CustomText(
                          title: 'mustafa@gmail.com',
                          textAlignment: Alignment.center,
                          color: whiteColor,
                        ),
                      ],
                    ),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                      color: blackColor,
                    ),
                  ),
                  Container(
                    height: size.height / 24,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height / 8,
                width: size.width / 4,
                child: const CircleAvatar(
                  backgroundColor: blueColor,
                  radius: 48,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/user.png'),
                    radius: 44,
                  ),
                ),
              ),
            ],
          ),
          Card(
            margin: const EdgeInsets.all(24.0),
            elevation: 20.0,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                RowWidget(
                  title: 'Profile',
                  iconData: IconBroken.Profile,
                  onTap: () {
                    Get.to(() => const EditProfilePage());
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                RowWidget(title: 'My Booking', iconData: IconBroken.Bookmark),
                const SizedBox(
                  height: 20,
                ),
                RowWidget(
                    title: 'Notifications', iconData: IconBroken.Notification),
                const SizedBox(
                  height: 20,
                ),
                RowWidget(title: 'Messages', iconData: IconBroken.Message),
                const SizedBox(
                  height: 20,
                ),
                RowWidget(title: 'Add services', iconData: IconBroken.Plus),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.all(24.0),
            elevation: 20.0,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                RowWidget(title: 'Settings', iconData: IconBroken.Setting),
                const SizedBox(
                  height: 20,
                ),
                RowWidget(title: 'Language', iconData: Icons.language_outlined),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.all(24.0),
            elevation: 20.0,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                RowWidget(
                    title: 'Help & FAQ', iconData: IconBroken.Info_Circle),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Are you sure?'),
                          content: const Text('Do you want to Log out'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.offAll(() => const AuthPage());
                              },
                              child: const Text('Yes'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: RowWidget(
                        title: 'Log Out', iconData: IconBroken.Logout)),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
