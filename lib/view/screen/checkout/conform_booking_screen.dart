import 'package:car_share/view/screen/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/app_bar.dart';
import '../../baseview/button/custom_button.dart';

class ConformBookingScreen extends StatefulWidget {
  const ConformBookingScreen();

  @override
  State<ConformBookingScreen> createState() => _ConformBookingScreenState();
}

class _ConformBookingScreenState extends State<ConformBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.WHITE,
      appBar: PreferredSize(child: TitleView('Conform Booking'), preferredSize: const Size.fromHeight(55)),
      body: Padding(
        padding:
        EdgeInsets.symmetric(horizontal: AppConstants.itemWidth * 0.04),
        child: Column(
          children: [
            SizedBox(height: AppConstants.itemHeight*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Images.ic_qrcode, width: AppConstants.itemWidth*0.5,height: AppConstants.itemWidth*0.5,),
              ],
            ),
            SizedBox(height: AppConstants.itemHeight*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child:  RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "1.",
                        style: montserratMedium.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK)),

                    TextSpan(
                      text: "Your parking booking was conformed.",
                      style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK)),
                  ]),
                ),),
              ],
            ),
            SizedBox(height: AppConstants.itemHeight*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child:  RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "2.",
                        style: montserratMedium.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK)),

                    TextSpan(
                        text: "Take Screen Shot and showing at the parking slot.",
                        style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK)),
                  ]),
                ),),
              ],
            ),
            SizedBox(height: AppConstants.itemHeight*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child:  RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      children: <TextSpan>[
                    TextSpan(
                        text: "3.",
                        style: montserratMedium.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK)),

                    TextSpan(
                        text: "If you are not coming at your booking time then you paying cancellation charge \$ 2.50.",
                        style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK)),
                  ]),
                ),),
              ],
            ),
            SizedBox(height: AppConstants.itemHeight*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child:  RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: "4.",
                            style: montserratMedium.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK)),

                        TextSpan(
                            text: "If you are not coming at your booking time then we handover your slot to other customer..",
                            style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK)),
                      ]),
                ),),
              ],
            ),
            SizedBox(height: AppConstants.itemHeight*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child:  RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: "5.",
                            style: montserratMedium.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK)),

                        TextSpan(
                            text: "When parking booked time is over but you are not coming to take your vehicle then you will be paying \$ 2.50 compulsory.",
                            style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK)),
                      ]),
                ),),
              ],
            ),
            SizedBox(height: AppConstants.itemHeight*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child:  RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: "6.",
                            style: montserratMedium.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK)),

                        TextSpan(
                            text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500.",
                            style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK)),
                      ]),
                ),),
              ],
            ),
            SizedBox(height: AppConstants.itemHeight*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child:  RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: "7.",
                            style: montserratMedium.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK)),

                        TextSpan(
                            text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                            style: montserratRegular.copyWith(fontSize: AppConstants.itemWidth*0.035,color: ColorResources.BLACK)),
                      ]),
                ),),
              ],
            ),

            // Button
            SizedBox(
              height: AppConstants.itemHeight * 0.05,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashboardScreen(),
                  )),
              child: const CustomButton("Go To Home"),
            ),
          ],
        ),
      ),
    );
  }
}
