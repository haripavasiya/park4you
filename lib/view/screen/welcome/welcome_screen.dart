import 'package:car_share/view/screen/auth/sign_in.dart';
import 'package:car_share/view/screen/auth/sign_up.dart';
import 'package:flutter/material.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../baseview/button/custom_button.dart';
import '../dashboard/dashboard_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen();

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => AppConstants.onWillPop(context),
      child: Scaffold(
        body: Container(
          height: AppConstants.itemHeight,
          width: AppConstants.itemWidth,
          decoration: const BoxDecoration(
              color: ColorResources.WHITE,
            image: DecorationImage(image: AssetImage(Images.auth_bg),fit: BoxFit.fill)
          ),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(child: SizedBox(height: AppConstants.itemWidth*0.5,)),
              Image.asset(Images.welcome_icon,fit: BoxFit.fill,width: AppConstants.itemHeight*0.35,height: AppConstants.itemHeight*0.35,),
              Flexible(child: SizedBox(height: AppConstants.itemWidth*0.5,)),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_In_Screen(),)),
                      child: const CustomButton("Log In"),
                  ),
                  SizedBox(height: AppConstants.itemWidth*0.04,),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_Up_Screen(),)),
                      child: const CustomButton("Sign Up"),
                  ),
                ],
              ),
              Flexible(child: SizedBox(height: AppConstants.itemWidth*0.5,)),
            ],
          ),
        ),
      ),
    );
  }
}
