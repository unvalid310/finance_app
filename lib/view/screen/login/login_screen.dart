// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/data/models/SignInSignUpResult.dart';
import 'package:finance_app/utills/app_constants.dart';
import 'package:finance_app/utills/images.dart';
import 'package:finance_app/utills/routes.dart';
import 'package:finance_app/utills/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:finance_app/getIt.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SharedPreferences _sharedPrefrences = di.getIt();

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  Future<SignInSignUpResult> signInWhitEmail() async {
    String message = '';
    try {
      final fAuth = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      message = 'Login is success';

      _sharedPrefrences.setString(AppConstants.UID, fAuth.user!.uid);
      _sharedPrefrences.setString(AppConstants.EMAIL, fAuth.user!.email!);
      final userData = await FirebaseFirestore.instance
          .collection('user')
          .doc(_sharedPrefrences.getString(AppConstants.UID))
          .snapshots()
          .first;

      if (userData != null) {
        _sharedPrefrences.setString(
            AppConstants.NICKNAME, userData['nickname']);
        _sharedPrefrences.setString(AppConstants.BIRTH, userData['birth']);
        _sharedPrefrences.setString(AppConstants.GENDER, userData['gender']);
        _sharedPrefrences.setString(AppConstants.BIO, userData['bio']);
      }

      return SignInSignUpResult(user: fAuth.user, message: message);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        message = 'Invalid login credentials.';
      } else {
        message = e.code;
      }

      return SignInSignUpResult(message: message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 28.px, vertical: 30.px),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(Images.logo),
                  SizedBox(height: 38.px),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 18.px),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.px),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                        vertical: 15.px,
                        horizontal: 20.px,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'LOGIN',
                        style: interRegular.copyWith(
                          color: Colors.white,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        context.loaderOverlay.show();

                        final logIn = await signInWhitEmail();

                        if (logIn.user != null) {
                          context.loaderOverlay.hide();

                          await Navigator.pushNamedAndRemoveUntil(
                            context,
                            Routes.DASHBOARD,
                            (route) => false,
                          );
                        } else {
                          context.loaderOverlay.hide();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(
                                logIn.message!,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        }
                      }
                    },
                  ),
                  SizedBox(height: 18.px),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Text(
                      'Forgot password?',
                      style: interLight.copyWith(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                    onTap: () async {
                      // Navigator.pushNamed(context, Routes.DASHBOARD);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
