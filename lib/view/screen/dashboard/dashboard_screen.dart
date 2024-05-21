import 'package:finance_app/utills/images.dart';
import 'package:finance_app/utills/routes.dart';
import 'package:finance_app/view/screen/account/account_screen.dart';
import 'package:finance_app/view/screen/home/home_screen.dart';
import 'package:finance_app/view/screen/transaction/add_transaction_screen.dart';
import 'package:finance_app/view/screen/transaction/transaction_screen.dart';
import 'package:finance_app/view/screen/wallets/wallets_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DashboardScreen extends StatefulWidget {
  final int pageIndex;
  const DashboardScreen({Key? key, required this.pageIndex}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  PersistentTabController? _pageController;
  int _pageIndex = 0;
  List<Widget> _screens = [];

  @override
  void initState() {
    // TODO: implement initState
    _pageIndex = widget.pageIndex;
    _pageController = PersistentTabController(initialIndex: widget.pageIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: PersistentTabView(
          key: _navigatorKey,
          context,
          controller: _pageController!,
          screens: _buildScreens(),
          items: _navBarsItems(),
          confineInSafeArea: true,
          padding: NavBarPadding.only(top: 10.px),
          navBarHeight: 70.px,
          backgroundColor: const Color(0xff232B2B), // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: false, // Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(0),
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .style15, // Choose the nav bar style with this property.
        ),
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(Images.ic_home),
        title: "Home",
        activeColorPrimary: Color(0xff8EFF5A),
        inactiveColorPrimary: Color(0xffD0AFAF),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(Images.ic_wallet),
        title: "Wallets",
        activeColorPrimary: Color(0xff8EFF5A),
        inactiveColorPrimary: Color(0xffD0AFAF),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          Images.ic_plus,
          width: 25.px,
        ),
        inactiveColorPrimary: Color(0xff228B22),
        activeColorPrimary: Color(0xff228B22),
        onPressed: (p0) =>
            Navigator.pushNamed(context, Routes.ADD_TRANSACTION_SCREEN),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          Images.ic_transactions,
        ),
        title: "Transactions",
        activeColorPrimary: Color(0xff8EFF5A),
        inactiveColorPrimary: Color(0xffD0AFAF),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(Images.ic_account),
        title: "Account",
        activeColorPrimary: Color(0xff8EFF5A),
        inactiveColorPrimary: Color(0xffD0AFAF),
      ),
    ];
  }

  List<Widget> _buildScreens() {
    setState(() {
      _screens = [
        const HomeScreen(),
        const WalletsScreen(),
        const AddTransactionScreen(),
        const TransactionScreen(),
        const AccountScreen(),
      ];
    });

    return _screens;
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController!.jumpToTab(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}
