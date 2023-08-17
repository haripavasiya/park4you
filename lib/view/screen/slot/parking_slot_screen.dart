import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/app_bar.dart';
import '../../baseview/button/custom_button.dart';
import '../checkout/checkout_screen.dart';

class ParkingSlotScreen extends StatefulWidget {
  const ParkingSlotScreen();

  @override
  State<ParkingSlotScreen> createState() => _ParkingSlotScreenState();
}

class _ParkingSlotScreenState extends State<ParkingSlotScreen> {

  String selectCategory="0",selectSection="0";
  List<String> listCategory=[Images.ic_bicycle,Images.ic_motorbike,Images.ic_car,Images.ic_fast_delivery,Images.ic_bus,];

  late String formattedDate='',timeShcedule='';
  DateTime selectDate = DateTime.now();
  late var currentTime,selectTime;
  var format = DateFormat("HH:mm");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DateTime today = DateTime.now();
    formattedDate = DateFormat('MMM dd, EEEE').format(today);
    timeShcedule=DateFormat('hh:mm a').format(DateTime(today.year, today.month, today.day, today.hour+1, today.minute));
    selectDate = today;
    currentTime = DateFormat('HH:mm a').format(today);
    selectTime = DateFormat('HH:mm a').format(DateTime(today.year, today.month, today.day, today.hour+1, today.minute));
    print("$currentTime::::::$selectTime");
  }

  void getSelectDate() {
    showDatePicker(
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Theme.of(context)
                    .primaryColor, // header background color
                onPrimary: ColorResources.WHITE, // header text color
                onSurface: ColorResources.BLACK, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary:
                  Theme.of(context).primaryColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2040))
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        formattedDate = DateFormat('MMM dd, EEEE').format(pickedDate);
      });
    });
  }

  void getSelectFromTime() async {
    final TimeOfDay? newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, childWidget) {
          return MediaQuery(data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false), child: childWidget!);
        }).then((value) {
      if (value != null) {
        setState(() {
          print(value);
          DateTime now = DateTime.now();
          final dt = DateTime(now.year, now.month, now.day, value.hour, value.minute);
          print(dt);
          final formats = DateFormat('HH:mm a');
          timeShcedule = formats.format(dt);
          print(timeShcedule);
          currentTime=timeShcedule;
        });
      }else {
        setState(() {
          DateTime today = DateTime.now();
          timeShcedule=DateFormat('hh:mm a').format(DateTime(today.year, today.month, today.day, today.hour+1, today.minute));
        });
      }
    });
  }

  void getSelectToTime() async {
    final TimeOfDay? newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (context, childWidget) {
          return MediaQuery(data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false), child: childWidget!);
        }).then((value) {
      if (value != null) {
        setState(() {
          print(value);
          DateTime now = DateTime.now();
          final dt = DateTime(now.year, now.month, now.day, value.hour, value.minute);
          print(dt);
          final formats = DateFormat('HH:mm a');
          timeShcedule = formats.format(dt);
          print(timeShcedule);
          selectTime=timeShcedule;
        });
      }else {
        setState(() {
          DateTime today = DateTime.now();
          timeShcedule=DateFormat('hh:mm a').format(DateTime(today.year, today.month, today.day, today.hour+1, today.minute));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: TitleView('Parking Slot'), preferredSize: const Size.fromHeight(55)),
      backgroundColor: ColorResources.WHITE,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.04,vertical: AppConstants.itemWidth*0.04),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text("Select Your Category",
                        textAlign: TextAlign.start,
                        style: montserratRegular.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemWidth*0.045,
                        )),
                  ),
                ]),
            SizedBox(height: AppConstants.itemHeight*0.01,),

            // Category List
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectCategory="1";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorResources.BLACK.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: selectCategory=="1"?Border.all(color: ColorResources.COLOR_PRIMERY,width: 2):Border.all(color: ColorResources.GREY.withOpacity(0.5),width: 1)
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
                      margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: 4),
                      child: Image.asset(listCategory[0],width: 25,height: 25,color:selectCategory=="1"?ColorResources.BLACK:ColorResources.GREY,),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectCategory="2";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorResources.BLACK.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: selectCategory=="2"?Border.all(color: ColorResources.COLOR_PRIMERY,width: 2):Border.all(color: ColorResources.GREY.withOpacity(0.5),width: 1)
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
                      margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: 4),
                      child: Image.asset(listCategory[1],width: 25,height: 25,color:selectCategory=="2"?ColorResources.BLACK:ColorResources.GREY,),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectCategory="3";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorResources.BLACK.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: selectCategory=="3"?Border.all(color: ColorResources.COLOR_PRIMERY,width: 2):Border.all(color: ColorResources.GREY.withOpacity(0.5),width: 1)
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
                      margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: 4),
                      child: Image.asset(listCategory[2],width: 25,height: 25,color: selectCategory=="3"?ColorResources.BLACK:ColorResources.GREY,),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectCategory="4";
                      });
                    },child: Container(
                    decoration: BoxDecoration(
                        color: ColorResources.BLACK.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: selectCategory=="4"?Border.all(color: ColorResources.COLOR_PRIMERY,width: 2):Border.all(color: ColorResources.GREY.withOpacity(0.5),width: 1)
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
                    margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: 4),
                    child: Image.asset(listCategory[3],width: 25,height: 25,color:selectCategory=="4"?ColorResources.BLACK:ColorResources.GREY,),
                  ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectCategory="5";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorResources.BLACK.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: selectCategory=="5"?Border.all(color: ColorResources.COLOR_PRIMERY,width: 2):Border.all(color: ColorResources.GREY.withOpacity(0.5),width: 1)
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
                      margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: 4),
                      child: Image.asset(listCategory[4],width: 25,height: 25,color:selectCategory=="5"?ColorResources.BLACK:ColorResources.GREY,),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppConstants.itemHeight*0.01,),

            // Date
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text("Date",
                        textAlign: TextAlign.start,
                        style: montserratRegular.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemWidth*0.045,
                        )),
                  ),
                ]),
            SizedBox(height: AppConstants.itemHeight*0.005,),
            GestureDetector(
              onTap:() => getSelectDate(),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorResources.BLACK.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 15),
                width: AppConstants.itemWidth/2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.date_range_outlined,color: ColorResources.COLOR_PRIMERY,size: 20,),
                    Text(formattedDate,
                        textAlign: TextAlign.start,
                        style: montserratLight.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemWidth*0.04,
                        ))
                  ],
                ),
              ),
            ),
            SizedBox(height: AppConstants.itemHeight*0.01,),

            // Time
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text("Time",
                        textAlign: TextAlign.start,
                        style: montserratRegular.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemWidth*0.045,
                        )),
                  ),
                ]),
            SizedBox(height: AppConstants.itemHeight*0.005,),
            Row(
              children: [
                Expanded(child: GestureDetector(
                  onTap: () => getSelectFromTime(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorResources.BLACK.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("From",
                            textAlign: TextAlign.start,
                            style: montserratLight.copyWith(
                              color: ColorResources.BLACK,
                              fontSize: AppConstants.itemWidth*0.04,
                            )),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorResources.WHITE,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: 8),
                          child: Text(currentTime,
                              textAlign: TextAlign.start,
                              style: montserratLight.copyWith(
                                color: ColorResources.COLOR_PRIMERY,
                                fontSize: AppConstants.itemWidth*0.04,
                              )),
                        )
                      ],
                    ),
                  ),
                ),),
                SizedBox(width: AppConstants.itemHeight*0.03,),
                Expanded(child: GestureDetector(
                  onTap: () => getSelectToTime(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorResources.BLACK.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 5,vertical: 7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("To",
                            textAlign: TextAlign.start,
                            style: montserratLight.copyWith(
                              color: ColorResources.BLACK,
                              fontSize: AppConstants.itemWidth*0.04,
                            )),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorResources.WHITE,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: 8),
                          child: Text(selectTime,
                              textAlign: TextAlign.start,
                              style: montserratLight.copyWith(
                                color: ColorResources.COLOR_PRIMERY,
                                fontSize: AppConstants.itemWidth*0.04,
                              )),
                        )
                      ],
                    ),
                  ),
                ),),
              ],
            ),
            SizedBox(height: AppConstants.itemHeight*0.01,),

            // Select Section
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text("Select Section",
                        textAlign: TextAlign.start,
                        style: montserratRegular.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemWidth*0.045,
                        )),
                  ),
                ]),
            SizedBox(height: AppConstants.itemHeight*0.005,),

            // Section List
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectSection="1";
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: ColorResources.BLACK.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: selectSection=="1"?Border.all(color: ColorResources.COLOR_PRIMERY,width: 2):Border.all(color: ColorResources.GREY.withOpacity(0.5),width: 1)
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.04),
                          margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: 4),
                          child: Text("A",
                              textAlign: TextAlign.center,
                              style: montserratRegular.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth*0.045,
                              )),
                        ),
                        Text("12 Slot\nAvailable",
                            textAlign: TextAlign.center,
                            style: montserratLight.copyWith(
                              color: selectSection=="1"?ColorResources.BLACK:ColorResources.BLACK.withOpacity(0.5),
                              fontSize: AppConstants.itemWidth*0.035,
                            ))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectSection="2";
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: ColorResources.BLACK.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: selectSection=="2"?Border.all(color: ColorResources.COLOR_PRIMERY,width: 2):Border.all(color: ColorResources.GREY.withOpacity(0.5),width: 1)
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.04),
                          margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: 4),
                          child: Text("B",
                              textAlign: TextAlign.center,
                              style: montserratRegular.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth*0.045,
                              )),
                        ),
                        Text("14 Slot\nAvailable",
                            textAlign: TextAlign.center,
                            style: montserratLight.copyWith(
                              color: selectSection=="2"?ColorResources.BLACK:ColorResources.BLACK.withOpacity(0.5),
                              fontSize: AppConstants.itemWidth*0.035,
                            ))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectSection="3";
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: ColorResources.BLACK.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: selectSection=="3"?Border.all(color: ColorResources.COLOR_PRIMERY,width: 2):Border.all(color: ColorResources.GREY.withOpacity(0.5),width: 1)
                          ),
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.04),
                          margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: 4),
                          child: Text("C",
                              textAlign: TextAlign.center,
                              style: montserratRegular.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth*0.045,
                              )),
                        ),
                        Text("19 Slot\nAvailable",
                            textAlign: TextAlign.center,
                            style: montserratLight.copyWith(
                              color: selectSection=="3"?ColorResources.BLACK:ColorResources.BLACK.withOpacity(0.5),
                              fontSize: AppConstants.itemWidth*0.035,
                            ))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectSection="4";
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: ColorResources.BLACK.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: selectSection=="4"?Border.all(color: ColorResources.COLOR_PRIMERY,width: 2):Border.all(color: ColorResources.GREY.withOpacity(0.5),width: 1)
                          ),
                          padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.04),
                          margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: 4),
                          alignment: Alignment.center,
                          child: Text("D",
                              textAlign: TextAlign.center,
                              style: montserratRegular.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth*0.045,
                              )),
                        ),
                        Text("33 Slot\nAvailable",
                            textAlign: TextAlign.center,
                            style: montserratLight.copyWith(
                              color: selectSection=="4"?ColorResources.BLACK:ColorResources.BLACK.withOpacity(0.5),
                              fontSize: AppConstants.itemWidth*0.035,
                            ))
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectSection="5";
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: ColorResources.BLACK.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: selectSection=="5"?Border.all(color: ColorResources.COLOR_PRIMERY,width: 2):Border.all(color: ColorResources.GREY.withOpacity(0.5),width: 1)
                          ),
                          padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.04),
                          margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: 4),
                          alignment: Alignment.center,
                          child: Text("E",
                              textAlign: TextAlign.center,
                              style: montserratRegular.copyWith(
                                color: ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth*0.045,
                              )),
                        ),
                        Text("03 Slot\nAvailable",
                            textAlign: TextAlign.center,
                            style: montserratLight.copyWith(
                              color: selectSection=="5"?ColorResources.BLACK:ColorResources.BLACK.withOpacity(0.5),
                              fontSize: AppConstants.itemWidth*0.035,
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppConstants.itemHeight*0.01,),

            // Button
            SizedBox(height: AppConstants.itemHeight*0.01,),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckoutScreen(),
                  )),
              child: const CustomButton("Select Parking Slot"),
            ),
          ],
        ),
      ),
    );
  }
}
