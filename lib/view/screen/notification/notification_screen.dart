import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/app_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool is_loading=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: TitleView('Notification'), preferredSize: const Size.fromHeight(55)),
      backgroundColor: ColorResources.WHITE,
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        physics: const ClampingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: ColorResources.WHITE,
                boxShadow: [BoxShadow(
                  color: ColorResources.BLACK.withOpacity(0.2),
                  blurRadius: 1,
                ),]
            ),
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemHeight*0.01,vertical: AppConstants.itemHeight*0.01),
            width: AppConstants.itemWidth,
            margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5,top: 5,left: 5,bottom: 5),
                  child: Image.asset(Images.icNotification,width: 25,height: 25,color: ColorResources.COLOR_PRIMERY,),
                ),
                Expanded(child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text('${dayGetFromDate("2023-05-12 12:21:10")}',
                            style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.04,color: ColorResources.BLACK),),
                        ),
                        Text('13 min ago',
                          style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.04,color: ColorResources.BLACK),),
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text("Lorem Ipsum is simply dummy",
                            style: montserratMedium.copyWith(fontSize: AppConstants.itemWidth*0.04,color: Color(0xff6D6D6D)),),
                        ),
                      ],
                    ),
                  ],
                ),),
              ],
            ),
          );
        },),
    );
  }

  dayGetFromDate(String date){
    DateTime parseDate =
    DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('dd MMM yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }
}