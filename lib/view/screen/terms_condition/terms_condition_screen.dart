import 'package:flutter/material.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/styles.dart';
import '../../baseview/app_bar.dart';

class TermsConditionScreen extends StatefulWidget {
  const TermsConditionScreen({Key? key}) : super(key: key);

  @override
  State<TermsConditionScreen> createState() => _TermsConditionScreenState();
}

class _TermsConditionScreenState extends State<TermsConditionScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: TitleView('Terms & conditions'), preferredSize: const Size.fromHeight(55)),
      backgroundColor: ColorResources.WHITE,
      body: Column(
        children: [
          SizedBox(height: AppConstants.itemWidth*0.08,),
          const Expanded(
            child: Text("Terms & conditions",
              style: montserratMedium,
            ),
          ),
          SizedBox(height: AppConstants.itemWidth*0.08,),
        ],
      ),
    );
  }
}
