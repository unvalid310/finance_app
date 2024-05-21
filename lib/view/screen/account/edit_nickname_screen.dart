import 'package:finance_app/utills/style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditNicknameScreen extends StatefulWidget {
  const EditNicknameScreen({Key? key}) : super(key: key);

  @override
  _EditNicknameScreenState createState() => _EditNicknameScreenState();
}

class _EditNicknameScreenState extends State<EditNicknameScreen> {
  TextEditingController _nickname = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    _nickname.text = 'Dion 龙鉴';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nickname',
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
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xff969696), width: 1),
                  ),
                  color: Color(0xff414A4C),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _nickname,
                        style: interSemiBold.copyWith(
                          fontSize: 16.sp,
                          color: const Color(0xff6D6B6B),
                        ),
                        decoration: const InputDecoration(
                          filled: false,
                          contentPadding: EdgeInsets.zero,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          hintText: 'Nickname',
                        ),
                      ),
                    ),
                    SizedBox(width: 20.px),
                    InkWell(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        padding: EdgeInsets.all(5.px),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff696F71),
                        ),
                        child: Icon(Icons.close_rounded, size: 12.sp),
                      ),
                      onTap: () => setState(() {
                        _nickname.clear();
                      }),
                    )
                  ],
                ),
              ),
              SizedBox(height: 50.px),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(20.px, 10.px, 20.px, 10.px),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Color(0xff969696), width: 1),
                      bottom: BorderSide(color: Color(0xff969696), width: 1),
                    ),
                    color: Color(0xff414A4C),
                  ),
                  child: Text(
                    'Done',
                    style: interBold.copyWith(
                      fontSize: 16.sp,
                      color: const Color(0xff42FF00),
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
