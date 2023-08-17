import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../model/parking_model.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';

class FavoriteParkingScreen extends StatefulWidget {
  const FavoriteParkingScreen();

  @override
  State<FavoriteParkingScreen> createState() => _FavoriteParkingScreenState();
}

class _FavoriteParkingScreenState extends State<FavoriteParkingScreen> {
  List<ParkingModel> parking_list=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parking_list.add(ParkingModel("https://assets.telegraphindia.com/telegraph/2021/Apr/1618173468_parking-lot.jpg", "Arena Parking", "Arena Parking", "3.55", "1.30 pm to 4.30 pm", "4.5"));
    parking_list.add(ParkingModel("https://cdn.vox-cdn.com/thumbor/okY54qvEzKcEa2RpTNu84xArEFI=/0x0:5464x3640/1200x675/filters:focal(2295x1383:3169x2257)/cdn.vox-cdn.com/uploads/chorus_image/image/72262173/GettyImages_1354859135__1_.0.jpg", "Ena Parking", "15/08/2023", "4.25", "3.30 pm to 6.30 pm", "2.5"));
    parking_list.add(ParkingModel("https://www.parkpca.com/wp-content/uploads/2018/08/Cars-parked-in-parking-lot.jpg", "Ara Parking", "Ara Parking", "4.50", "9.30 pm to 10.30 pm", "5.0"));
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
        title: Text("Booking History",
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
                      children: [
                        Expanded(child: Text("${parking_list[index].title}",
                            style: montserratRegular.copyWith(color:ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth*0.04)),)
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
                        Text("${parking_list[index].rate}",
                            style: montserratLight.copyWith(color:ColorResources.BLACK,
                                fontSize: AppConstants.itemWidth*0.03)),
                        Icon(Icons.star,color: ColorResources.YELLOW.withOpacity(0.7),size: 18,),
                      ],
                    ),
                  ],
                ),),
                Column(
                  children: [
                    GestureDetector(
                      onTap:() {

                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5,top: 5,left: 5,bottom: 5),
                        child: Image.asset(Images.ic_favorite,width: 25,height: 25,),
                      ),
                    ),
                    Text("\$ ${parking_list[index].price}",
                        style: montserratRegular.copyWith(color:ColorResources.COLOR_PRIMERY,
                            fontSize: AppConstants.itemWidth*0.035)),
                    Text("Per Hour",
                        style: montserratRegular.copyWith(color:ColorResources.BLACK,
                            fontSize: AppConstants.itemWidth*0.03)),
                  ],
                ),
                SizedBox(width: AppConstants.itemWidth*0.02,),
              ],
            ),
          );
        },),
    );
  }
}
