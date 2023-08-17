import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../model/parking_model.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen();

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  List<ParkingModel> parking_list=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parking_list.add(ParkingModel("https://assets.telegraphindia.com/telegraph/2021/Apr/1618173468_parking-lot.jpg", "Arena Parking", "15/08/2023", "3.55", "1.30 pm to 4.30 pm", "4.5"));
    parking_list.add(ParkingModel("https://ocdn.eu/images/pulscms/YjQ7MDA_/bd417f0b823a129302c4ac65a66b69d7.jpeg", "Ena Parking", "15/08/2023", "4.25", "3.30 pm to 6.30 pm", "2.5"));
    parking_list.add(ParkingModel("https://auroracontractors.com/img/projects/ubs-arena-parking-garage/UBS.E.Exterior-1024.jpg", "Belmont Park", "15/08/2023", "6.25", "6.30 pm to 8.30 pm", "5.0"));
    parking_list.add(ParkingModel("https://cdn.vox-cdn.com/thumbor/okY54qvEzKcEa2RpTNu84xArEFI=/0x0:5464x3640/1200x675/filters:focal(2295x1383:3169x2257)/cdn.vox-cdn.com/uploads/chorus_image/image/72262173/GettyImages_1354859135__1_.0.jpg", "Rena Parking", "15/08/2023", "1.50", "9.30 pm to 10.30 pm", "5.0"));
    parking_list.add(ParkingModel("https://www.parkpca.com/wp-content/uploads/2018/08/Cars-parked-in-parking-lot.jpg", "Ara Parking", "15/08/2023", "4.50", "9.30 pm to 10.30 pm", "5.0"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.WHITE,
        automaticallyImplyLeading: false,
        elevation: 1,
        centerTitle: true,
        actionsIconTheme: const IconThemeData(color: ColorResources.WHITE),
        title: Text("Favorite Parking",
            textAlign: TextAlign.center,
            maxLines: 1,
            style: montserratMedium.copyWith(
                color: ColorResources.BLACK,
                fontSize: AppConstants.itemWidth*0.04)),
      ),
      backgroundColor: ColorResources.WHITE,
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02),
        itemCount: parking_list.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
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
            margin: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.02),
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
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${parking_list[index].title}",
                                style: montserratRegular.copyWith(color:ColorResources.BLACK,
                                    fontSize: AppConstants.itemWidth*0.04)),
                            SizedBox(height: AppConstants.itemWidth*0.01,),
                            Text("Date : ${parking_list[index].description}",
                                style: montserratLight.copyWith(color:ColorResources.BLACK,
                                    fontSize: AppConstants.itemWidth*0.035))
                          ],
                        ),),
                        Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage(Images.bg_button),fit: BoxFit.fill),
                          ),
                          padding: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.02,horizontal: AppConstants.itemWidth*0.02),
                          child: Text("Re-Booking",
                              style: montserratLight.copyWith(color:ColorResources.WHITE,
                                  fontSize: AppConstants.itemWidth*0.03)),
                        )
                      ],
                    ),
                    SizedBox(height: AppConstants.itemWidth*0.01,),
                    Row(
                      children: [
                        Expanded(
                          child: Text("Time : ${parking_list[index].available_parking}",
                              style: montserratLight.copyWith(color:ColorResources.BLACK.withOpacity(0.4),
                                  fontSize: AppConstants.itemWidth*0.035)),
                        ),
                        Text("\$ ${parking_list[index].price}",
                            style: montserratLight.copyWith(color:ColorResources.COLOR_PRIMERY,
                                fontSize: AppConstants.itemWidth*0.035)),
                      ],
                    )
                  ],
                )),
                SizedBox(width: AppConstants.itemWidth*0.02,),
              ],
            ),
          );
        },),
    );
  }
}
