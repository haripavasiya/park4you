import 'package:car_share/view/screen/details/parking_details_screen.dart';
import 'package:car_share/view/screen/menu/menu_screen.dart';
import 'package:car_share/view/screen/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../model/parking_model.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../notification/notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String select_category="0";
  List<String> list_category=[Images.ic_bicycle,Images.ic_motorbike,Images.ic_car,Images.ic_fast_delivery,Images.ic_bus,];
  List<ParkingModel> parking_list=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parking_list.add(ParkingModel("https://assets.telegraphindia.com/telegraph/2021/Apr/1618173468_parking-lot.jpg", "Arena Parking", "Arena Parking", "3.55", "47", "4.5"));
    parking_list.add(ParkingModel("https://ocdn.eu/images/pulscms/YjQ7MDA_/bd417f0b823a129302c4ac65a66b69d7.jpeg", "Ena Parking", "Ena Parking", "4.25", "11", "2.5"));
    parking_list.add(ParkingModel("https://auroracontractors.com/img/projects/ubs-arena-parking-garage/UBS.E.Exterior-1024.jpg", "Belmont Park", "Belmont Park", "6.25", "23", "5.0"));
    parking_list.add(ParkingModel("https://www.parkpca.com/wp-content/uploads/2018/08/Cars-parked-in-parking-lot.jpg", "Ara Parking", "Ara Parking", "9.25", "20", "4.0"));
    parking_list.add(ParkingModel("https://cdn.vox-cdn.com/thumbor/okY54qvEzKcEa2RpTNu84xArEFI=/0x0:5464x3640/1200x675/filters:focal(2295x1383:3169x2257)/cdn.vox-cdn.com/uploads/chorus_image/image/72262173/GettyImages_1354859135__1_.0.jpg", "Rena Parking", "Rena Parking", "1.50", "40", "5.0"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MenuScreen(),)),
          child: Padding(
            padding: const EdgeInsets.only(right: 10,top: 10,left: 10,bottom: 10),
            child: Image.asset(Images.icMenu,width: 22,height: 22,),
          ),
        ),
        backgroundColor: ColorResources.WHITE,
        elevation: 1,
        centerTitle: true,
        title: Image.asset(Images.logoHorizontal, width: AppConstants.itemWidth*0.3),
        actions: [
          GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationScreen(),)),
            child: Padding(
              padding: const EdgeInsets.only(right: 5,top: 5,left: 5,bottom: 5),
              child: Image.asset(Images.icNotification,width: 25,height: 25,),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.04),
        child:Column(
          children: [
            // Need a parking
            SizedBox(height: AppConstants.itemHeight*0.01,),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text("Do you need a parking ?",
                        textAlign: TextAlign.start,
                        style: montserratRegular.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemWidth*0.045,
                        )),
                  ),
                ]),
            SizedBox(height: AppConstants.itemHeight*0.01,),
            Image.asset(Images.ic_parking, width: AppConstants.itemWidth),
            SizedBox(height: AppConstants.itemHeight*0.01,),

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
                        select_category="1";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorResources.BLACK.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: select_category=="1"?Border.all(color: ColorResources.COLOR_PRIMERY,width: 2):Border.all(color: ColorResources.GREY.withOpacity(0.5),width: 1)
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
                      margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: 4),
                      child: Image.asset(list_category[0],width: 25,height: 25,color:select_category=="1"?ColorResources.BLACK:ColorResources.GREY,),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        select_category="2";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorResources.BLACK.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: select_category=="2"?Border.all(color: ColorResources.COLOR_PRIMERY,width: 2):Border.all(color: ColorResources.GREY.withOpacity(0.5),width: 1)
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
                      margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: 4),
                      child: Image.asset(list_category[1],width: 25,height: 25,color:select_category=="2"?ColorResources.BLACK:ColorResources.GREY,),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        select_category="3";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorResources.BLACK.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: select_category=="3"?Border.all(color: ColorResources.COLOR_PRIMERY,width: 2):Border.all(color: ColorResources.GREY.withOpacity(0.5),width: 1)
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
                      margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: 4),
                      child: Image.asset(list_category[2],width: 25,height: 25,color: select_category=="3"?ColorResources.BLACK:ColorResources.GREY,),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        select_category="4";
                      });
                    },child: Container(
                    decoration: BoxDecoration(
                        color: ColorResources.BLACK.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: select_category=="4"?Border.all(color: ColorResources.COLOR_PRIMERY,width: 2):Border.all(color: ColorResources.GREY.withOpacity(0.5),width: 1)
                    ),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
                    margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: 4),
                    child: Image.asset(list_category[3],width: 25,height: 25,color:select_category=="4"?ColorResources.BLACK:ColorResources.GREY,),
                  ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        select_category="5";
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorResources.BLACK.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                          border: select_category=="5"?Border.all(color: ColorResources.COLOR_PRIMERY,width: 2):Border.all(color: ColorResources.GREY.withOpacity(0.5),width: 1)
                      ),
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
                      margin: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03,vertical: 4),
                      child: Image.asset(list_category[4],width: 25,height: 25,color:select_category=="5"?ColorResources.BLACK:ColorResources.GREY,),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: AppConstants.itemHeight*0.01,),

            // Find Nearest Parking
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text("Find Nearest Parking",
                        textAlign: TextAlign.start,
                        style: montserratRegular.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: AppConstants.itemWidth*0.045,
                        )),
                  ),
                ]),
            SizedBox(height: AppConstants.itemHeight*0.01,),
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen(),)),
              child: Container(
                decoration: BoxDecoration(
                    color: ColorResources.WHITE,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: ColorResources.BLACK.withOpacity(0.4),width: 1),
                    boxShadow: [
                      BoxShadow(
                          color: ColorResources.BLACK.withOpacity(0.2),
                          blurRadius: 1
                      )
                    ]
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02),
                child: Row(
                  children: [
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Image.asset(Images.ic_search,width: 22,height: 22,),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                    Expanded(
                      child: Text("Find parking",
                          textAlign: TextAlign.start,
                          style: montserratRegular.copyWith(
                            color: ColorResources.BLACK.withOpacity(0.5),
                            fontSize: AppConstants.itemWidth*0.045,
                          )),
                    ),
                    SizedBox(width: AppConstants.itemWidth*0.03,),
                  ],
                ),
              ),
            ),

            // Show my nearest parking
            SizedBox(height: AppConstants.itemHeight*0.01,),
            Container(
              decoration: BoxDecoration(
                  color: ColorResources.WHITE,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: ColorResources.COLOR_PRIMERY.withOpacity(0.1),width: 1),
                boxShadow: [
                  const BoxShadow(
                    color: ColorResources.COLOR_PRIMERY,
                    blurRadius: 2
                  )
                ]
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02),
              child: Text("Show my nearest parking",
                  textAlign: TextAlign.center,
                  style: montserratRegular.copyWith(
                    color: ColorResources.COLOR_PRIMERY,
                    fontSize: AppConstants.itemWidth*0.045,
                  )),
            ),

            // Parking List
            ListView.builder(
              itemCount: parking_list.length,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ParkingDetailsScreen(parking_list[index]),)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorResources.WHITE,
                      borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: ColorResources.BLACK.withOpacity(0.5),
                              blurRadius: 1
                          )
                        ]
                    ),
                    margin: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.03),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
                            height: AppConstants.itemHeight*0.1,
                            imageUrl:parking_list[index].imageUrl,
                            errorWidget: (context, url, error) => Image.asset(Images.placeholderImages,height: AppConstants.itemHeight*0.1,width: AppConstants.itemHeight*0.15,),
                            progressIndicatorBuilder: (context, url, downloadProgress) => const Center(child: CircularProgressIndicator(color: ColorResources.COLOR_PRIMERY,),),
                            fit: BoxFit.cover,
                            width: AppConstants.itemHeight*0.15,
                          ),
                        ),
                        SizedBox(width: AppConstants.itemWidth*0.02,),
                        Expanded(child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text("${parking_list[index].title}",
                                      style: montserratRegular.copyWith(color:ColorResources.BLACK,
                                          fontSize: AppConstants.itemWidth*0.04)),
                                ),
                                Column(
                                  children: [
                                    Text("\$ ${parking_list[index].price}",
                                        style: montserratRegular.copyWith(color:ColorResources.COLOR_PRIMERY,
                                            fontSize: AppConstants.itemWidth*0.035)),
                                    Text("Per Hour",
                                        style: montserratRegular.copyWith(color:ColorResources.BLACK,
                                            fontSize: AppConstants.itemWidth*0.03)),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on_rounded,color: ColorResources.BLACK.withOpacity(0.7),size: 18,),
                                SizedBox(width: AppConstants.itemWidth*0.01,),
                                Expanded(
                                  child: Text("${parking_list[index].description}",
                                      style: montserratLight.copyWith(color:ColorResources.BLACK,
                                          fontSize: AppConstants.itemWidth*0.03)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Text("${parking_list[index].available_parking} parking available",
                                      style: montserratLight.copyWith(color:ColorResources.BLACK.withOpacity(0.5),
                                          fontSize: AppConstants.itemWidth*0.04)),
                                ),
                                Text("${parking_list[index].rate}",
                                    style: montserratLight.copyWith(color:ColorResources.BLACK,
                                        fontSize: AppConstants.itemWidth*0.03)),
                                Icon(Icons.star,color: ColorResources.YELLOW.withOpacity(0.7),size: 18,),
                              ],
                            )
                          ],
                        )),
                        SizedBox(width: AppConstants.itemWidth*0.02,),
                      ],
                    ),
                  ),
                );
              },)
          ],
        ),
      ),
    );
  }
}
