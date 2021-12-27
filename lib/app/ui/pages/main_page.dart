import 'package:fixy/app/controllers/home_controller.dart';
import 'package:fixy/app/data/services/icon_broken.dart';
import 'package:fixy/app/data/services/theme_services.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/global_widgets/drawer_item.dart';
import 'package:fixy/app/ui/pages/bookings/booking_page.dart';
import 'package:fixy/app/ui/pages/category/category_page.dart';
import 'package:fixy/app/ui/pages/chats_page.dart';
import 'package:fixy/app/ui/pages/home_page.dart';
import 'package:fixy/app/ui/pages/profile_page.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          print(controller.titles[controller.currentIndex]);
          return AdvancedDrawer(
            //backdropColor: Colors.blueGrey,
            controller: _advancedDrawerController,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 300),
            animateChildDecoration: true,
            rtlOpening: false,
            disabledGestures: false,
            childDecoration: const BoxDecoration(
              // NOTICE: Uncomment if you want to add shadow behind the page.
              // Keep in mind that it may cause animation jerks.
              // boxShadow: <BoxShadow>[
              //   BoxShadow(
              //     color: Colors.black12,
              //     blurRadius: 0.0,
              //   ),
              // ],
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            drawer: SafeArea(
              child: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    height: size.height / 5,
                    color: greyColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/user.png'),
                          radius: 40,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          title: 'Mustafa',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CustomText(
                          title: 'mustafa@gmail.com',
                        ),
                      ],
                    ),
                  ),
                  DrawerItem(
                    title: 'Home',
                    iconData: IconBroken.Home,
                    onTap: () {
                      Get.to(() => HomePage());
                    },
                  ),
                  DrawerItem(
                    title: 'Categories',
                    iconData: IconBroken.Category,
                    onTap: () {
                      Get.to(() => CategoryPage());
                    },
                  ),
                  DrawerItem(
                    title: 'Bookings',
                    iconData: IconBroken.Bookmark,
                    onTap: () {
                      Get.to(() => const BookingsPage());
                    },
                  ),
                  DrawerItem(
                    title: 'Messages',
                    iconData: IconBroken.Message,
                    onTap: () {
                      Get.to(() => const ChatsPage());
                    },
                  ),
                  DrawerItem(
                    title: 'Notifications',
                    iconData: IconBroken.Notification,
                    onTap: () {},
                  ),
                  DrawerItem(
                    title: 'Add services',
                    iconData: IconBroken.Plus,
                    onTap: () {},
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        CustomText(
                          title: 'Application preferences',
                          fontWeight: FontWeight.w200,
                        ),
                        const Spacer(),
                        CustomText(
                          title: '------',
                          fontWeight: FontWeight.w200,
                        ),
                      ],
                    ),
                  ),
                  DrawerItem(
                    title: 'Account',
                    iconData: IconBroken.Profile,
                    onTap: () {
                      Get.to(() => const ProfilePage());
                    },
                  ),
                  DrawerItem(
                    title: 'Settings',
                    iconData: IconBroken.Setting,
                    onTap: () {},
                  ),
                  DrawerItem(
                    title: 'Language',
                    iconData: Icons.language_outlined,
                    onTap: () {},
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                    child: Row(
                      children: [
                        CustomText(
                          title: 'Helps & Privacy',
                          fontWeight: FontWeight.w200,
                        ),
                        const Spacer(),
                        CustomText(
                          title: '------',
                          fontWeight: FontWeight.w200,
                        ),
                      ],
                    ),
                  ),
                  DrawerItem(
                    title: 'Helps & F A Q',
                    iconData: IconBroken.Info_Circle,
                    onTap: () {},
                  ),
                  DrawerItem(
                    title: 'Logout',
                    iconData: IconBroken.Logout,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            child: Scaffold(
              appBar: AppBar(
                title: CustomText(
                  title: controller.titles[controller.currentIndex],
                  fontSize: 20,
                  fontFamily: 'Lato-Bold',
                  color: blueColor,
                  fontWeight: FontWeight.bold,
                  textAlignment: Alignment.center,
                ),
                leading: IconButton(
                  onPressed: _handleMenuButtonPressed,
                  icon: ValueListenableBuilder<AdvancedDrawerValue>(
                    valueListenable: _advancedDrawerController,
                    builder: (_, value, __) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: Icon(
                          value.visible ? Icons.clear : Icons.menu_rounded,
                          key: ValueKey<bool>(value.visible),
                        ),
                      );
                    },
                  ),
                ),
                actions: [
                  GetBuilder<ThemeServices>(
                    init: ThemeServices(),
                    builder: (controller) {
                      return IconButton(
                          onPressed: () {
                            controller.switchTheme();
                          },
                          icon: const Icon(Icons.dark_mode));
                    },
                  )
                ],
                elevation: 0.0,
              ),
              body: controller.screens[controller.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                items: controller.bottomItem,
                currentIndex: controller.currentIndex,
                onTap: (index) {
                  controller.changebottomnavbar(index);
                },
              ),
            ),
          );
        });
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
