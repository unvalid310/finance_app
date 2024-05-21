import 'package:finance_app/utills/routes.dart';
import 'package:finance_app/utills/style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AccountSecurityScreen extends StatefulWidget {
  const AccountSecurityScreen({Key? key}) : super(key: key);

  @override
  _AccountSecurityScreenState createState() => _AccountSecurityScreenState();
}

class _AccountSecurityScreenState extends State<AccountSecurityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account Security',
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
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.px, 10.px, 20.px, 10.px),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xff969696), width: 1),
                    ),
                    color: Color(0xff414A4C),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Phone',
                          style: interBold.copyWith(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.px),
                      Text(
                        '175******70',
                        style: interBold.copyWith(
                          fontSize: 16.sp,
                          color: Color(0xffD0AFAF),
                        ),
                      ),
                      SizedBox(width: 15.px),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15.px,
                          color: Color(0xffD0AFAF),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () => null,
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.px, 10.px, 20.px, 10.px),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Color(0xff969696), width: 1),
                    ),
                    color: Color(0xff414A4C),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Password',
                          style: interBold.copyWith(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.px),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 15.px,
                          color: Color(0xffD0AFAF),
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () =>
                    Navigator.pushNamed(context, Routes.RESET_PASSWORD_SCREEN),
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
                    'Save',
                    style: interBold.copyWith(
                      fontSize: 16.sp,
                      color: Color(0xffFC2929),
                    ),
                  ),
                ),
                onTap: () => Navigator.pop(context),
              ),
              SizedBox(height: 35.px),
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
                    'Delete Account',
                    style: interBold.copyWith(
                      fontSize: 16.sp,
                      color: Color(0xffFC2929),
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
