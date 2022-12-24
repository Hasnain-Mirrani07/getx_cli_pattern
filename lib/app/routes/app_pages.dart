import 'package:get/get.dart';

import '../modules/country_list/bindings/country_list_binding.dart';
import '../modules/country_list/views/country_list_view.dart';
import '../modules/dio/bindings/dio_binding.dart';
import '../modules/dio/views/dio_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/reminder/bindings/reminder_binding.dart';
import '../modules/reminder/views/reminder_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DIO;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.COUNTRY_LIST,
      page: () => const CountryListView(),
      binding: CountryListBinding(),
    ),
    GetPage(
      name: _Paths.REMINDER,
      page: () => ReminderView(),
      binding: ReminderBinding(),
    ),
    GetPage(
      name: _Paths.DIO,
      page: () => const DioView(),
      binding: DioBinding(),
    ),
  ];
}
