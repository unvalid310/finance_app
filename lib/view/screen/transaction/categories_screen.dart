// ignore_for_file: unused_field

import 'package:finance_app/utills/images.dart';
import 'package:finance_app/utills/style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final List<Map<String, dynamic>> _categories = [
    {
      "icon": Images.logo_food_drinks,
      "name": "Food & Drink",
      "parent": [],
    },
    {
      "icon": Images.logo_shopping,
      "name": "Shopping",
      "parent": [
        {
          "icon": Images.logo_clothes,
          "name": "Clothes",
        },
        {
          "icon": Images.logo_jewellery,
          "name": "Jewellery",
        },
        {
          "icon": Images.logo_electronic,
          "name": "Electronic",
        }
      ],
    },
    {
      "icon": Images.logo_electricity,
      "name": "Electricity",
      "parent": [
        {
          "icon": Images.logo_repair,
          "name": "Reapairs",
        },
        {
          "icon": Images.logo_water,
          "name": "Waters",
        },
      ],
    },
    {
      "icon": Images.logo_transportation,
      "name": "Transportation",
      "parent": [],
    },
    {
      "icon": Images.logo_fitnes,
      "name": "Fitness",
      "parent": [],
    },
    {
      "icon": Images.logo_healt,
      "name": "Health",
      "parent": [],
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categories',
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
        child: ListView.separated(
          itemCount: (_categories.length > 0) ? _categories.length + 1 : 1,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (context, index) => SizedBox(height: 20.px),
          itemBuilder: (context, index) {
            if (index == 0) {
              return Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.px, vertical: 10.px),
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
                    Container(
                      padding: EdgeInsets.all(5.px),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xff5AA54E)),
                      child: Icon(
                        Icons.add_rounded,
                        size: 15.px,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10.px),
                    Text(
                      'New Category',
                      style: interSemiBold.copyWith(
                        fontSize: 16.sp,
                        color: const Color(0xff5AA54E),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              var _parent = _categories[index - 1]['parent'];

              return Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.px, vertical: 10.px),
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Color(0xff969696), width: 1),
                    bottom: BorderSide(color: Color(0xff969696), width: 1),
                  ),
                  color: Color(0xff414A4C),
                ),
                child: (_parent.length > 0)
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5.px),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff5AA54E)),
                                child: Image.asset(
                                  _categories[index - 1]['icon'],
                                  height: 15.px,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              SizedBox(width: 10.px),
                              Text(
                                _categories[index - 1]['name'],
                                style: interSemiBold.copyWith(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.px),
                          ListView.builder(
                            itemCount: _parent.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, i) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: Container(
                                  margin: EdgeInsets.only(left: 20.px),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.px, vertical: 10.px),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                          color: Color(0xff969696), width: 1),
                                    ),
                                    color: Color(0xff414A4C),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5.px),
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color(0xff5AA54E),
                                        ),
                                        child: Image.asset(
                                          _parent[i]['icon'],
                                          height: 15.px,
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      SizedBox(width: 10.px),
                                      Text(
                                        _parent[i]['name'],
                                        style: interSemiBold.copyWith(
                                          fontSize: 16.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () =>
                                    Navigator.pop(context, _parent[i]['name']),
                              );
                            },
                          ),
                        ],
                      )
                    : InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5.px),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xff5AA54E)),
                              child: Image.asset(
                                _categories[index - 1]['icon'],
                                height: 15.px,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            SizedBox(width: 10.px),
                            Text(
                              _categories[index - 1]['name'],
                              style: interSemiBold.copyWith(
                                fontSize: 16.sp,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        onTap: () => Navigator.pop(
                            context, _categories[index - 1]['name']),
                      ),
              );
            }
          },
        ),
      ),
    );
  }
}
