import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app_c9_mon/core/config/page_route_names.dart';
import 'package:e_commerce_app_c9_mon/domain/entites/register/register_request_data.dart';
import 'package:e_commerce_app_c9_mon/features/register/manager/cubit.dart';
import 'package:e_commerce_app_c9_mon/features/register/manager/states.dart';
import 'package:e_commerce_app_c9_mon/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/extensions.dart';
import '../../../core/widgets/custom_text_field.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  TextEditingController fullNameController =
      TextEditingController(text: "hossam bakry");
  TextEditingController emialController =
      TextEditingController(text: "hossam110@gmail.com");
  TextEditingController mobileController =
      TextEditingController(text: "01142480146");
  TextEditingController passwordController =
      TextEditingController(text: "Asdf1234@");

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            backgroundColor: theme.primaryColor,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              toolbarHeight: 30,
            ),
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeInDown(
                      delay: const Duration(milliseconds: 50),
                      child: Image.asset("assets/images/route_logo.png"),
                    ),
                    const SizedBox(height: 30),
                    FadeInRight(
                      delay: const Duration(milliseconds: 100),
                      child: Text(
                        "Full Name",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 10),
                    FadeInRight(
                      delay: const Duration(milliseconds: 150),
                      child: CustomTextField(
                        controller: fullNameController,
                        hint: "enter your user name",
                        onValidate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "please provide your user name";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInRight(
                      delay: const Duration(milliseconds: 200),
                      child: Text(
                        "Mobile",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 10),
                    FadeInRight(
                      delay: const Duration(milliseconds: 250),
                      child: CustomTextField(
                        controller: mobileController,
                        hint: "enter your mobile",
                        onValidate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "please provide your mobile";
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInRight(
                      delay: const Duration(milliseconds: 300),
                      child: Text(
                        "E-mail Address",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 10),
                    FadeInRight(
                      delay: const Duration(milliseconds: 350),
                      child: CustomTextField(
                        controller: emialController,
                        hint: "enter your e-mail address",
                        onValidate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "please provide your e-mail address";
                          }

                          var regex = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                          if (!regex.hasMatch(value)) {
                            return "Invalid email";
                          }

                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    FadeInRight(
                      delay: const Duration(milliseconds: 400),
                      child: Text(
                        "Password",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 10),
                    FadeInRight(
                      delay: const Duration(milliseconds: 450),
                      child: CustomTextField(
                        controller: passwordController,
                        hint: "enter your password",
                        maxLines: 1,
                        isPassword: true,
                        onValidate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "please provide your password";
                          }

                          var regex = RegExp(
                              r"(?=^.{8,}$)(?=.*[!@#$%^&*]+)(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$");

                          if (!regex.hasMatch(value)) {
                            return "The password must include at least one lowercase letter, one uppercase letter, one digit, one special character, and be at least 6 characters long.";
                          }

                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 80),
                    FadeInRight(
                      delay: const Duration(milliseconds: 500),
                      child: MaterialButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // call api to login
                            var data = RegisterRequestData(
                              name: fullNameController.text,
                              emial: emialController.text,
                              phone: mobileController.text,
                              password: passwordController.text,
                            );

                            cubit.register(data).then((value) {
                              if (value) {
                                navigatorKey.currentState!
                                    .pushNamedAndRemoveUntil(
                                        PageRouteNames.login, (route) => false);
                              }
                            });
                          }
                        },
                        padding: EdgeInsets.zero,
                        child: Container(
                          alignment: Alignment.center,
                          width: mediaQuery.size.width,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            "Sign Up",
                            style: theme.textTheme.titleMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ).setHorizontalAndVerticalPadding(context, 0.04, 0.0),
          );
        },
      ),
    );
  }
}
