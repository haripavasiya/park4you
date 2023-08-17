import 'package:flutter/material.dart';

import '../../utill/app_constants.dart';
import '../../utill/color_resources.dart';
import '../../utill/styles.dart';

class TitleView extends StatelessWidget {
  String title;
  TitleView(this.title,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorResources.WHITE,
      automaticallyImplyLeading: false,
      elevation: 1,
      centerTitle: true,
      actionsIconTheme: IconThemeData(color: ColorResources.WHITE),
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: ColorResources.COLOR_PRIMERY,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: const Icon(Icons.keyboard_arrow_left_outlined,color: ColorResources.WHITE,size: 24,)),
      ),
      title: Text(title,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: montserratMedium.copyWith(
              color: ColorResources.BLACK,
              fontSize: AppConstants.itemWidth*0.04)),
    );
  }
}
