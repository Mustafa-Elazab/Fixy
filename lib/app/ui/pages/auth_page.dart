import 'package:fixy/app/controllers/auth_controller.dart';
import 'package:fixy/app/data/services/icon_broken.dart';
import 'package:fixy/app/ui/global_widgets/custom_button.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/global_widgets/custom_textfield_suffix.dart';
import 'package:fixy/app/ui/global_widgets/custom_textformfield.dart';
import 'package:fixy/app/ui/pages/main_page.dart';
import 'package:fixy/app/ui/pages/register_page.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 12, left: 12),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: 'Welcome,',
                  fontSize: 40,
                  fontFamily: 'Signatra',
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => RegisterPage());
                  },
                  child: CustomText(
                    title: 'Sign Up',
                    color: blueColor,
                    fontSize: 40,
                    fontFamily: 'Signatra',
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              margin:
                  const EdgeInsets.only(left: 0, right: 0, top: 8, bottom: 8),
              elevation: 16.0,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<AuthController>(
                      init: AuthController(),
                      builder: (controller) {
                        return CustomTextFormFieldWithIcon(
                          title: 'Email Address',
                          hint: 'iMustafa@yahoo.com',
                          prefixIcon: IconBroken.Message,
                          inputType: TextInputType.emailAddress,
                          onSubmit: (String? value) {
                            controller.email = value!;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GetBuilder<AuthController>(
                      init: AuthController(),
                      builder: (controller) {
                        return CustomTextFormFieldWithSuffix(
                          title: 'Password',
                          hint: '*********',
                          obscureText: controller.obscureText,
                          prefixIcon: IconBroken.Lock,
                          suffixIcon: controller.passwordIcon,
                          ontap: () {
                            controller.changePassworSecure();
                          },
                          onSubmit: (value) {
                            controller.password = value!;
                          },
                        );
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            GestureDetector(
                onTap: () {
                  print('forget');
                },
                child: CustomText(
                  title: 'Forget Password?',
                  color: redColor,
                  textAlignment: Alignment.bottomRight,
                )),
            const SizedBox(
              height: 60,
            ),
            GetBuilder<AuthController>(
              init: AuthController(),
              builder: (controller) {
                return CustomButton(
                    title: 'Sign In',
                    onTap: () {
                      //controller.signInWihEmailAndPassword();
                      Get.to(() => MainPage());
                    },
                    width: MediaQuery.of(context).size.width,
                    height: 60);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              title: 'Sign In With Google',
              onTap: () {},
              width: MediaQuery.of(context).size.width,
              height: 60,
              widget: Image.asset('assets/images/google.png'),
              color: greyColor,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              title: 'Sign In With FaceBook',
              onTap: () {},
              width: MediaQuery.of(context).size.width,
              height: 60,
              widget: Image.asset('assets/images/facebook.png'),
              color: greyColor,
            ),
          ],
        ),
      ),
    );
  }
}
