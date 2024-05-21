// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:finance_app/utills/images.dart';
import 'package:finance_app/utills/style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WalletsScreen extends StatefulWidget {
  const WalletsScreen({Key? key}) : super(key: key);

  @override
  _WalletsScreenState createState() => _WalletsScreenState();
}

class _WalletsScreenState extends State<WalletsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wallets',
          style: interBold.copyWith(fontSize: 18.sp),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20.px, 30.px, 20.px, 15.px),
        child: ListView.separated(
          itemCount: 3,
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(height: 45.px),
          itemBuilder: (context, index) => Image.asset(
            'assets/logo/log_card${index + 1}.png',
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
