import 'package:aldmictest/controller/signuppagecontroller.dart';
import 'package:aldmictest/screens/loginpage/formspacing.dart';
import 'package:aldmictest/screens/loginpage/headersection.dart';
import 'package:aldmictest/validator/validation.dart';
import 'package:aldmictest/widgets/stylewidgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignUpPageController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 23, 44),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(
                  title: 'Register',
                  subtitle:
                      'Daftarkan dirimu dan nikmati berita-berita terbaik yang telah kami persiapkan'),
              Form(
                key: controller.signUpFormKey,
                child: Column(
                  children: [
                    const FormSpacing(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama Lengkap',
                          style: globalSubTitle(14, Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          validator: (value) =>
                              Validator.validateEmptyText('Nama', value),
                          controller: controller.namaEditingController,
                          cursorColor: Colors.amber,
                          decoration: InputDecoration(
                              constraints: textFormFieldBoxContstraints(),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              label: const Text('Nama Lengkap'),
                              border: textFormFieldBorder(),
                              focusedBorder: textFormFieldFocusedBorder(),
                              enabledBorder: textFormFieldEnabledBorder(),
                              labelStyle: const TextStyle(
                                  color: Color.fromARGB(131, 33, 149, 243)),
                              prefixIcon: const Icon(Ionicons.person),
                              prefixIconColor: Colors.white),
                        ),
                      ],
                    ),
                    const FormSpacing(),
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
                          controller: controller.emailEditingController,
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
                                  color: Color.fromARGB(131, 33, 149, 243)),
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
                            controller: controller.passwordEditingController,
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
                                    color: Color.fromARGB(131, 33, 149, 243)),
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
                                          ))),
                          );
                        })
                      ],
                    ),
                    const FormSpacing(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Konfirmasi Password',
                          style: globalSubTitle(14, Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Obx(() {
                          return TextFormField(
                            style: const TextStyle(color: Colors.white),
                            validator: (value) => Validator.validatePassword(
                                value,
                                controller.passwordEditingController.text),
                            obscureText: controller.confirmHidePass.value,
                            controller: controller.confirmPassEditingController,
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
                                    color: Color.fromARGB(131, 33, 149, 243)),
                                prefixIcon: const Icon(Ionicons.lock_closed),
                                prefixIconColor: Colors.white,
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.confirmHidePass.value =
                                          !controller.confirmHidePass.value;
                                    },
                                    icon: controller.confirmHidePass.value
                                        ? const Icon(
                                            Ionicons.eye_off,
                                            color: Colors.white,
                                          )
                                        : const Icon(
                                            Ionicons.eye,
                                            color: Colors.white,
                                          ))),
                          );
                        })
                      ],
                    ),
                    const FormSpacing(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nomor Telefon',
                          style: globalSubTitle(14, Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          validator: (value) => Validator.validateEmptyText(
                              'Nomor Telefon', value),
                          controller: controller.phoneNumberEditingController,
                          cursorColor: Colors.amber,
                          decoration: InputDecoration(
                              constraints: textFormFieldBoxContstraints(),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                              label: const Text('081234567810'),
                              border: textFormFieldBorder(),
                              focusedBorder: textFormFieldFocusedBorder(),
                              enabledBorder: textFormFieldEnabledBorder(),
                              labelStyle: const TextStyle(
                                  color: Color.fromARGB(131, 33, 149, 243)),
                              prefixIcon: const Icon(Ionicons.call),
                              prefixIconColor: Colors.white),
                        ),
                      ],
                    ),
                    const FormSpacing(),
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
                  style:
                      buttonFormStyle(const Color.fromARGB(255, 220, 168, 15)),
                  onPressed: () {
                    controller.signUp();
                  },
                  child: Text(
                    'Register',
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
