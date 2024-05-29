import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_app/utills/app_constants.dart';
import 'package:finance_app/utills/images.dart';
import 'package:finance_app/utills/stringUtils.dart';
import 'package:finance_app/utills/style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:finance_app/getIt.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({Key? key}) : super(key: key);

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
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

  List<Map<String, dynamic>> transaction = [
    {
      'icon': Images.logo_food_drinks,
      'title': 'Food & Drink',
      'date': 'Sunday, 21 April 2024',
      'balance': '571,00'
    },
    {
      'icon': Images.logo_shopping,
      'title': 'Shopping',
      'date': 'Sunday, 21 April 2024',
      'balance': '221,00'
    },
    {
      'icon': Images.logo_electricity,
      'title': 'Electricity',
      'date': 'Sunday, 21 April 2024',
      'balance': '50,00'
    },
    {
      'icon': Images.logo_transportation,
      'title': 'Transportation',
      'date': 'Sunday, 21 April 2024',
      'balance': '8,00'
    },
    {
      'icon': Images.logo_food_drinks,
      'title': 'Food & Drink',
      'date': 'Sunday, 21 April 2024',
      'balance': '571,00'
    },
    {
      'icon': Images.logo_shopping,
      'title': 'Shopping',
      'date': 'Sunday, 15 April 2024',
      'balance': '221,00'
    },
    {
      'icon': Images.logo_electricity,
      'title': 'Electricity',
      'date': 'Sunday, 17 April 2024',
      'balance': '50,00'
    },
    {
      'icon': Images.logo_transportation,
      'title': 'Transportation',
      'date': 'Sunday, 18 April 2024',
      'balance': '8,00'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transactions',
          style: interBold.copyWith(fontSize: 18.sp),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 5.px, vertical: 10.px),
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'This Month',
                          style: interBold.copyWith(
                            fontSize: 18.sp,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.px),
                        Expanded(
                          child: Container(
                            height: 20.px,
                            child: ListView.separated(
                              itemCount: 30,
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              separatorBuilder: (context, index) =>
                                  SizedBox(width: 10.px),
                              itemBuilder: (context, index) => Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '${index + 1}/05/2024',
                                  style: interSemiBold.copyWith(
                                    fontSize: 18.sp,
                                    color: Color(0xffD0AFAF),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.5,
                color: Colors.white,
              ),
              SizedBox(height: 15.px),
              // spending report
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                width: double.infinity,
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
                                _expanse.toString(),
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
                    SizedBox(height: 20.px),
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
                                            _transaction[index]['balance'].toString(),
                                            style: interSemiBold.copyWith(
                                              fontSize: 14.sp,
                                              color: (_transaction[index]['type'] == 'expanse') ? Color(0xffFA4C4C) : Color(0xff8EFF5A),
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
