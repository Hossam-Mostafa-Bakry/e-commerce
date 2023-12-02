import 'package:animate_do/animate_do.dart';
import 'package:e_commerce_app_c9_mon/core/config/page_route_names.dart';
import 'package:e_commerce_app_c9_mon/core/extensions/padding_ext.dart';
import 'package:e_commerce_app_c9_mon/core/serivces/snackbar_service.dart';
import 'package:e_commerce_app_c9_mon/core/widgets/custom_text_field.dart';
import 'package:e_commerce_app_c9_mon/features/login/manager/cubit.dart';
import 'package:e_commerce_app_c9_mon/features/login/manager/states.dart';
import 'package:e_commerce_app_c9_mon/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {

  LoginView({super.key});

  TextEditingController userNameController =
      TextEditingController(text: "hossam110@gmail.com");

  TextEditingController passwordController =
      TextEditingController(text: "Asdf1234@");

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context);
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginLoadingState) {}
          if (state is LoginSuccessState) {}
        },
        builder: (context, state) {
          if (state is LoginLoadingState) {}
          if (state is LoginSuccessState) {}
          var cubit = LoginCubit.get(context);
          return Scaffold(
            backgroundColor: theme.primaryColor,
            body: Center(
              child: SingleChildScrollView(
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
                      FadeInRight(
                        delay: const Duration(milliseconds: 100),
                        child: Text(
                          "Welcome Back To Route",
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      FadeInRight(
                        delay: const Duration(milliseconds: 150),
                        child: Text(
                          "Please sign in with your mail",
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      const SizedBox(height: 50),
                      FadeInRight(
                        delay: const Duration(milliseconds: 200),
                        child: Text(
                          "User Name",
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(height: 10),
                      FadeInRight(
                        delay: const Duration(milliseconds: 250),
                        child: CustomTextField(
                          controller: userNameController,
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
                        delay: const Duration(milliseconds: 300),
                        child: Text(
                          "Password",
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                      const SizedBox(height: 10),
                      FadeInRight(
                        delay: const Duration(milliseconds: 350),
                        child: CustomTextField(
                          controller: passwordController,
                          hint: "enter your password",
                          maxLines: 1,
                          isPassword: true,
                          onValidate: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "please provide your password";
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      FadeInRight(
                        delay: const Duration(milliseconds: 400),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Forgot password ?",
                            textAlign: TextAlign.end,
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      FadeInRight(
                        delay: const Duration(milliseconds: 450),
                        child: MaterialButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              // call api to login
                              cubit
                                  .login(
                                userNameController.text,
                                passwordController.text,
                              )
                                  .then((value) {
                                SnackBarService.showSuccessMessage(
                                  "Your logged in successfully",
                                );
                                navigatorKey.currentState!
                                    .pushNamedAndRemoveUntil(
                                        PageRouteNames.home, (route) => false);
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
                              "Sign In",
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      FadeInRight(
                        delay: const Duration(milliseconds: 500),
                        child: GestureDetector(
                          onTap: () {
                            navigatorKey.currentState!
                                .pushNamed(PageRouteNames.register);
                          },
                          child: Text(
                            "Don’t have an account? Create Account",
                            textAlign: TextAlign.center,
                            style: theme.textTheme.bodyLarge,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ).setHorizontalPadding(context, 0.04),
          );
        },
      ),
    );
  }
}
