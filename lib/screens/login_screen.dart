
import 'package:demo/common/app_string.dart';
import 'package:demo/common/constants.dart';
import 'package:demo/components/authentication_button.dart';
import 'package:demo/components/bottom_navbar.dart';
import 'package:demo/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toasty_snackbar/toasty_snackbar.dart';

import '../components/curve.dart';
import '../components/custom_text_field.dart';
import '../utils/validation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String id = 'LoginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = false;

  TextEditingController usernameController =
      TextEditingController(text: 'admin@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: 'admin123');
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.bottomRight,
        fit: StackFit.expand,
        children: [
          // First Child in the stack

          ClipPath(
            clipper: ImageClipper(),
            child: Image.network(
              'https://img.freepik.com/free-photo/3d-rendered-background-with-matrix-style-design_1048-5645.jpg?w=826&t=st=1683886750~exp=1683887350~hmac=a4713f7e5fc28f461f87eff77cd654b376888d32f3a87e2a3c45c3fbf2a36556',
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),

          // Second Child in the stack
          Positioned(
            height: MediaQuery.of(context).size.height * 0.67,
            width: MediaQuery.of(context).size.width,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.67,
                      maxWidth: MediaQuery.of(context).size.width,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // First Column
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.welcomeBack,
                              style: GoogleFonts.poppins(
                                fontSize: 32.0,
                                fontWeight: FontWeight.w600,
                                color: kDarkGreenColor,
                              ),
                            ),
                            Text(
                              AppStrings.loginToYourAccount,
                              style: GoogleFonts.poppins(
                                color: kGreyColor,
                                fontSize: 15.0,
                              ),
                            )
                          ],
                        ),

                        // Second Column
                        Column(
                          children: [
                            CustomTextField(
                              hintText: AppStrings.email,
                              icon: Icons.person,
                              keyboardType: TextInputType.name,
                              onChanged: (value) {},
                              controller: usernameController,
                              validator: validateEmail,
                            ),
                            CustomTextField(
                              hintText: AppStrings.password,
                              icon: Icons.lock,
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              onChanged: (value) {},
                              controller: passwordController,
                              validator: password,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        checkColor: Colors.white,
                                        fillColor: MaterialStateProperty.all(
                                            kDarkGreenColor),
                                        value: rememberMe,
                                        onChanged: (value) {
                                          setState(() {
                                            rememberMe = value!;
                                          });
                                        },
                                      ),
                                      Text(
                                        AppStrings.rememberMe,
                                        style: TextStyle(
                                          color: kGreyColor,
                                          fontSize: 14.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              kDarkGreenColor),
                                    ),
                                    child: const Text(
                                      AppStrings.forgotPassword,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),

                        // Third Column
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                            bottom: 20.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AuthenticationButton(
                                label: 'Log In',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.showToastySnackbar(
                                        "Login Succesfully",
                                        "User Login Is Succesfully Complited",
                                        AlertType.success);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const BottomNavBar(),
                                        ));
                                  }
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Don\'t have an account ?',
                                      style: TextStyle(fontSize: 14.0),
                                    ),
                                    TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                kDarkGreenColor),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SignupScreen(),
                                            ));
                                      },
                                      child: const Text(
                                        'Sign up',
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
