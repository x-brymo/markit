import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marka/core/router/router.dart';

import 'core/lang/lang.dart';
import 'core/theme/style/a_style.dart';
import 'src/global/layout/layout_builder.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppStyle(themeIndex: 0).currentTheme,
        getPages:AppRouter.router() ,
        initialRoute: AppRouter.SPLASH,
        navigatorKey: Get.key,
        //themeMode: ThemeMode.system,
        translations:  MyLocalizations(),
        //locale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        locale: Get.deviceLocale,
        
      //themeMode: ThemeMode.dark,
      //themeMode == ThemeMode.dark ? ThemeMode.dark : ThemeMode.light,
      supportedLocales: const [Locale('en'), Locale('ar')],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        
        localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (deviceLocale != null &&
              deviceLocale.languageCode == locale.languageCode) {
            return deviceLocale;
          }
        }

        return supportedLocales.first;
      },
      
        home: child,
      ),
      child:  const LayoutBuilders(),

    );
  }
}
