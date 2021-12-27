import 'package:fixy/app/data/services/icon_broken.dart';
import 'package:fixy/app/ui/global_widgets/custom_button.dart';
import 'package:fixy/app/ui/global_widgets/custom_text.dart';
import 'package:fixy/app/ui/global_widgets/custom_textfield_suffix.dart';
import 'package:fixy/app/ui/global_widgets/custom_textformfield.dart';
import 'package:fixy/app/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: CustomText(
          title: 'Edit Profile',
          fontSize: 20,
          fontFamily: 'Lato-Bold',
          color: blueColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            alignment: Alignment.center,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.height / 12 + 1,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: CircleAvatar(
                    backgroundImage: const AssetImage('assets/images/user.png'),
                    radius: MediaQuery.of(context).size.height / 12,
                  ),
                ),
                IconButton(
                    icon: const CircleAvatar(
                      child: Icon(
                        IconBroken.Camera,
                        color: Colors.blue,
                      ),
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Card(
                margin: const EdgeInsets.only(
                    left: 12, right: 12, top: 8, bottom: 8),
                elevation: 16.0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomTextFormFieldWithIcon(
                    title: 'Name',
                    hint: 'iMustafa',
                    prefixIcon: IconBroken.Profile,
                    onSubmit: (String? value) {
                      print(value);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                margin: const EdgeInsets.only(
                    left: 12, right: 12, top: 8, bottom: 8),
                elevation: 16.0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomTextFormFieldWithIcon(
                    title: 'Email Address',
                    hint: 'iMustafa@yahoo.com',
                    prefixIcon: IconBroken.Message,
                    inputType: TextInputType.emailAddress,
                    onSubmit: (String? value) {
                      print(value);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                margin: const EdgeInsets.only(
                    left: 12, right: 12, top: 8, bottom: 8),
                elevation: 16.0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: CustomTextFormFieldWithIcon(
                    title: 'Phone',
                    hint: '01555485811',
                    prefixIcon: IconBroken.Call,
                    inputType: TextInputType.phone,
                    onSubmit: (String? value) {
                      print(value);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                margin: const EdgeInsets.only(
                    left: 12, right: 12, top: 8, bottom: 8),
                elevation: 16.0,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormFieldWithSuffix(
                        title: 'Old Password',
                        hint: '*********',
                        obscureText: false,
                        prefixIcon: IconBroken.Lock,
                        suffixIcon: Icons.remove_red_eye,
                        ontap: () {
                          print('remove');
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormFieldWithSuffix(
                        title: 'Password',
                        hint: '*********',
                        prefixIcon: IconBroken.Lock,
                        obscureText: false,
                        suffixIcon: Icons.remove_red_eye,
                        ontap: () {
                          print('remove');
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormFieldWithSuffix(
                        title: 'Confirm-Password',
                        hint: '*********',
                        obscureText: false,
                        prefixIcon: IconBroken.Lock,
                        suffixIcon: Icons.remove_red_eye,
                        ontap: () {
                          print('remove');
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
                height: 30,
              ),
            ],
          ),
        ],
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
                title: 'Sign In',
                onTap: () {},
                width: MediaQuery.of(context).size.width / 2,
                sizeBox: 0,
                height: MediaQuery.of(context).size.height / 18),
            CustomButton(
              title: 'Reset',
              onTap: () {},
              width: MediaQuery.of(context).size.width / 4,
              sizeBox: 0,
              height: MediaQuery.of(context).size.height / 18,
              color: greyColor,
            ),
          ],
        ),
      ),
    );
  }
}
