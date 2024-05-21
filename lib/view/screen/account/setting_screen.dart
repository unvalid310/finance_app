import 'package:finance_app/utills/style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting',
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
                          'Time Format',
                          style: interBold.copyWith(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.px),
                      Text(
                        '25/04/2024',
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
                          'Language',
                          style: interBold.copyWith(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.px),
                      Text(
                        'English',
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
                          'First day of week',
                          style: interBold.copyWith(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.px),
                      Text(
                        'Monday',
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
                          'First day of the month',
                          style: interBold.copyWith(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.px),
                      Text(
                        '1st',
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
                          'First month of the year',
                          style: interBold.copyWith(
                            fontSize: 16.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.px),
                      Text(
                        'January',
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
