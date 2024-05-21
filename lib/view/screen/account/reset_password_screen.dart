import 'package:finance_app/utills/style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Set Password',
          style: interBold.copyWith(fontSize: 18.sp),
        ),
        leading: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: const Icon(Icons.arrow_back_ios_new_rounded),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20.px, 10.px, 20.px, 10.px),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xff969696), width: 1),
                  ),
                  color: Color(0xff414A4C),
                ),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    filled: false,
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    hintText: 'Old Password',
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20.px, 10.px, 20.px, 10.px),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xff969696), width: 1),
                  ),
                  color: Color(0xff414A4C),
                ),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    filled: false,
                    contentPadding: EdgeInsets.zero,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    hintText: 'New Password',
                  ),
                ),
              ),
              SizedBox(height: 50.px),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(20.px, 10.px, 20.px, 10.px),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Color(0xff969696), width: 1),
                      bottom: BorderSide(color: Color(0xff969696), width: 1),
                    ),
                    color: Color(0xff414A4C),
                  ),
                  child: Text(
                    'Done',
                    style: interBold.copyWith(
                      fontSize: 16.sp,
                      color: const Color(0xff42FF00),
                    ),
                  ),
                ),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
