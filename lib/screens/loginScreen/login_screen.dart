
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter/services.dart';
import 'package:ra7alah/screens/ForgotPasswordScreen/forgot_password_screen.dart';
import 'package:ra7alah/utils/colors.dart';
import 'package:ra7alah/utils/utils.dart';
import 'package:ra7alah/widgets/app_bar.dart';
import 'package:ra7alah/widgets/custom_elevated_button.dart';
import 'package:ra7alah/widgets/input_field_text.dart';

import 'login_controller.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: const AppBarWidget(color: kBackgroundColor,hasElevation: false,),
        body: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (controller) => SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 18,
                          ),
                          Text(
                            "Sign In",
                            style: extend(theme.textTheme.headline2 ?? const TextStyle(),const TextStyle(color: kDarkGrayColor)),
                          ),
                          SizedBox(height: 75),
                          CustomInputfield(
                            onchange: controller.onUpdate,
                            labelText: "Email",
                            controller: controller.emailController,
                            validator: controller.validateEmail,
                            icon: (controller.emailValidated)
                                ? (controller.emailState)
                                    ? const Icon(Icons.check_rounded,
                                        color: kSuccessColor)
                                    : const Icon(
                                        Icons.close_outlined,
                                        color: kErrorColor,
                                      )
                                : null,
                          ),
                          SizedBox(height: 8),
                          CustomInputfield(
                              labelText: "Password",
                              controller: controller.passwordController,
                              validator: controller.validatePassword,
                              validated: controller.passValidated,
                              isAutoValidate: true,
                              obsecure: !controller.visiblePsd,
                              keyboardType: TextInputType.visiblePassword,
                              icon: IconButton(
                                // Based on passwordVisible state choose the icon
                                icon: Icon(
                                  controller.visiblePsd
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: kPrimaryColor,
                                ),
                                onPressed: () {
                                  controller.toggleVisiblePsd();
                                },
                              )),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Get.off(() => ForgotPasswordScreen());
                                    // Get.to(() => ForgotPasswordScreen());
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      Text("Forget Password",style: TextStyle(color: kDarkGrayColor),),
                                      SizedBox(width: 4),
                                      Icon(
                                        Icons.arrow_right_alt_rounded,
                                        color: kPrimaryColor,
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                          SizedBox(height: 25),
                          Center(
                            child: CustomElevatedButton(
                               background: kPrimaryColor,
                                width: 343,
                                height: 48,
                                onPressed: () {
                                 controller.sinningin(context);
                                },
                                text: "LOGIN"),
                          ),


                        ],
                      ),
                    ),
                  ),
                )));


  }
}
