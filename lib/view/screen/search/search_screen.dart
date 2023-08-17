import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../model/parking_model.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../baseview/app_bar.dart';
import '../details/parking_details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<ParkingModel> parkingList=[];
  List<ParkingModel> tempParkingList=[];
  TextEditingController nameController = TextEditingController();
  final FocusNode nameFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    parkingList.add(ParkingModel("https://assets.telegraphindia.com/telegraph/2021/Apr/1618173468_parking-lot.jpg", "Arena Parking", "Arena Parking", "3.55", "47", "4.5"));
    parkingList.add(ParkingModel("https://ocdn.eu/images/pulscms/YjQ7MDA_/bd417f0b823a129302c4ac65a66b69d7.jpeg", "Ena Parking", "Ena Parking", "4.25", "11", "2.5"));
    parkingList.add(ParkingModel("https://auroracontractors.com/img/projects/ubs-arena-parking-garage/UBS.E.Exterior-1024.jpg", "Belmont Park", "Belmont Park", "6.25", "23", "5.0"));
    parkingList.add(ParkingModel("https://www.parkpca.com/wp-content/uploads/2018/08/Cars-parked-in-parking-lot.jpg", "Ara Parking", "Ara Parking", "9.25", "20", "4.0"));
    parkingList.add(ParkingModel("https://cdn.vox-cdn.com/thumbor/okY54qvEzKcEa2RpTNu84xArEFI=/0x0:5464x3640/1200x675/filters:focal(2295x1383:3169x2257)/cdn.vox-cdn.com/uploads/chorus_image/image/72262173/GettyImages_1354859135__1_.0.jpg", "Rena Parking", "Rena Parking", "1.50", "40", "5.0"));
    parkingList.add(ParkingModel("https://media.cnn.com/api/v1/images/stellar/prod/230518162326-01-us-parking-spots-restricted.jpg?c=original", "Enae Parking", "Enae Parking", "1.50", "40", "5.0"));
    parkingList.add(ParkingModel("https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Tel_Aviv_parking_lot.jpg/800px-Tel_Aviv_parking_lot.jpg", "Jawan Parking", "Jawan Parking", "3.50", "22", "2.0"));
    parkingList.add(ParkingModel("https://upload.wikimedia.org/wikipedia/commons/b/ba/Car_park_-8.jpg", "Chaleya Parking", "Chaleya Parking", "4.50", "55", "2.0"));
    tempParkingList.addAll(parkingList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child: TitleView('Search Parking'), preferredSize: const Size.fromHeight(55)),
      backgroundColor: ColorResources.WHITE,
      body: Column(
        children: [
          SizedBox(
            height: AppConstants.itemHeight * 0.01,
          ),
          Container(
              margin: EdgeInsets.symmetric(
                  vertical: AppConstants.itemWidth * 0.01,
                  horizontal: AppConstants.itemWidth * 0.02),
              decoration: BoxDecoration(
                  color: ColorResources.WHITE,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: ColorResources.BLACK.withOpacity(0.4),
                        blurRadius: 1),
                  ]),
              child: Row(
                children: [
                  SizedBox(
                    width: AppConstants.itemWidth * 0.03,
                  ),
                  Expanded(
                      child: TextFormField(
                        controller: nameController,
                        maxLines: 1,
                        textAlign: TextAlign.left,
                        focusNode: nameFocus,
                        keyboardType: TextInputType.text,
                        initialValue: null,
                        textInputAction: TextInputAction.next,
                        style: montserratRegular.copyWith(
                            color: ColorResources.BLACK,
                            fontSize: AppConstants.itemWidth * 0.035),
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter
                        ],
                        onChanged: (value) {
                          setState(() {
                            List<ParkingModel> results = [];
                            if (value.isEmpty) {
                              results = tempParkingList;
                            } else {
                              results = parkingList.where((artist) => artist.title.toLowerCase().contains(value.toLowerCase())).toList();
                            }
                            parkingList = results;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Search here...',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: AppConstants.itemHeight * 0.02,
                              horizontal: 5),
                          isDense: true,
                          counterText: '',
                          focusedBorder:
                          const OutlineInputBorder(borderSide: BorderSide.none),
                          hintStyle: montserratRegular.copyWith(
                              color: Theme.of(context).hintColor,
                              fontSize: AppConstants.itemWidth * 0.035),
                          errorStyle: const TextStyle(height: 1.5),
                          border: InputBorder.none,
                        ),
                      )),
                  SizedBox(
                    width: AppConstants.itemWidth * 0.03,
                  ),
                ],
              )),
          SizedBox(
            height: AppConstants.itemHeight * 0.01,
          ),
          Expanded(child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.02),
            itemCount: parkingList.length,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ParkingDetailsScreen(parkingList[index]),)),
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
                  margin: EdgeInsets.symmetric(vertical: AppConstants.itemWidth*0.02),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          height: AppConstants.itemHeight*0.1,
                          imageUrl:parkingList[index].imageUrl,
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
                                child: Text("${parkingList[index].title}",
                                    style: montserratRegular.copyWith(color:ColorResources.BLACK,
                                        fontSize: AppConstants.itemWidth*0.04)),
                              ),
                              Column(
                                children: [
                                  Text("\$ ${parkingList[index].price}",
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
                                child: Text("${parkingList[index].description}",
                                    style: montserratLight.copyWith(color:ColorResources.BLACK,
                                        fontSize: AppConstants.itemWidth*0.03)),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text("${parkingList[index].available_parking} parking available",
                                    style: montserratLight.copyWith(color:ColorResources.BLACK.withOpacity(0.5),
                                        fontSize: AppConstants.itemWidth*0.04)),
                              ),
                              Text("${parkingList[index].rate}",
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
            },),)
        ],
      ),
    );
  }
}
