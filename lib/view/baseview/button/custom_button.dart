import 'package:flutter/material.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  const CustomButton(this.buttonText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.2),
      padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.04),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage(Images.bg_button),fit: BoxFit.fill),
      ),
      child: Text(buttonText,style: montserratMedium.copyWith(color: ColorResources.WHITE,fontSize: AppConstants.itemWidth*0.04),),
    );
  }
}

class CustomButtonBorder extends StatelessWidget {
  final String buttonText;
  const CustomButtonBorder(this.buttonText);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.05),
      padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.04),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: ColorResources.WHITE,
          border: Border.all(color: ColorResources.COLOR_PRIMERY,width: 1),
          borderRadius: BorderRadius.circular(AppConstants.itemWidth*0.04),
      ),
      child: Text(buttonText,style: montserratMedium.copyWith(color: ColorResources.COLOR_PRIMERY,fontSize: AppConstants.itemWidth*0.04),),
    );
  }
}