import 'package:car_share/utill/images.dart';
import 'package:flutter/material.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/styles.dart';
import '../../baseview/app_bar.dart';
import '../../baseview/button/custom_button.dart';
import 'conform_booking_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen();

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.WHITE,
      appBar: PreferredSize(
          child: TitleView('Your Booking'),
          preferredSize: const Size.fromHeight(55)),
      body: SingleChildScrollView(
        padding:
            EdgeInsets.symmetric(horizontal: AppConstants.itemWidth * 0.04),
        child: Column(
          children: [
            // Date
            SizedBox(
              height: AppConstants.itemHeight * 0.02,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text("Date :  ",
                  textAlign: TextAlign.start,
                  style: montserratRegular.copyWith(
                    color: ColorResources.COLOR_PRIMERY,
                    fontSize: AppConstants.itemWidth * 0.045,
                  )),
              Text("31 july , Monday",
                  textAlign: TextAlign.start,
                  style: montserratRegular.copyWith(
                    color: ColorResources.BLACK,
                    fontSize: AppConstants.itemWidth * 0.045,
                  )),
            ]),

            // Time
            SizedBox(
              height: AppConstants.itemHeight * 0.02,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text("Time :  ",
                  textAlign: TextAlign.start,
                  style: montserratRegular.copyWith(
                    color: ColorResources.COLOR_PRIMERY,
                    fontSize: AppConstants.itemWidth * 0.045,
                  )),
              Text("1.30 pm to 2.30 pm",
                  textAlign: TextAlign.start,
                  style: montserratRegular.copyWith(
                    color: ColorResources.BLACK,
                    fontSize: AppConstants.itemWidth * 0.045,
                  )),
            ]),

            //Section
            SizedBox(
              height: AppConstants.itemHeight * 0.02,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text("Section :  ",
                  textAlign: TextAlign.start,
                  style: montserratRegular.copyWith(
                    color: ColorResources.COLOR_PRIMERY,
                    fontSize: AppConstants.itemWidth * 0.045,
                  )),
              Text("B Slot",
                  textAlign: TextAlign.start,
                  style: montserratRegular.copyWith(
                    color: ColorResources.BLACK,
                    fontSize: AppConstants.itemWidth * 0.045,
                  )),
            ]),

            // Slot
            SizedBox(
              height: AppConstants.itemHeight * 0.02,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text("Slot :  ",
                  textAlign: TextAlign.start,
                  style: montserratRegular.copyWith(
                    color: ColorResources.COLOR_PRIMERY,
                    fontSize: AppConstants.itemWidth * 0.045,
                  )),
              Text("B 05",
                  textAlign: TextAlign.start,
                  style: montserratRegular.copyWith(
                    color: ColorResources.BLACK,
                    fontSize: AppConstants.itemWidth * 0.045,
                  )),
            ]),

            // Total amount
            SizedBox(
              height: AppConstants.itemHeight * 0.02,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text("Total amount :  ",
                  textAlign: TextAlign.start,
                  style: montserratRegular.copyWith(
                    color: ColorResources.COLOR_PRIMERY,
                    fontSize: AppConstants.itemWidth * 0.045,
                  )),
              Text("\$ 3.55",
                  textAlign: TextAlign.start,
                  style: montserratRegular.copyWith(
                    color: ColorResources.BLACK,
                    fontSize: AppConstants.itemWidth * 0.045,
                  )),
            ]),

            SizedBox(
              height: AppConstants.itemHeight * 0.03,
            ),

            // Payment Method
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Expanded(
                child: Text("Choose Payment Method :",
                    textAlign: TextAlign.start,
                    style: montserratMedium.copyWith(
                      color: ColorResources.BLACK,
                      fontSize: AppConstants.itemWidth * 0.045,
                    )),
              ),
            ]),
            SizedBox(
              height: AppConstants.itemHeight * 0.02,
            ),

            // Upi
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                width: AppConstants.itemHeight * 0.01,
              ),
              Expanded(
                child: Text("UPI ID",
                    textAlign: TextAlign.start,
                    style: montserratRegular.copyWith(
                      color: ColorResources.BLACK,
                      fontSize: AppConstants.itemWidth * 0.045,
                    )),
              ),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                color: ColorResources.BLACK,
                size: 20,
              ),
              SizedBox(
                width: AppConstants.itemHeight * 0.01,
              ),
            ]),
            const Divider(
              thickness: 1,
            ),

            //Card
            SizedBox(
              height: AppConstants.itemHeight * 0.02,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                width: AppConstants.itemHeight * 0.01,
              ),
              Expanded(
                child: Text("Credit / Debit Card",
                    textAlign: TextAlign.start,
                    style: montserratRegular.copyWith(
                      color: ColorResources.BLACK,
                      fontSize: AppConstants.itemWidth * 0.045,
                    )),
              ),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                color: ColorResources.BLACK,
                size: 20,
              ),
              SizedBox(
                width: AppConstants.itemHeight * 0.01,
              ),
            ]),
            const Divider(
              thickness: 1,
            ),

            //Cash Pay
            SizedBox(
              height: AppConstants.itemHeight * 0.02,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              SizedBox(
                width: AppConstants.itemHeight * 0.01,
              ),
              Expanded(
                child: Text("Cash Pay",
                    textAlign: TextAlign.start,
                    style: montserratRegular.copyWith(
                      color: ColorResources.BLACK,
                      fontSize: AppConstants.itemWidth * 0.045,
                    )),
              ),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                color: ColorResources.BLACK,
                size: 20,
              ),
              SizedBox(
                width: AppConstants.itemHeight * 0.01,
              ),
            ]),
            const Divider(
              thickness: 1,
            ),

            // Button
            SizedBox(
              height: AppConstants.itemHeight * 0.25,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConformBookingScreen(),
                  )),
              child: const CustomButton("Conform Booking"),
            ),
          ],
        ),
      ),
    );
  }
}
