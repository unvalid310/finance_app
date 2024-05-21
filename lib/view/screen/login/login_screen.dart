import 'package:finance_app/utills/images.dart';
import 'package:finance_app/utills/routes.dart';
import 'package:finance_app/utills/style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'email',
                    ),
                  ),
                  SizedBox(height: 18.px),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'password',
                    ),
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
                      print('login');
                      await Navigator.pushNamed(context, Routes.DASHBOARD);
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
                        fontSize: 12.sp,
                      ),
                    ),
                    onTap: () async {
                      Navigator.pushNamed(context, Routes.DASHBOARD);
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
