import 'package:finance_app/utills/routes.dart';
import 'package:finance_app/utills/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({Key? key}) : super(key: key);

  @override
  _AddTransactionScreenState createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  TextEditingController _balance = TextEditingController();
  TextEditingController _category = TextEditingController();
  TextEditingController _note = TextEditingController();
  TextEditingController _calendar = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    _balance..text = '0';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Transaction',
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
        padding: EdgeInsets.fromLTRB(20.px, 20.px, 20.px, 20.px),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 15.px, vertical: 10.px),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'RMB',
                      style: interSemiBold.copyWith(
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 20.px),
                  Expanded(
                    child: TextFormField(
                      controller: _balance,
                      keyboardType: TextInputType.number,
                      style: interRegular.copyWith(
                          color: Colors.white, fontSize: 18.sp),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 5.px, vertical: 10.px),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        label: Text(
                          'Balance',
                          style: interSemiBold.copyWith(
                            fontSize: 12.sp,
                            color: const Color(0xffD0AFAF),
                          ),
                        ),
                        hintText: '0',
                        hintStyle: interRegular.copyWith(
                          fontSize: 18.sp,
                          color: const Color(0xffD0AFAF),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25.px),
              TextFormField(
                controller: _category,
                readOnly: true,
                style:
                    interRegular.copyWith(color: Colors.white, fontSize: 16.sp),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5.px, 10.px, 0.px, 10.px),
                  border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  suffixIconConstraints:
                      BoxConstraints(minWidth: 2.w, maxHeight: 8.h),
                  suffixIcon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18.sp,
                    color: Colors.white,
                  ),
                  hintText: 'Select Category',
                  hintStyle: interRegular.copyWith(
                    fontSize: 16.sp,
                    color: const Color(0xffD0AFAF),
                  ),
                ),
                onTap: () async {
                  var categories = await Navigator.pushNamed(
                    context,
                    Routes.CATEGORIES_SCREEN,
                  );

                  if (categories != null) {
                    setState(() {
                      _category..text = categories.toString();
                    });
                  }
                },
              ),
              SizedBox(height: 15.px),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notes_rounded,
                    size: 20.sp,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20.px),
                  Expanded(
                    child: TextFormField(
                      controller: _note,
                      style: interRegular.copyWith(
                          color: Colors.white, fontSize: 16.sp),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(5.px, 10.px, 0.px, 10.px),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        hintText: 'Note',
                        hintStyle: interRegular.copyWith(
                          fontSize: 16.sp,
                          color: const Color(0xffD0AFAF),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.px),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_month_outlined,
                    size: 20.sp,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20.px),
                  Expanded(
                    child: TextFormField(
                      controller: _calendar,
                      readOnly: true,
                      style: interRegular.copyWith(
                          color: Colors.white, fontSize: 16.sp),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(5.px, 10.px, 0.px, 10.px),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        suffixIconConstraints:
                            BoxConstraints(minWidth: 2.w, maxHeight: 8.h),
                        suffixIcon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18.sp,
                          color: Colors.white,
                        ),
                        hintText: 'Calendar',
                        hintStyle: interRegular.copyWith(
                          fontSize: 16.sp,
                          color: const Color(0xffD0AFAF),
                        ),
                      ),
                      onTap: () async {
                        var date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2022, 10),
                          lastDate: DateTime(DateTime.now().year + 1, 1),
                          initialDate:
                              DateTime(_selectedDate.year, _selectedDate.month),
                        );

                        if (date != null) {
                          setState(() {
                            _selectedDate = date;
                            _calendar
                              ..text =
                                  DateFormat('EEEE, dd-MMMM-yyyy').format(date);
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.px, 0.px, 20.px, 5.px),
            child: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding:
                    EdgeInsets.symmetric(horizontal: 15.px, vertical: 10.px),
                decoration: const BoxDecoration(
                  color: Color(0xff5C5C5C),
                ),
                child: Text(
                  'Save',
                  style: interBold.copyWith(
                    color: const Color(0xff720000),
                  ),
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),
          )
        ],
      ),
    );
  }
}
