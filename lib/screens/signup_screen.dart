import 'package:demo/common/app_string.dart';
import 'package:demo/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toasty_snackbar/toasty_snackbar.dart';

import '../components/authentication_button.dart';
import '../components/custom_text_field.dart';
 import '../utils/validation.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  static String id = 'SignupScreen';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.9,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          radius: 20.0,
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new,
                              color: kDarkGreenColor,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.register,
                          style: GoogleFonts.poppins(
                            fontSize: 32.0,
                            fontWeight: FontWeight.w600,
                            color: kDarkGreenColor,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          AppStrings.createNewAccount,
                          style: GoogleFonts.poppins(
                            color: kGreyColor,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 40.0),
                        CustomTextField(
                          hintText:AppStrings.fullName,
                          icon: Icons.person,
                          keyboardType: TextInputType.name,
                          onChanged: (value) {},
                          controller: nameController,
                          validator: nameValidation,
                        ),
                        CustomTextField(
                          hintText: AppStrings.email,
                          icon: Icons.mail,
                          keyboardType: TextInputType.name,
                          onChanged: (value) {},
                          controller: emailController,
                          validator: validateEmail,
                        ),
                        CustomTextField(
                          hintText:AppStrings.password,
                          icon: Icons.lock,
                          keyboardType: TextInputType.name,
                           controller: passController,
                          validator: validatePassword, onChanged: (String ) {  },
                        ),
                        CustomTextField(
                          hintText: AppStrings.confirmPassword,
                          icon: Icons.lock,
                          keyboardType: TextInputType.name,
                          onChanged: (value) {},
                          controller: confPassController,
                          validator: validatePassword,
                        ),
                        const SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.bySigningYouAgreeToOur,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: kDarkGreenColor,
                              ),
                            ),
                            Text(
                              AppStrings.termsOfUse,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: kGreyColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppStrings.and,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: kDarkGreenColor,
                              ),
                            ),
                            Text(
                              AppStrings.privacyNotice,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: kGreyColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: AuthenticationButton(
                        label: AppStrings.signUp,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            emailController.dispose();
                            passController.dispose();
                            context.showToastySnackbar(
                                "Login Succesfully",
                                "User Login Is Succesfully Complited",
                                AlertType.success,);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
