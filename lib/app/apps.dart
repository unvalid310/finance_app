import 'package:finance_app/helper/router_helper.dart';
import 'package:finance_app/utills/app_constants.dart';
import 'package:finance_app/utills/routes.dart';
import 'package:finance_app/utills/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:finance_app/getIt.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

class Apps extends StatefulWidget {
  const Apps({Key? key}) : super(key: key);

  @override
  _AppsState createState() => _AppsState();
}

class _AppsState extends State<Apps> {
  SharedPreferences _sharedPreferences = di.getIt();
  @override
  void initState() {
    // TODO: implement initState
    RouterHelper.setupRouter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return GlobalLoaderOverlay(
            useDefaultLoading: true,
            overlayColor: Colors.grey[700]?.withOpacity(0.7),
            child: MaterialApp(
              title: 'Finance App',
              initialRoute:
                  (_sharedPreferences.getString(AppConstants.UID) != null)
                      ? Routes.getMainRoute()
                      : Routes.getLoginRoute(),
              onGenerateRoute: RouterHelper.router.generator,
              theme: ThemeData(
                fontFamily: 'Inter',
                primaryColor: const Color(0xff232b2b),
                scaffoldBackgroundColor: const Color(0xff353839),
                appBarTheme: AppBarTheme(
                  centerTitle: true,
                  elevation: 0,
                  color: const Color(0xff232b2b),
                  iconTheme: IconThemeData(
                    color: Colors.white,
                    size: 24.px,
                  ),
                ),
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle: interRegular.copyWith(
                    fontSize: 16.sp,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 11.px, horizontal: 28.px),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff969696), width: 0),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffa5a5a5), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color(0xff3168b9).withOpacity(0.7),
                        width: 1.5),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color(0xffdc5555).withOpacity(0.7),
                        width: 1.5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color(0xffdc5555).withOpacity(0.7),
                        width: 1.5),
                  ),
                  filled: true,
                  fillColor: const Color(0Xff414A4C).withOpacity(0.09),
                  isDense: true,
                  hintStyle: interRegular.copyWith(
                    fontSize: 16.sp,
                    color: const Color(0xff6D6B6B),
                  ),
                  alignLabelWithHint: true,
                ),
                textTheme: TextTheme(
                  bodyText1: interSemiBold.copyWith(
                    fontSize: 17.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  bodyText2: interSemiBold.copyWith(
                    fontSize: 17.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
              ],
              debugShowCheckedModeBanner: false,
            ),
          );
        },
      ),
    );
  }
}
