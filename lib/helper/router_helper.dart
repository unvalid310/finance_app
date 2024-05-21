import 'package:finance_app/utills/routes.dart';
import 'package:finance_app/view/screen/account/about_screen.dart';
import 'package:finance_app/view/screen/account/account_security_screen.dart';
import 'package:finance_app/view/screen/account/edit_nickname_screen.dart';
import 'package:finance_app/view/screen/account/edit_profile_screen.dart';
import 'package:finance_app/view/screen/account/reset_password_screen.dart';
import 'package:finance_app/view/screen/account/select_gender_screen.dart';
import 'package:finance_app/view/screen/account/setting_screen.dart';
import 'package:finance_app/view/screen/account/support_screen.dart';
import 'package:finance_app/view/screen/dashboard/dashboard_screen.dart';
import 'package:finance_app/view/screen/login/login_screen.dart';
import 'package:finance_app/view/screen/transaction/add_transaction_screen.dart';
import 'package:finance_app/view/screen/transaction/categories_screen.dart';
import 'package:fluro/fluro.dart';

class RouterHelper {
  static final FluroRouter router = FluroRouter();

  static final Handler _loginHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) => const LoginScreen(),
  );
  static final Handler _dashScreenBoardHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    return DashboardScreen(
      pageIndex: params['page'][0] == 'home'
          ? 0
          : params['page'][0] == 'wallets'
              ? 1
              : params['page'][0] == 'transaction'
                  ? 3
                  : params['page'][0] == 'account'
                      ? 4
                      : 0,
    );
  });
  static final Handler _dashboardHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) =>
        const DashboardScreen(pageIndex: 0),
  );
  static final Handler _addTransactionHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) =>
        const AddTransactionScreen(),
  );
  static final Handler _categoriesHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) =>
        const CategoriesScreen(),
  );

  static final Handler _editProfileHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) =>
        const EditProfileScreen(),
  );
  static final Handler _accountSecurityHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) =>
        const AccountSecurityScreen(),
  );
  static final Handler _supportHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) =>
        const SupportScreen(),
  );
  static final Handler _aboutHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) => const AboutScreen(),
  );
  static final Handler _settingHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) =>
        const SettingScreen(),
  );
  static final Handler _resetPasswordHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) =>
        const ResetPasswordScreen(),
  );
  static final Handler _editNicknameHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) =>
        const EditNicknameScreen(),
  );
  static final Handler _genderHandler = Handler(
    handlerFunc: (context, Map<String, dynamic> params) =>
        const SelectGenderScreen(),
  );

  static void setupRouter() {
    router.define(
      Routes.LOGIN_SCREEN,
      handler: _loginHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      Routes.DASHBOARD,
      handler: _dashboardHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      Routes.DASHBOARD_SCREEN,
      handler: _dashScreenBoardHandler,
      transitionType: TransitionType.fadeIn,
    );
    router.define(
      Routes.ADD_TRANSACTION_SCREEN,
      handler: _addTransactionHandler,
      transitionType: TransitionType.inFromBottom,
    );
    router.define(
      Routes.CATEGORIES_SCREEN,
      handler: _categoriesHandler,
      transitionType: TransitionType.inFromBottom,
    );
    router.define(
      Routes.EDIT_PROFILE_SCREEN,
      handler: _editProfileHandler,
      transitionType: TransitionType.inFromRight,
    );
    router.define(
      Routes.ACCOUNT_SECURITY_SCREEN,
      handler: _accountSecurityHandler,
      transitionType: TransitionType.inFromRight,
    );
    router.define(
      Routes.SUPPORT_SCREEN,
      handler: _supportHandler,
      transitionType: TransitionType.inFromRight,
    );
    router.define(
      Routes.ABOUT_SCREEN,
      handler: _aboutHandler,
      transitionType: TransitionType.inFromRight,
    );
    router.define(
      Routes.SETTING_SCREEN,
      handler: _settingHandler,
      transitionType: TransitionType.inFromRight,
    );
    router.define(
      Routes.RESET_PASSWORD_SCREEN,
      handler: _resetPasswordHandler,
      transitionType: TransitionType.inFromRight,
    );
    router.define(
      Routes.EDIT_NICKNAME_SCREEN,
      handler: _editNicknameHandler,
      transitionType: TransitionType.inFromRight,
    );
    router.define(
      Routes.GENDER_SCREEN,
      handler: _genderHandler,
      transitionType: TransitionType.inFromRight,
    );
  }
}
