// ignore_for_file: avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/utills/app_constants.dart';
import 'package:finance_app/utills/images.dart';
import 'package:finance_app/utills/routes.dart';
import 'package:finance_app/utills/stringUtils.dart';
import 'package:finance_app/utills/style.dart';
import 'package:finance_app/view/screen/transaction/transaction_screen.dart';
import 'package:finance_app/view/screen/wallets/wallets_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:finance_app/getIt.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferences _sharedPrefrences = di.getIt();
  int _expanse = 0;
  int _income = 0;

  @override
  void initState() {
    super.initState();
    initExpanse();
    initIncome();
  }

  Future<void> initExpanse() async {
    int expanse = 0;
    final transaction = await FirebaseFirestore.instance
        .collection('user')
        .doc(_sharedPrefrences.getString(AppConstants.UID))
        .collection('transaction')
        .where('type', isEqualTo: 'expanse')
        .get()
        .then((value) => value);

    for (var item in transaction.docs) {
      final data = item.data();
      expanse = expanse + int.parse(data['balance'].toString());
    }
    setState(() {
      _expanse = expanse;
    });
  }

  Future<void> initIncome() async {
    int income = 0;
    final transaction = await FirebaseFirestore.instance
        .collection('user')
        .doc(_sharedPrefrences.getString(AppConstants.UID))
        .collection('transaction')
        .where('type', isEqualTo: 'income')
        .get()
        .then((value) => value);

    for (var item in transaction.docs) {
      final data = item.data();
      income = income + int.parse(data['balance'].toString());
    }
    setState(() {
      _income = income;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 15.px),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20.px, 30.px, 20.px, 15.px),
                decoration: const BoxDecoration(color: Color(0xff232B2B)),
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
                      child: RichText(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          style: interSemiBold.copyWith(
                            fontSize: 18.sp,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  '${_sharedPrefrences.getString(AppConstants.BIO)}\n',
                              style: interSemiBold.copyWith(
                                fontSize: 12.sp,
                                color: const Color(0xffD0AFAF),
                              ),
                            ),
                            TextSpan(
                              text:
                                  '${_sharedPrefrences.getString(AppConstants.NICKNAME)}',
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20.px),
                    InkWell(
                      child: Container(
                        padding: EdgeInsets.all(10.px),
                        decoration: BoxDecoration(
                          color: const Color(0xff414A4C),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          Icons.chat,
                          size: 20.px,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.px),

              // total balance
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Balance',
                          style: interSemiBold.copyWith(
                            fontSize: 14.sp,
                            color: const Color(0xffD0AFAF),
                          ),
                        ),
                        SizedBox(width: 15.px),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Text(
                            'See all',
                            style: interSemiBold.copyWith(
                              fontSize: 14.sp,
                              color: const Color(0xff8EFF5A),
                            ),
                          ),
                          onTap: () => PersistentNavBarNavigator
                              .pushNewScreenWithRouteSettings(
                            context,
                            screen: WalletsScreen(),
                            withNavBar: false,
                            settings: RouteSettings(
                              name: Routes.getDashboardRoute('wallets'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.px),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.px, 15.px, 20.px, 20.px),
                      decoration: BoxDecoration(
                        color: const Color(0xff414A4C),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Wallets',
                            style: interSemiBold.copyWith(
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10.px),
                          Row(
                            children: [
                              Image.asset(
                                Images.logo_cash,
                                width: 23.px,
                              ),
                              SizedBox(width: 5.px),
                              Text(
                                'Cash',
                                style: interSemiBold.copyWith(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10.px),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.currency_yen_outlined,
                                      color: Colors.white,
                                      size: 18.sp,
                                    ),
                                    SizedBox(width: 10.px),
                                    Text(
                                      '4000,00',
                                      style: interSemiBold.copyWith(
                                        fontSize: 16.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15.px),
              // spending report
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Spending Report',
                          style: interSemiBold.copyWith(
                            fontSize: 14.sp,
                            color: const Color(0xffD0AFAF),
                          ),
                        ),
                        SizedBox(width: 15.px),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Text(
                            'See spendding',
                            style: interSemiBold.copyWith(
                              fontSize: 14.sp,
                              color: const Color(0xff8EFF5A),
                            ),
                          ),
                          onTap: () => PersistentNavBarNavigator
                              .pushNewScreenWithRouteSettings(
                            context,
                            screen: TransactionScreen(),
                            withNavBar: false,
                            settings: RouteSettings(
                              name: Routes.getDashboardRoute('transaction'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.px),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.px, 15.px, 20.px, 20.px),
                      decoration: BoxDecoration(
                        color: const Color(0xff414A4C),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                Images.logo_cash,
                                width: 23.px,
                              ),
                              SizedBox(width: 5.px),
                              Text(
                                'Expanse: ',
                                style: interSemiBold.copyWith(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10.px),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.currency_yen_outlined,
                                      color: Colors.white,
                                      size: 18.sp,
                                    ),
                                    SizedBox(width: 10.px),
                                    Text(
                                      _expanse.toString(), //'1000,00',
                                      style: interSemiBold.copyWith(
                                        fontSize: 16.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                Images.logo_cash,
                                width: 23.px,
                              ),
                              SizedBox(width: 5.px),
                              Text(
                                'Income: ',
                                style: interSemiBold.copyWith(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10.px),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.currency_yen_outlined,
                                      color: Colors.white,
                                      size: 18.sp,
                                    ),
                                    SizedBox(width: 10.px),
                                    Text(
                                      _income.toString(),
                                      style: interSemiBold.copyWith(
                                        fontSize: 16.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.px),
                          RichText(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              style: interSemiBold.copyWith(
                                fontSize: 14.sp,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Enjoy Your Life Day ',
                                  style: interSemiBold.copyWith(
                                    color: const Color(0xffD0AFAF),
                                  ),
                                ),
                                TextSpan(
                                  text: '-0%',
                                  style: interSemiBold.copyWith(
                                      color: const Color(0xff8EFF5A)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.px),
                          Text(
                            'Spending ',
                            style: interSemiBold.copyWith(
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                          // SizedBox(height: 10.px),

                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('user')
                                .doc(_sharedPrefrences
                                    .getString(AppConstants.UID))
                                .collection('transaction')
                                .where('type', isEqualTo: 'income')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final _transaction =
                                    snapshot.data!.docs.toList();

                                for (var element in _transaction) {
                                  _expanse =
                                      int.parse(element['balance'].toString());
                                }

                                return ListView.separated(
                                  itemCount: _transaction.length,
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(top: 10.px),
                                  separatorBuilder: (context, index) =>
                                      SizedBox(height: 15.px),
                                  itemBuilder: (context, index) {
                                    return Container(
                                      child: Row(
                                        children: [
                                          Image.asset(
                                              _transaction[index]['icon']),
                                          SizedBox(width: 10.px),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _transaction[index]['category'],
                                                style: interBold.copyWith(
                                                  fontSize: 16.sp,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.currency_yen_sharp,
                                                    size: 10.px,
                                                    color:
                                                        const Color(0xffD0AFAF),
                                                  ),
                                                  SizedBox(width: 3.px),
                                                  Text(
                                                    _transaction[index]
                                                            ['balance']
                                                        .toString(),
                                                    style:
                                                        interSemiBold.copyWith(
                                                      fontSize: 12.sp,
                                                      color: const Color(
                                                          0xffD0AFAF),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              }

                              return Container();
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 15.px),
              // transaction
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Transaction',
                          style: interSemiBold.copyWith(
                            fontSize: 14.sp,
                            color: const Color(0xffD0AFAF),
                          ),
                        ),
                        SizedBox(width: 15.px),
                        Text(
                          'See transactions',
                          style: interSemiBold.copyWith(
                            fontSize: 14.sp,
                            color: const Color(0xff8EFF5A),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.px),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.px, 15.px, 20.px, 20.px),
                      decoration: BoxDecoration(
                        color: const Color(0xff414A4C),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('user')
                            .doc(_sharedPrefrences.getString(AppConstants.UID))
                            .collection('transaction')
                            .where('type', isEqualTo: 'expanse')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final _transaction = snapshot.data!.docs.toList();

                            for (var element in _transaction) {
                              _expanse =
                                  int.parse(element['balance'].toString());
                            }

                            return ListView.separated(
                              itemCount: _transaction.length,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 10.px),
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 15.px),
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Row(
                                    children: [
                                      Image.asset(_transaction[index]['icon']),
                                      SizedBox(width: 10.px),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _transaction[index]['category'],
                                              style: interBold.copyWith(
                                                fontSize: 16.sp,
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              dayAndTimeFormat(
                                                _transaction[index]['date']
                                                    .toDate(),
                                              ),
                                              style: interBold.copyWith(
                                                fontSize: 12.sp,
                                                color: const Color(0xffD0AFAF),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10.px),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.currency_yen_sharp,
                                            size: 12.px,
                                            color: const Color(0xffFA4C4C),
                                          ),
                                          SizedBox(width: 3.px),
                                          Text(
                                            _transaction[index]['balance']
                                                .toString(),
                                            style: interSemiBold.copyWith(
                                              fontSize: 14.sp,
                                              color: const Color(0xffFA4C4C),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          }

                          return Container();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
