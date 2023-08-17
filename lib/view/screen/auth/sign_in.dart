import 'package:car_share/view/screen/auth/sign_up.dart';
import 'package:car_share/view/screen/otp/otp_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../privacy_policy/privacy_policy_screen.dart';
import '../terms_condition/terms_condition_screen.dart';

class Sign_In_Screen extends StatefulWidget {
  const Sign_In_Screen();

  @override
  State<Sign_In_Screen> createState() => _Sign_In_ScreenState();
}

class _Sign_In_ScreenState extends State<Sign_In_Screen> {

  TextEditingController phoneControll=TextEditingController();
  bool isChecked=false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return ColorResources.COLOR_PRIMERY;
      }
      return ColorResources.COLOR_PRIMERY;
    }
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
              SizedBox(height: AppConstants.itemHeight*0.02,),

              //Fill Form
              Container(
                width: AppConstants.itemWidth,
                margin: EdgeInsets.symmetric(horizontal: AppConstants.itemHeight*0.02),
                child: Column(
                  children: [

                    Row(
                      children: [
                        Image.asset(Images.IC_PHONE,width: 25,height: 25,color: ColorResources.BLACK,),
                        Expanded(
                          child: TextFormField(
                            controller:phoneControll,
                            textAlign: TextAlign.left,
                            keyboardType: TextInputType.number,
                            textCapitalization: TextCapitalization.characters,
                            textInputAction: TextInputAction.done,
                            style: montserratRegular.copyWith(color: ColorResources.BLACK),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            maxLength: 10,
                            onChanged: (value) {
                              if(value.length==10){
                                AppConstants.closeKeyboard();
                              }
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                fillColor: ColorResources.TRANSPARENT,
                                hintText: "Mobile Number",
                                hintStyle: montserratRegular.copyWith(color: ColorResources.BLACK.withOpacity(0.8)),
                                filled: true,
                                counterText: ""
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(thickness: 1,height: 1,color: ColorResources.GREY),
                    SizedBox(height: AppConstants.itemWidth*0.03,),
                  ],
                ),
              ),
              SizedBox(height: AppConstants.itemHeight*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Expanded(child:  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(children: <TextSpan>[

                      TextSpan(
                          text: "By signing you agree to our ",
                          style: montserratRegular.copyWith( fontSize: 12,color: ColorResources.BLACK)),

                      TextSpan(
                        text: "Privacy Policy",
                        style: montserratMedium.copyWith( fontSize: 12,color: ColorResources.COLOR_PRIMERY),
                        recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context,MaterialPageRoute(builder: (context) => const PrivacyPolicyScreen(),)),
                      ),

                      TextSpan(
                        text: " and ",
                        style: montserratRegular.copyWith( fontSize: 12,color: ColorResources.BLACK),),

                      TextSpan(
                        text: "Terms of use",
                        style: montserratMedium.copyWith( fontSize: 12,color: ColorResources.COLOR_PRIMERY),
                        recognizer: TapGestureRecognizer()..onTap = () => Navigator.push(context,MaterialPageRoute(builder: (context) => const TermsConditionScreen(),)),
                      ),
                    ]),
                  ),),
                ],
              ),
              //Button
              GestureDetector(
                onTap:() {
                  if(phoneControll.text==''){
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter mobile no'),
                          backgroundColor: ColorResources.RED,
                          duration: Duration(seconds: 2),
                        )
                    );
                  } else if(phoneControll.text.length!=10){
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter valid mobile no'),
                          backgroundColor: ColorResources.RED,
                          duration: Duration(seconds: 2),
                        )
                    );
                  } else if(!isChecked){
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please accept Privacy Policy and Terms of use'),
                          backgroundColor: ColorResources.RED,
                          duration: Duration(seconds: 2),
                        )
                    );
                  }  else{
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const OTP_Screen(),));
                  }
                },
                child: Container(
                  width: AppConstants.itemWidth,
                  margin: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.02,horizontal: AppConstants.itemWidth*0.13),
                  padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.035),
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage(Images.bg_button),fit: BoxFit.fill),
                  ),
                  child: Text("Log In",textAlign: TextAlign.center,style: montserratRegular.copyWith(color: ColorResources.WHITE,fontSize: AppConstants.itemWidth*0.04)),
                ),
              ),
              SizedBox(height: AppConstants.itemHeight*0.005,),

              //Create Account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Create a new account ? ",style: montserratRegular.copyWith(color: ColorResources.BLACK.withOpacity(0.5),fontSize: AppConstants.itemWidth*0.035),),
                  GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Sign_Up_Screen(),)),
                      child: Text("Sign Up",style: montserratRegular.copyWith(color: ColorResources.COLOR_PRIMERY,fontSize: AppConstants.itemWidth*0.035),))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
