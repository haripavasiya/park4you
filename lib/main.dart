import 'dart:ui';

import 'package:car_share/provider/otp_provider.dart';
import 'package:car_share/provider/splash_provider.dart';
import 'package:car_share/provider/theme_provider.dart';
import 'package:car_share/utill/app_constants.dart';
import 'package:car_share/utill/preferenceutils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'di_container.dart' as di;
import 'package:provider/provider.dart';

import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';
import 'view/screen/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value){
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.sl<SplashProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<ThemeProvider>()),
        ChangeNotifierProvider(create: (context) => di.sl<OTPProvider>()),
      ],
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Color(0xFF703ED1), statusBarBrightness: Brightness.light));
    PreferenceUtils.init();
    return MaterialApp(
      title: AppConstants.appNAME,
      debugShowCheckedModeBanner: false,
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
      ),
      theme: Provider.of<ThemeProvider>(context).darkTheme ? dark : light,
      home: SplashScreen(),
    );
  }
}
