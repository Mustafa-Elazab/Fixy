import 'package:fixy/app/controllers/auth_controller.dart';
import 'package:fixy/app/data/services/icon_broken.dart';
import 'package:fixy/app/ui/global_widgets/custom_button.dart';
import 'package:fixy/app/ui/global_widgets/custom_textfield_suffix.dart';
import 'package:fixy/app/ui/global_widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: GetBuilder<AuthController>(
            init: AuthController(),
            builder: (controller) {
              return Form(
                key: formKey,
                child: ListView(
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
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            child: CircleAvatar(
                              backgroundImage: controller.profileImageUrl !=
                                      null
                                  ? NetworkImage(controller.profileImageUrl)
                                  : const NetworkImage(
                                      'https://library.kissclipart.com/20181001/wbw/kissclipart-gsmnet-ro-clipart-computer-icons-user-avatar-4898c5072537d6e2.png'),
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
                              onPressed: () {
                                controller.getProfileImage();
                              }),
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
                              onSubmit: (value) {
                                controller.name = value!;
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
                              onSubmit: (value) {
                                controller.email = value!;
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
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                CustomTextFormFieldWithSuffix(
                                  title: 'Confirm-Password',
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
                        CustomButton(
                            title: 'Sign In',
                            onTap: () {
                              formKey.currentState!.save();
                              if (formKey.currentState!.validate()) {
                                controller.uploadProfileImage();
                                controller.signUpWithEmailAndPassword();
                              }
                            },
                            width: size.width / 2,
                            sizeBox: 0,
                            height: size.height / 12),
                      ],
                    ),
                  ],
                ),
              );
            }));
  }
}
