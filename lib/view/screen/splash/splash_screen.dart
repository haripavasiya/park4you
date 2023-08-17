import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/splash_provider.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/no_internet_screen.dart';
import '../dashboard/dashboard_screen.dart';
import '../intro/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late StreamSubscription<ConnectivityResult> _onConnectivityChanged;
  bool? isNotConnected=true;

  @override
  void initState() {
    super.initState();
    AppConstants.closeKeyboard();
    route("0");
  }

  route(String isRoute) async {
    Future.delayed(const Duration(seconds: 3)).then((val) {
      if (isRoute=="1") {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const DashboardScreen()));
      }
      else {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => const IntroScreen()));
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _onConnectivityChanged.cancel();
  }

  @override
  Widget build(BuildContext context) {
    AppConstants.screenSize=MediaQuery.of(context).size;
    AppConstants.itemHeight=AppConstants.screenSize.height;
    AppConstants.itemWidth=AppConstants.screenSize.width;
    return WillPopScope(
      onWillPop: () => AppConstants.onWillPop(context),
      child: Consumer<SplashProvider>(builder: (context,splash_provider,child){
          return Scaffold(
            backgroundColor: ColorResources.WHITE,
            body: Container(
              height: AppConstants.itemHeight,
              width: AppConstants.itemWidth,
              decoration: const BoxDecoration(
                  color: ColorResources.WHITE
              ),
              alignment: Alignment.center,
              child: splash_provider.isNetwork
                  ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Images.logo,width: AppConstants.itemWidth*0.35,height: AppConstants.itemWidth*0.35,fit: BoxFit.fill,),
                  SizedBox(height: 10,),
                  Image.asset(Images.logoHorizontal,width: AppConstants.itemWidth*0.65,height: AppConstants.itemWidth*0.12,fit: BoxFit.fill,),
                ],
              )
                  :
              NoInternetOrDataScreen(isNoInternet: true),
            ),
          );
        }
      ),
    );
  }
}