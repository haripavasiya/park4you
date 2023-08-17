import 'package:flutter/material.dart';
import '../view/screen/splash/splash_screen.dart';
import 'app_constants.dart';
import 'color_resources.dart';
import 'dimensions.dart';
import 'images.dart';
import 'styles.dart';

class NoInternetOrDataScreen extends StatelessWidget {
  final bool isNoInternet;
  NoInternetOrDataScreen({required this.isNoInternet});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: AppConstants.itemHeight*0.025,vertical: AppConstants.itemHeight*0.1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.025),
          color: ColorResources.WHITE,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(isNoInternet ? Images.noInternet : Images.noData, width: 160, height: 160),
              const SizedBox(height: 10),
              DefaultTextStyle(
                style: montserratSamiBold.copyWith(
                  fontSize: 30,
                  color: isNoInternet ? Theme.of(context).textTheme.bodyText1?.color : ColorResources.COLOR_PRIMERY,
                ),
                child: Text(isNoInternet ? "Oops!" : "Sorry!",),
              ),
              const SizedBox(height: 5),
              DefaultTextStyle(
                textAlign: TextAlign.center,
                style: montserratRegular, child: Text(isNoInternet ? "No internet connection" : 'No data found',),
              ),
              const SizedBox(height: 40),
              isNoInternet ? Container(
                height: 45,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(// borderRadius: BorderRadius.circular(5.0)
                    borderRadius: BorderRadius.circular(0.0), color: ColorResources.COLOR_PRIMERY),
                child: TextButton(
                  onPressed: () async {
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SplashScreen()));
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text("Try again", style: montserratMedium.copyWith(color: Theme.of(context).highlightColor, fontSize: 16)),
                  ),
                ),
              ) : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}