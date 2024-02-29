import 'package:aldmictest/controller/loginpagecontroller.dart';
import 'package:aldmictest/screens/loginpage/bottomsection.dart';
import 'package:aldmictest/screens/loginpage/formspacing.dart';
import 'package:aldmictest/screens/loginpage/headersection.dart';
import 'package:aldmictest/validator/validation.dart';
import 'package:aldmictest/widgets/stylewidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginPageController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 23, 44),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(
                title: 'Login',
                subtitle:
                    'Temukanlah berita tanpa batas dengan sumber terpercaya',
              ),
              const FormSpacing(),
              Form(
                key: controller.loginFormKey,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'E-mail',
                          style: globalSubTitle(14, Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          validator: (value) =>
                              Validator.validateEmptyText('E-mail', value),
                          controller: controller.emailController,
                          cursorColor: Colors.amber,
                          decoration: InputDecoration(
                              constraints: textFormFieldBoxContstraints(),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              label: const Text('E-mail'),
                              border: textFormFieldBorder(),
                              focusedBorder: textFormFieldFocusedBorder(),
                              enabledBorder: textFormFieldEnabledBorder(),
                              labelStyle: const TextStyle(
                                  color: Color.fromARGB(131, 123, 196, 255)),
                              prefixIcon: const Icon(Ionicons.mail),
                              prefixIconColor: Colors.white),
                        ),
                      ],
                    ),
                    const FormSpacing(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: globalSubTitle(14, Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() {
                          return TextFormField(
                            style: const TextStyle(color: Colors.white),
                            validator: (value) =>
                                Validator.validateEmptyText('Password', value),
                            obscureText: controller.hidePass.value,
                            controller: controller.passwordController,
                            cursorColor: Colors.amber,
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              constraints: textFormFieldBoxContstraints(),
                              label: const Text('Password'),
                              border: textFormFieldBorder(),
                              focusedBorder: textFormFieldFocusedBorder(),
                              enabledBorder: textFormFieldEnabledBorder(),
                              labelStyle: const TextStyle(
                                  color: Color.fromARGB(131, 123, 196, 255)),
                              prefixIcon: const Icon(Ionicons.lock_closed),
                              prefixIconColor: Colors.white,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.hidePass.value =
                                      !controller.hidePass.value;
                                },
                                icon: controller.hidePass.value
                                    ? const Icon(
                                        Ionicons.eye_off,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Ionicons.eye,
                                        color: Colors.white,
                                      ),
                              ),
                            ),
                          );
                        })
                      ],
                    ),
                    const FormSpacing(),
                    const BottomSection(),
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              SizedBox(
                width: double.maxFinite,
                height: 44,
                child: ElevatedButton(
                  style: buttonFormStyle(Colors.blue),
                  onPressed: () {
                    controller.logIn();
                  },
                  child: Text(
                    'Login',
                    style: textButton(Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
