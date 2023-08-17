import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utill/app_constants.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  TextEditingController usernameController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController phonenoController =TextEditingController();
  final FocusNode usernameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode phonenoFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.COLOR_PRIMERY,
      appBar: AppBar(
        backgroundColor: ColorResources.COLOR_PRIMERY,
        automaticallyImplyLeading: false,
        elevation: 1,
        centerTitle: true,
        actionsIconTheme: const IconThemeData(color: ColorResources.WHITE),
        title: Text("Profile",
            textAlign: TextAlign.center,
            maxLines: 1,
            style: montserratMedium.copyWith(
                color: ColorResources.WHITE,
                fontSize: AppConstants.itemWidth*0.04)),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: AppConstants.itemHeight*0.075),
            child: Column(
              children: [
                Expanded(child: Container(
                  width: AppConstants.itemWidth,
                  decoration: BoxDecoration(
                      color: ColorResources.WHITE,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(AppConstants.itemWidth*0.1),topRight: Radius.circular(AppConstants.itemWidth*0.1))
                  ),
                  padding: EdgeInsets.symmetric(horizontal: AppConstants.itemWidth*0.03),
                  child: Column(
                    children: [
                      SizedBox(height: AppConstants.itemHeight*0.08,),
                      Text("User Name",
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: montserratRegular.copyWith(
                              color: ColorResources.BLACK,
                              fontSize: AppConstants.itemWidth*0.045)),

                      //Full Name
                      SizedBox(height: AppConstants.itemWidth*0.1,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Full Name",
                              textAlign: TextAlign.start,
                              style: montserratMedium.copyWith(
                                  color: ColorResources.BLACK,
                                  fontSize: AppConstants.itemHeight*0.017)),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005,),
                          decoration: BoxDecoration(
                              color: ColorResources.WHITE,
                              borderRadius:BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(color: ColorResources.BLACK.withOpacity(0.2),blurRadius: 1),
                              ]
                          ),
                          child:Row(
                            children: [
                              SizedBox(width: AppConstants.itemWidth*0.03,),
                              Expanded(child: TextFormField(
                                controller: usernameController,
                                maxLines: 1,
                                textAlign: TextAlign.left,
                                focusNode: usernameFocus,
                                keyboardType: TextInputType.text,
                                initialValue: null,
                                textInputAction: TextInputAction.next,
                                style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                                inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                                decoration: InputDecoration(
                                  hintText: 'User Name',
                                  contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                                  isDense: true,
                                  counterText: '',
                                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                                  hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                                  errorStyle: const TextStyle(height: 1.5),
                                  border: InputBorder.none,
                                ),
                              )),
                              SizedBox(width: AppConstants.itemWidth*0.03,),
                            ],
                          )
                      ),
                      SizedBox(height: AppConstants.itemHeight*0.005,),

                      //Email
                      SizedBox(height: AppConstants.itemWidth*0.02,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email",
                              textAlign: TextAlign.start,
                              style: montserratMedium.copyWith(
                                  color: ColorResources.BLACK,
                                  fontSize: AppConstants.itemHeight*0.017)),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005,),
                          decoration: BoxDecoration(
                              color: ColorResources.WHITE,
                              borderRadius:BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(color: ColorResources.BLACK.withOpacity(0.2),blurRadius: 1),
                              ]
                          ),
                          child:Row(
                            children: [
                              SizedBox(width: AppConstants.itemWidth*0.03,),
                              Expanded(child: TextFormField(
                                controller: emailController,
                                maxLines: 1,
                                textAlign: TextAlign.left,
                                focusNode: emailFocus,
                                keyboardType: TextInputType.text,
                                initialValue: null,
                                textInputAction: TextInputAction.next,
                                style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                                inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
                                decoration: InputDecoration(
                                  hintText: 'Username@gmail.com',
                                  contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                                  isDense: true,
                                  counterText: '',
                                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                                  hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                                  errorStyle: const TextStyle(height: 1.5),
                                  border: InputBorder.none,
                                ),
                              )),
                              SizedBox(width: AppConstants.itemWidth*0.03,),
                            ],
                          )
                      ),
                      SizedBox(height: AppConstants.itemHeight*0.005,),

                      //Phone Number
                      SizedBox(height: AppConstants.itemWidth*0.02,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Phone Number",
                              textAlign: TextAlign.start,
                              style: montserratMedium.copyWith(
                                  color: ColorResources.BLACK,
                                  fontSize: AppConstants.itemHeight*0.017)),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.005,),
                          decoration: BoxDecoration(
                              color: ColorResources.WHITE,
                              borderRadius:BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(color: ColorResources.BLACK.withOpacity(0.2),blurRadius: 1),
                              ]
                          ),
                          child:Row(
                            children: [
                              SizedBox(width: AppConstants.itemWidth*0.03,),
                              Expanded(child: TextFormField(
                                controller: phonenoController,
                                maxLines: 1,
                                maxLength: 10,
                                textAlign: TextAlign.left,
                                focusNode: phonenoFocus,
                                keyboardType: TextInputType.number,
                                initialValue: null,
                                textInputAction: TextInputAction.done,
                                style: montserratRegular.copyWith(color: ColorResources.BLACK,fontSize: AppConstants.itemWidth*0.035),
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                onChanged: (value) {
                                  if(value.length==10){
                                    AppConstants.closeKeyboard();
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: '1234567890',
                                  contentPadding: EdgeInsets.symmetric(vertical: AppConstants.itemHeight*0.02, horizontal: 5),
                                  isDense: true,
                                  counterText: '',
                                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
                                  hintStyle: montserratRegular.copyWith(color: Theme.of(context).hintColor,fontSize: AppConstants.itemWidth*0.035),
                                  errorStyle: const TextStyle(height: 1.5),
                                  border: InputBorder.none,
                                ),
                              )),
                              SizedBox(width: AppConstants.itemWidth*0.03,),
                            ],
                          )
                      ),
                      SizedBox(height: AppConstants.itemHeight*0.005,),
                    ],
                  ),
                ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: CachedNetworkImage(
                  height: AppConstants.itemHeight*0.15,
                  imageUrl:"https://cdn.iconscout.com/icon/free/png-256/free-avatar-370-456322.png?f=webp",
                  errorWidget: (context, url, error) => Image.asset(Images.placeholderImages,height: AppConstants.itemHeight*0.1,width: AppConstants.itemHeight*0.15,),
                  progressIndicatorBuilder: (context, url, downloadProgress) => const Center(child: CircularProgressIndicator(color: ColorResources.COLOR_PRIMERY,),),
                  fit: BoxFit.cover,
                  width: AppConstants.itemHeight*0.15,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
