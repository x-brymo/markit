
//import 'package:flutter/material.dart';

// ignore_for_file: constant_identifier_names

import 'package:get/get_navigation/get_navigation.dart';
import 'package:marka/src/global/auth_view/layout_auth.dart';
import 'package:marka/src/global/auth_view/register_view.dart';
import 'package:marka/src/global/layout/layout_builder.dart';
import 'package:marka/src/global/leading/leading_view.dart';
import 'package:marka/src/global/loader/loader_view.dart';

import '../../src/global/auth_view/login_view.dart';
import '../../src/export/expAd.dart';

class AppRouter {
     // static RouteObserver<Route> routeObserver = RouteObserver();
     static const HOME = '/home';
     static const LOGIN = '/login';
     static const SPLASH = '/splash';
     static const REGISTER = '/register';
     static const FORGOT_PASSWORD = '/forgot_password';
     static const RESET_PASSWORD = '/reset_password';
     static const PROFILE = '/profile';
     static const EDIT_PROFILE = '/edit_profile';
     static const CATEGORIES = '/categories';
     static const CATEGORY = '/category';
     static const SEARCH = '/search';
     static const CART = '/cart';
     static const ORDER = '/order';
     static const ORDER_DETAILS = '/order_details';
     static const CHECKOUT = '/checkout';
     static const PAYMENT = '/payment';
     static const PAYMENT_SUCCESS = '/payment_success';
     static const PAYMENT_FAILED = '/payment_failed';
     static const TRACK_ORDER = '/track_order';
     static const PAYMENT_METHOD = '/payment_method';
     static const NOTIFICATION = '/notification';
     static const TERMS = '/terms';
     static const PRIVACY = '/privacy';
     static const ABOUT_US = '/about_us';
     static const CONTACT_US = '/contact_us';
     static const FAQ = '/faq';
     static const ADDRESS = '/address';
     static const ADDRESS_DETAILS = '/address_details';
     static const SHIPPING = '/shipping';
     static const SHIPPING_DETAILS = '/shipping_details';
     static const LAYOUT = '/layout';
     static const LAYOUTAUTH = '/layoutAuth';
     static const LEADING = '/leading';
     static const HOMEADMIN = '/homeAdmin';
     static List<GetPage> router(){
  /// reset password, profile, edit profile, categories, category, search, cart, order, order details,
  /// checkout, payment, payment success, payment failed, track order, and payment method routes.
  ///
  /// The router is defined as a list of [GetPage] objects, where each [GetPage] object
  /// defines the route name, the page to be displayed when the route is navigated to, and
       return [
  ///
  /// The router is used by the [GetMaterialApp] widget to define the routes of the app.
         GetPage(name: SPLASH, page: ()=>const LoaderView(),transition: Transition.fadeIn ),
         GetPage(name: LAYOUT, page: ()=>const LayoutBuilders()),
         GetPage(name: LEADING, page: ()=>const LeadingView()),
          GetPage(name: LOGIN, page: ()=>const LoginView()),
          GetPage(name: LAYOUTAUTH, page: ()=>const LayoutAuth()),
          GetPage(name: REGISTER, page: ()=>const RegisterView()),
          GetPage(name: HOMEADMIN, page: ()=>const HomeView()),
        //  GetPage(name: FORGOT_PASSWORD, page: ()=>FORGOT_PASSWORD),
        //  GetPage(name: RESET_PASSWORD, page: ()=>RESET_PASSWORD),
        //  GetPage(name: PROFILE, page: ()=>PROFILE),
        //  GetPage(name: EDIT_PROFILE, page: ()=>EDIT_PROFILE),
        //  GetPage(name: CATEGORIES, page: ()=>CATEGORIES),
        //  GetPage(name: CATEGORY, page: ()=>CATEGORY),
        //  GetPage(name: SEARCH, page: ()=>SEARCH),
        //  GetPage(name: CART, page: ()=>CART),
        //  GetPage(name: ORDER, page: ()=>ORDER),
        //  GetPage(name: ORDER_DETAILS, page: ()=>ORDER_DETAILS),
        //  GetPage(name: CHECKOUT, page: ()=>CHECKOUT),
        //  GetPage(name: PAYMENT, page: ()=>PAYMENT),
        //  GetPage(name: PAYMENT_SUCCESS, page: ()=>PAYMENT_SUCCESS),
        //  GetPage(name: PAYMENT_FAILED, page: ()=>PAYMENT_FAILED),
        //  GetPage(name: TRACK_ORDER, page: ()=>TRACK_ORDER),
        //  GetPage(name: PAYMENT_METHOD, page: ()=>PAYMENT_METHOD),
       ];
     }

}