import 'package:finance_app/utills/style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SelectGenderScreen extends StatefulWidget {
  const SelectGenderScreen({Key? key}) : super(key: key);

  @override
  _SelectGenderScreenState createState() => _SelectGenderScreenState();
}

class _SelectGenderScreenState extends State<SelectGenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gender',
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.px, vertical: 10.px),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff67805E)),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff414A4C),
                        ),
                        child: Text(
                          'Male',
                          style: interSemiBold.copyWith(
                            fontSize: 16.sp,
                            color: Color(0xffC9C9C9),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20.px),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.px, vertical: 10.px),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff67805E)),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff414A4C),
                        ),
                        child: Text(
                          'Female',
                          style: interSemiBold.copyWith(
                            fontSize: 16.sp,
                            color: Color(0xffC9C9C9),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.px,
                    ),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.px, vertical: 10.px),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff67805E)),
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff414A4C),
                        ),
                        child: Text(
                          'Other',
                          style: interSemiBold.copyWith(
                            fontSize: 16.sp,
                            color: Color(0xffC9C9C9),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.px),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  width: 70.w,
                  padding: EdgeInsets.fromLTRB(0.px, 10.px, 0.px, 10.px),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff2E7800),
                  ),
                  child: Text(
                    'Done',
                    style: interBold.copyWith(
                      fontSize: 16.sp,
                      color: Colors.black,
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
