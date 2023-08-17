import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../favorite/favorite_parking_screen.dart';
import '../history/booking_history_screen.dart';
import '../home/home_screen.dart';
import '../privacy_policy/privacy_policy_screen.dart';
import '../profile/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen();

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int pageIndex=0;
  List<Widget> screen_list=[];

  @override
  void initState() {
    super.initState();
    pageIndex=0;
    screen_list=[
      const HomeScreen(),
      const BookingHistoryScreen(),
      const FavoriteParkingScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.WHITE,
      body: screen_list[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ColorResources.COLOR_PRIMERY.withOpacity(0.20),
        selectedItemColor: ColorResources.COLOR_PRIMERY,
        unselectedItemColor: ColorResources.COLOR_PRIMERY,
        showUnselectedLabels: false,
        currentIndex: pageIndex,
        elevation: 0,
        selectedLabelStyle: montserratMedium.copyWith(color:ColorResources.BLACK,),
        unselectedLabelStyle: montserratRegular.copyWith(color:ColorResources.BLACK.withOpacity(0.5),),
        type: BottomNavigationBarType.fixed,
        items: [
          barItem(Images.ic_home, 0),
          barItem(Images.ic_chart, 1),
          barItem(Images.ic_heart, 2),
          barItem(Images.ic_user, 3),
        ],
        onTap: (value) {
          setState(() {
            pageIndex=value;
          });
        },
      ),
    );
  }

  BottomNavigationBarItem barItem(String icon, int index) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset(
          icon, color: index == pageIndex ? ColorResources.COLOR_PRIMERY : ColorResources.BLACK.withOpacity(0.5),
          height: 25, width: 25,
        ),
      ),
      label: "."
    );
  }
}