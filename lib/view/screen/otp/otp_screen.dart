import 'package:car_share/view/screen/auth/sign_up.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../../provider/otp_provider.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/button/custom_button.dart';
import '../dashboard/dashboard_screen.dart';
import '../privacy_policy/privacy_policy_screen.dart';
import '../terms_condition/terms_condition_screen.dart';

class OTP_Screen extends StatefulWidget {
  const OTP_Screen();

  @override
  State<OTP_Screen> createState() => _OTP_ScreenState();
}

class _OTP_ScreenState extends State<OTP_Screen> {
  String verificationCode = '', otp = "";

  @override
  void initState() {
    super.initState();
    Provider.of<OTPProvider>(context, listen: false).setReStart(context);
    Provider.of<OTPProvider>(context, listen: false).startTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OTPProvider>(builder: (context, otpProvider, child) {
        return Scaffold(
          body: Container(
            height: AppConstants.itemHeight,
            width: AppConstants.itemWidth,
            decoration: const BoxDecoration(
                color: ColorResources.WHITE,
                image: DecorationImage(image: AssetImage(Images.auth_bg),fit: BoxFit.fill)
            ),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: AppConstants.itemHeight*0.01,),
                  //App logo
                  Image.asset(Images.logo,width: AppConstants.itemWidth*0.2,height: AppConstants.itemWidth*0.2,fit: BoxFit.fill,),
                  const SizedBox(height: 10,),
                  Image.asset(Images.logoHorizontal,width: AppConstants.itemWidth*0.55,height: AppConstants.itemWidth*0.09,fit: BoxFit.fill,),
                  SizedBox(height: AppConstants.itemHeight*0.08,),
                  Text("Enter OTP",
                      style: montserratRegular.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemWidth * 0.06),
                      textAlign: TextAlign.center),
                  SizedBox(height: AppConstants.itemHeight*0.02,),
                  Text("We sent a verification code on \n+91 *******789",
                      style: montserratRegular.copyWith(
                          color: ColorResources.BLACK.withOpacity(0.4),
                          fontSize: AppConstants.itemWidth * 0.04),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: AppConstants.itemHeight * 0.04,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.itemWidth * 0.18),
                    child: PinCodeTextField(
                      length: 4,
                      appContext: context,
                      obscureText: false,
                      showCursor: true,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.fade,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        fieldHeight: 45,
                        fieldWidth: 45,
                        borderWidth: 1,
                        borderRadius: BorderRadius.circular(5),
                        selectedColor: Theme.of(context).primaryColor,
                        selectedFillColor: ColorResources.WHITE,
                        inactiveFillColor: ColorResources.BLACK.withOpacity(0.55),
                        inactiveColor: ColorResources.BLACK.withOpacity(0.55),
                        activeColor: ColorResources.BLACK.withOpacity(0.55),
                        activeFillColor: ColorResources.BLACK.withOpacity(0.55),
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      onChanged: (value) => verificationCode = value,
                      beforeTextPaste: (text) {
                        return true;
                      },
                    ),
                  ),
                  SizedBox(
                    height: AppConstants.itemWidth * 0.06,
                  ),
                  GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen(),)),
                      child: const CustomButton("Verify OTP")),
                  SizedBox(
                    height: AppConstants.itemWidth * 0.06,
                  ),
                  Visibility(
                    visible: otpProvider.start == 0 ? false : true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                            '00 : ${Provider.of<OTPProvider>(context, listen: false).start} sec',
                            style: montserratMedium.copyWith(
                                color: ColorResources.BLACK,
                                fontWeight: FontWeight.w700,
                                fontSize: Dimensions.FONT_SIZE_14)),
                        SizedBox(
                          width: AppConstants.itemWidth * 0.06,
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: otpProvider.start == 0 ? true : false,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Not received OTP? ',
                            style: montserratMedium.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: Dimensions.FONT_SIZE_14)),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              AppConstants.closeKeyboard();
                              otpProvider.setReStart(context);
                              otpProvider.startTimer(context);
                            });
                          },
                          child: Text('Resend OTP',
                              style: montserratBold.copyWith(
                                  color: ColorResources.BLACK,
                                  fontSize: Dimensions.FONT_SIZE_14)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
