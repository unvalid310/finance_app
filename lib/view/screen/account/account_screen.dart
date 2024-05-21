import 'package:finance_app/utills/images.dart';
import 'package:finance_app/utills/routes.dart';
import 'package:finance_app/utills/style.dart';
import 'package:finance_app/view/screen/account/about_screen.dart';
import 'package:finance_app/view/screen/account/account_security_screen.dart';
import 'package:finance_app/view/screen/account/edit_profile_screen.dart';
import 'package:finance_app/view/screen/account/setting_screen.dart';
import 'package:finance_app/view/screen/account/support_screen.dart';
import 'package:finance_app/view/screen/transaction/categories_screen.dart';
import 'package:finance_app/view/screen/wallets/wallets_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.px, 10.px, 20.px, 10.px),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Color(0xff969696), width: 1),
                      bottom: BorderSide(color: Color(0xff969696), width: 1),
                    ),
                    color: Color(0xff414A4C),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 18.px,
                        child: Image.asset(
                          Images.ic_account,
                          height: 15.px,
                        ),
                      ),
                      SizedBox(width: 10.px),
                      Expanded(
                        child: Text(
                          'Edit Profile',
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
                    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  context,
                  screen: const EditProfileScreen(),
                  withNavBar: false,
                  settings: const RouteSettings(
                    name: '',
                  ),
                ),
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
                          'Account Security',
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
                    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  context,
                  screen: const AccountSecurityScreen(),
                  withNavBar: false,
                  settings: const RouteSettings(
                    name: '',
                  ),
                ),
              ),
              SizedBox(height: 25.px),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.px, 10.px, 20.px, 10.px),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Color(0xff969696), width: 1),
                      bottom: BorderSide(color: Color(0xff969696), width: 1),
                    ),
                    color: Color(0xff414A4C),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'My Wallets',
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
                    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  context,
                  screen: const WalletsScreen(),
                  withNavBar: false,
                  settings: RouteSettings(
                    name: Routes.getDashboardRoute('wallets'),
                  ),
                ),
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
                          'Categories',
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
                    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  context,
                  screen: const CategoriesScreen(),
                  withNavBar: false,
                  settings: const RouteSettings(
                    name: '',
                  ),
                ),
              ),
              SizedBox(height: 25.px),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.px, 10.px, 20.px, 10.px),
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Color(0xff969696), width: 1),
                      bottom: BorderSide(color: Color(0xff969696), width: 1),
                    ),
                    color: Color(0xff414A4C),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Support',
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
                    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  context,
                  screen: const SupportScreen(),
                  withNavBar: false,
                  settings: const RouteSettings(
                    name: '',
                  ),
                ),
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
                          'About',
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
                    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  context,
                  screen: const AboutScreen(),
                  withNavBar: false,
                  settings: const RouteSettings(
                    name: '',
                  ),
                ),
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
                          'Setting',
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
                    PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  context,
                  screen: const SettingScreen(),
                  withNavBar: false,
                  settings: const RouteSettings(
                    name: '',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
