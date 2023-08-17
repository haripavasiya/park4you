import 'package:car_share/view/screen/notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/preferenceutils.dart';
import '../../../utill/styles.dart';
import '../../baseview/app_bar.dart';
import '../../baseview/confirm_dialog_view.dart';
import '../privacy_policy/privacy_policy_screen.dart';
import '../terms_condition/terms_condition_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool is_loading=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: TitleView('Menu'), preferredSize: const Size.fromHeight(55)),
      backgroundColor: ColorResources.WHITE,
      body: Column(
        children: [
          Divider(thickness: 1,height: AppConstants.itemWidth*0.1,color: Color(0xff333333).withOpacity(0.10),),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: ListOfDataView( "Booking History"),
          ),
          Divider(thickness: 1,height: AppConstants.itemWidth*0.1,color: Color(0xff333333).withOpacity(0.10),),

          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen(),)),
            child: ListOfDataView( "Notification"),
          ),
          Divider(thickness: 1,height: AppConstants.itemWidth*0.1,color: Color(0xff333333).withOpacity(0.10),),

          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => TermsConditionScreen(),)),
            child: ListOfDataView("Terms & conditions"),
          ),
          Divider(thickness: 1,height: AppConstants.itemWidth*0.1,color: Color(0xff333333).withOpacity(0.10),),

          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyScreen(),)),
            child: ListOfDataView("Privacy Policy"),
          ),
          Divider(thickness: 1,height: AppConstants.itemWidth*0.1,color: Color(0xff333333).withOpacity(0.10),),

          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyScreen(),)),
            child: ListOfDataView("Help"),
          ),
          Divider(thickness: 1,height: AppConstants.itemWidth*0.1,color: Color(0xff333333).withOpacity(0.10),),

          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyScreen(),)),
            child: ListOfDataView("About Us"),
          ),
          Divider(thickness: 1,height: AppConstants.itemWidth*0.1,color: Color(0xff333333).withOpacity(0.10),),

          GestureDetector(
            onTap:() {
              _onWillPop(context);
            },
            child: ListOfDataView("Logout"),
          ),
          Divider(thickness: 1,height: AppConstants.itemWidth*0.1,color: Color(0xff333333).withOpacity(0.10),),
        ],
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) {
    return showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialogView(
              description: "Do you really want to sign out?",
              leftButtonText: "No",
              rightButtonText: "Yes",
              onAgreeTap: () async {
                PreferenceUtils.clear();
              });
        }).then((value) => value ?? false);
  }
}

class ListOfDataView extends StatelessWidget {
  String title;

  ListOfDataView(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: AppConstants.itemWidth*0.05,),
          Expanded(
            child: Text(title,
                textAlign: TextAlign.start,
                style: montserratRegular.copyWith(
                  color: ColorResources.BLACK,
                  fontSize: AppConstants.itemWidth*0.045,
                )),
          ),
          Icon(Icons.arrow_forward_ios_sharp,size: 20,color: ColorResources.BLACK,),
          SizedBox(width: AppConstants.itemWidth*0.05,),
        ]);
  }
}