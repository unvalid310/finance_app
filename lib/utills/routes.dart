// ignore_for_file: constant_identifier_names

class Routes {
  static const String LOGIN_SCREEN = '/login';
  static const String DASHBOARD = '/';
  static const String DASHBOARD_SCREEN = '/dashboard';
  static const String ADD_TRANSACTION_SCREEN = '/add-transaction';
  static const String CATEGORIES_SCREEN = '/categories';
  static const String EDIT_PROFILE_SCREEN = '/edit-profile';
  static const String ACCOUNT_SECURITY_SCREEN = '/account-security';
  static const String SUPPORT_SCREEN = '/support';
  static const String ABOUT_SCREEN = '/about';
  static const String SETTING_SCREEN = '/setting';
  static const String RESET_PASSWORD_SCREEN = '/reset-password';
  static const String EDIT_NICKNAME_SCREEN = '/edit-nickname';
  static const String GENDER_SCREEN = '/gender';
  static const String EDIT_PHOTO_SCREEN = '/edit-photo';

  static String getLoginRoute() => LOGIN_SCREEN;
  static String getMainRoute() => DASHBOARD;
  static String getDashboardRoute(String page) =>
      '$DASHBOARD_SCREEN?page=$page';
  static String getAddTransactionRoute() => ADD_TRANSACTION_SCREEN;
  static String getCategoriesRoute() => CATEGORIES_SCREEN;
  static String getEditProfileRoute() => EDIT_PROFILE_SCREEN;
  static String getAccountSecutiryRoute() => ACCOUNT_SECURITY_SCREEN;
  static String getSupportRoute() => SUPPORT_SCREEN;
  static String getAboutRoute() => ABOUT_SCREEN;
  static String getSettingRoute() => SETTING_SCREEN;
  static String getResetPasswordRoute() => RESET_PASSWORD_SCREEN;
  static String getEditNicknameRoute() => EDIT_NICKNAME_SCREEN;
  static String getGenderRoute() => GENDER_SCREEN;
  static String getEitPhotoRoute() => EDIT_PHOTO_SCREEN;
}
