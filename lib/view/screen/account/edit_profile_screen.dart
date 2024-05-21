import 'package:finance_app/utills/images.dart';
import 'package:finance_app/utills/routes.dart';
import 'package:finance_app/utills/style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account',
          style: interBold.copyWith(fontSize: 18.sp),
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
                          'Profile Photo',
                          style: interBold.copyWith(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.px),
                      CircleAvatar(
                        radius: 18.px,
                        child: Image.asset(
                          Images.ic_account,
                          height: 15.px,
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
                          'Nickname',
                          style: interBold.copyWith(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.px),
                      Text(
                        'Dion 龙鉴',
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
                onTap: () =>
                    Navigator.pushNamed(context, Routes.EDIT_NICKNAME_SCREEN),
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
                          'Birth',
                          style: interBold.copyWith(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.px),
                      Text(
                        '08/06/2002',
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
                          'Gender',
                          style: interBold.copyWith(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.px),
                      Text(
                        'Male',
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
                onTap: () => Navigator.pushNamed(context, Routes.GENDER_SCREEN),
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
                          'Bio',
                          style: interBold.copyWith(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.px),
                      Text(
                        'Enjoy Your Life Day',
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
            ],
          ),
        ),
      ),
    );
  }
}
