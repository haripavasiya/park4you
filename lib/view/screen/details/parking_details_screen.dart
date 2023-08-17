import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_share/model/parking_model.dart';
import 'package:car_share/view/screen/slot/parking_slot_screen.dart';
import 'package:flutter/material.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/app_bar.dart';
import '../../baseview/button/custom_button.dart';

class ParkingDetailsScreen extends StatefulWidget {
  ParkingModel parking_list;
  ParkingDetailsScreen(this.parking_list);

  @override
  State<ParkingDetailsScreen> createState() => _ParkingDetailsScreebState();
}

class _ParkingDetailsScreebState extends State<ParkingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorResources.WHITE,
        automaticallyImplyLeading: false,
        elevation: 1,
        centerTitle: true,
        actionsIconTheme: const IconThemeData(color: ColorResources.WHITE),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: ColorResources.COLOR_PRIMERY,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.keyboard_arrow_left_outlined,color: ColorResources.WHITE,size: 24,)),
        ),
        title: Text(widget.parking_list.title,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: montserratMedium.copyWith(
                color: ColorResources.BLACK,
                fontSize: AppConstants.itemWidth*0.04)),
      ),
      backgroundColor: ColorResources.WHITE,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.04),
        child: Column(
          children: [
            SizedBox(height: AppConstants.itemHeight*0.01,),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                height: AppConstants.itemHeight*0.25,
                imageUrl:widget.parking_list.imageUrl,
                errorWidget: (context, url, error) => Image.asset(Images.placeholderImages,height: AppConstants.itemHeight*0.25,width: AppConstants.itemWidth,),
                progressIndicatorBuilder: (context, url, downloadProgress) => const Center(child: CircularProgressIndicator(color: ColorResources.COLOR_PRIMERY,),),
                fit: BoxFit.cover,
                width: AppConstants.itemWidth,
              ),
            ),
            SizedBox(height: AppConstants.itemWidth*0.02,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text("${widget.parking_list.title}",
                      style: montserratRegular.copyWith(color:ColorResources.BLACK,
                          fontSize: AppConstants.itemWidth*0.05)),
                ),
                Row(
                  children: [
                    Text("\$ ${widget.parking_list.price}",
                        style: montserratRegular.copyWith(color:ColorResources.COLOR_PRIMERY,
                            fontSize: AppConstants.itemWidth*0.045)),
                    Text("(Per Hour)",
                        style: montserratRegular.copyWith(color:ColorResources.BLACK,
                            fontSize: AppConstants.itemWidth*0.03)),
                  ],
                )
              ],
            ),
            SizedBox(height: AppConstants.itemWidth*0.01,),
            Row(
              children: [
                Icon(Icons.location_on_rounded,color: ColorResources.BLACK.withOpacity(0.7),size: 24,),
                SizedBox(width: AppConstants.itemWidth*0.01,),
                Expanded(
                  child: Text("ena Parking , North Mumbai - 123456",
                      style: montserratRegular.copyWith(color:ColorResources.BLACK,
                          fontSize: AppConstants.itemWidth*0.04)),
                ),
              ],
            ),
            SizedBox(height: AppConstants.itemWidth*0.01,),
            Row(
              children: [
                Expanded(
                  child: Text("${widget.parking_list.available_parking} Parking Available",
                      style: montserratRegular.copyWith(color:ColorResources.COLOR_PRIMERY,
                          fontSize: AppConstants.itemWidth*0.045)),
                ),
                Text("${widget.parking_list.rate}",
                    style: montserratRegular.copyWith(color:ColorResources.BLACK,
                        fontSize: AppConstants.itemWidth*0.045)),
                Icon(Icons.star,color: ColorResources.YELLOW.withOpacity(0.7),size: 24,),
              ],
            ),
            SizedBox(height: AppConstants.itemWidth*0.01,),
            Row(
              children: [
                Expanded(
                  child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries.",
                      textAlign: TextAlign.justify,
                      style: montserratLight.copyWith(color:ColorResources.BLACK.withOpacity(0.5),
                          fontSize: AppConstants.itemWidth*0.04)),
                ),
              ],
            ),
            SizedBox(height: AppConstants.itemHeight*0.01,),
            Image.asset(Images.details_map, width: AppConstants.itemWidth),
            Text("View on Map",
                style: montserratRegular.copyWith(color:ColorResources.BLACK,
                    decoration: TextDecoration.underline,
                    fontSize: AppConstants.itemWidth*0.04)),
            SizedBox(height: AppConstants.itemHeight*0.01,),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ParkingSlotScreen(),
                  )),
              child: const CustomButton("Select Parking Slot"),
            ),
          ],
        ),
      ),
    );
  }
}
